#include "hls_private.h"
#ifdef STD_LINUX

#else
#include <sys_config.h>
//common
#include <types.h>
#include <basic_types.h>
#include <mediatypes.h>
#include <api/libc/printf.h>
#include <api/libc/string.h>
#include <api/libc/time.h>
#include <api/libc/alloc.h>

#include <osal/osal.h>

//file system
#include <api/libfs2/types.h>
#include <api/libfs2/errno.h>
#include <api/libfs2/fcntl.h>
#include <api/libfs2/unistd.h>
#include <api/libfs2/stdio.h>
#include <api/libfs2/stat.h>

//xml2
#include <api/libxml2/xmlmemory.h>
#include <api/libxml2/parser.h>
#include <api/libxml2/parserInternals.h>
#include <api/libxml2/hash.h>
#include <api/libxml2/uri.h>
#include <api/libxml2/xmlautomata.h>
#include <api/libxml2/xmlregexp.h>

//lwip
#include <api/libtcpip/lwip/sockets.h>
#include <api/libtcpip/lwip/netdb.h>
#include <api/libtcpip/lwip/err.h>
#include <api/libtcpip/lwip/netif.h>
#include <api/libtcpip/lwip/dns.h>
#include <skyworth/curl/curl.h>
#include <skyworth/hls/hls.h>
#endif

typedef struct _memory_stream_info {
  char *begin;
  UINT32 size;
  UINT32 offset;
}memory_stream_info;

extern HLSMemoryInfo hls_global_memory_info;

static int hls_get_available_index(hls_media_stream* info)
{
	int i;
	hls_media_section_info *section_info;

	if(!info)
	{
		return -1;
	}
	
	section_info = info->section_info;
	
	for(i=1;i<HLS_MAX_SECTION_NUM;i++)
	{
		if((section_info[i].section_duration == 0)
			&& (section_info[i].section_url == NULL))
		{
			return i;
		}
	}

	//清空已经使用过的节点
	for(i=1;i<HLS_MAX_SECTION_NUM;i++)
	{
		if(section_info[i].is_used == 1)
		{
			HLS_PRINTF("--- free ts node: %d ---\n",i);
			if(section_info[i].section_url != NULL)
			{
				free(section_info[i].section_url);
				section_info[i].section_url = NULL;
			}
			memset(&section_info[i],0,sizeof(hls_media_section_info));
			info->section_num--;
		}
	}

	for(i=1;i<HLS_MAX_SECTION_NUM;i++)
	{
		if((section_info[i].section_duration == 0)
			&& (section_info[i].section_url == NULL))
		{
			return i;
		}
	}
	
	return -1;
}

int hls_get_ts_node_count(hls_media_section_info *section_info)
{
	int num = 0;
	int index = section_info[0].next_section_index;
	
	while(index != 0)
	{
		index = section_info[index].next_section_index;
		num++;
	}
	
	return num;
}

int hls_del_first_ts_node(hls_media_section_info *section_info)
{
	int ret = -1;
	int index,t;
	
	index = section_info[0].next_section_index;
	
	HLS_PRINTF(" --- Enter Function: hls_del_first_ts_node ---\n");
	
	if(section_info[index].is_used == 1)
	{
		t = section_info[index].next_section_index;
		if(section_info[index].section_url != NULL)
		{
			FREE(section_info[index].section_url);
			section_info[index].section_url = NULL;
		}
		MEMSET(&section_info[index], 0, sizeof(hls_media_section_info));
		section_info[0].next_section_index = t;
		ret = 0;
	}

	return ret;
}

static int memory_stream_readline(memory_stream_info *stream, char *linestr)
{
	UINT32 i;
	char *temp = NULL;
	if((!stream) || (!linestr) || !(stream->begin) || (stream->size == 0) || (stream->offset>=stream->size))
	{
		return -1;
	}
	if(stream->offset==(stream->size-1))
	{
		return 0;
	}
	temp = linestr;
	for(i=0; i<(stream->size-1-stream->offset); i++ )
	{
		if(i>=HLS_MAX_URL_LEN)
		{
			return -1;
		}
		if(*(stream->begin+stream->offset+i) == '\n')
		{
			break;
		}
		else if(*(stream->begin+stream->offset+i) != '\r')
		{
			*temp = *(stream->begin+stream->offset+i);
			temp++;
		}
	}
	*temp = '\0';
	stream->offset += (i+1);
	return 1;
}
static char* sk_strstr(char *memory, const char *str, UINT32 length)
{
	char *ptr = NULL;
	UINT32 len = 0;
	UINT32 i;
	len = strlen(str);
	for(i=0 ; i<length-len ; i++)
	{
		if((MEMCMP(memory+i, str, len)) == 0)
		{
			ptr = memory+i;
			break;
		}
	}
	return ptr;
}

static char* hls_m3u_tag_get_content(char *tagstr)
{
	char *temp = strchr(tagstr, ':');
	if(temp)
	{
		temp++;
	}
	return temp;
}

static int hls_m3u_tag_get_attribution(char *tagstr, char *attr, char *dest)
{
	char *temp1 = NULL;
	char *temp2 = strstr(tagstr, attr);
	if(temp2 == NULL)
	{
		return -1;
	}
	temp2 = temp2+strlen(attr); //ATTR=<attr>
	if(*temp2 != '=')
	{
		return -2;
	}
	temp2++;
	temp1 = dest;
	while((*temp2!='\n')&&(*temp2!='\r')&&(*temp2!='\0')&&(*temp2!=','))
	{
		*temp1 = *temp2;
		temp1++;
		temp2++;
	}
	*temp1 = '\0';
	return 0;
}

static int hls_m3u_tag_get_uriattr(char *tagstr, char *dest)
{
	char *temp1 = NULL;
	char *temp2 = strstr(tagstr, HLS_KEY_URI);
	if(temp2 == NULL)
	{
		return -1;
	}
	temp2 = temp2+strlen(HLS_KEY_URI); //ATTR=<attr>
	temp1 = dest;
	while((*temp2!='\n')&&(*temp2!='"')&&(*temp2!='\0')&&(*temp2!=','))
	{
		*temp1 = *temp2;
		temp1++;
		temp2++;
	}
	*temp1 = '\0';
	return 0;
}
static void hls_get_stream_tag_info(char *content, hls_stream_information *stream_info)
{
	char bandwidth[16];
	char programid[16];
	MEMSET(bandwidth, 0, sizeof(bandwidth));
	MEMSET(programid, 0, sizeof(programid));
	if(0 == hls_m3u_tag_get_attribution(content, HLS_STREAMINFO_PROGRAMID, programid))
	{
		stream_info->program_id = (UINT32)atoi(programid);
	}
	if(0 == hls_m3u_tag_get_attribution(content, HLS_STREAMINFO_BANDWIDTH, bandwidth))
	{
		stream_info->bandwidth= (UINT32)atoi(bandwidth);
	}					
	hls_m3u_tag_get_attribution(content, HLS_STREAMINFO_CODECS, stream_info->codecs);
	hls_m3u_tag_get_attribution(content, HLS_STREAMINFO_RESOLUTION, stream_info->resolution);
}
static int hls_get_iv_data(char *iv_hex, char *iv_char)
{
	int i;
	char temp;
	char *temp1 = NULL;
	for(i = 0; i < 2*HLS_MAX_AES_KEY_IV_LEN; i++)
	{
		temp = *(iv_hex+i);
		if(!(((temp>='0')&&(temp<='9'))||((temp>='A')&&(temp<='F'))||((temp>='a')&&(temp<='f'))))
		{
			return 0;
		}
	}
	for(i = 0; i < HLS_MAX_AES_KEY_IV_LEN; i++)
	{
		*(iv_char+i) = ((*(iv_hex+2*i))<<4)+(*(iv_hex+2*i+1));
	}
	*(iv_char+HLS_MAX_AES_KEY_IV_LEN) = '\0';
	return 1;
}
static void hls_get_key_tag_info(char *content, hls_encrypt_info *encrypt_info)
{
	char method[16];
	MEMSET(method, 0, sizeof(method));
	encrypt_info->encrypt_flag = 0;
	if(0 == hls_m3u_tag_get_attribution(content, HLS_KEY_METHOD, method))
	{
		if (STRCMP(method,HLS_KEY_METHOD_AES128) == 0)
		{
			if(0 == hls_m3u_tag_get_uriattr(content, encrypt_info->key_url))
			{
				if(strlen(encrypt_info->key_url)>0)
				{
					encrypt_info->encrypt_flag = 1;
					if(0 == hls_m3u_tag_get_attribution(content, HLS_KEY_IV, encrypt_info->key_iv))
					{
						if(strlen(encrypt_info->key_iv)>=34) //128 bit key:0xXXXXXXXXXXXXXXXX
						{
							hls_get_iv_data(encrypt_info->key_iv+2, encrypt_info->key_iv);
						}
					}
					if(hls_global_memory_info.keyurl_callback)
					{
						hls_global_memory_info.keyurl_callback(encrypt_info->key_url);
					}
				}
			}
		}
	}
}

static int hls_url_get_first_session(char *url, char *session)
{
	char *temp1 = NULL;
	char *temp2 = NULL;
	if((!url)||(!session)||(strlen(url)<3))
	{
		return -1;
	}
	temp1 = url;
	temp2 = session;
	*(temp2++) = *(temp1++);
	while((*temp1!='\0')&&(*temp1!='/')&&(*temp1!='?'))
	{
		*(temp2++) = *(temp1++);
	}
	*temp2 = '\0';
	return 0;
}
static int hls_merge_url(char *parent_url, char *child_url, char *desturl)
{
	char sessionstr[HLS_MAX_URL_LEN];
	UINT8 resvalue = -1;

	HLS_PRINTF(" --- Enter Function: hls_merge_url. --- \n");

	if(0 == MEMCMP(child_url, HLS_HTTP_URL_FLAG, strlen(HLS_HTTP_URL_FLAG)))
	{
		STRCPY(desturl, child_url);
		resvalue = 0;
	}
	else
	{
		if(hls_url_get_first_session(child_url, sessionstr) == 0)
		{
			char *begin = strstr(parent_url, sessionstr);
			if(begin)
			{
				resvalue = 0;
				strncpy(desturl,parent_url,begin-parent_url);
				strcat(desturl, child_url);
			}
			else
			{
				begin = strrchr(parent_url, '/');
				if(begin)
				{
					resvalue = 0;
					strncpy(desturl,parent_url,begin-parent_url+1);
					strcat(desturl, child_url);
				}
			}
		}
	}
	return resvalue;
}

static int hls_merge_url_ext(char *parent_url, char *child_url, char **desturl)
{
	char sessionstr[HLS_MAX_URL_LEN];
	UINT8 resvalue = -1;
	int len = 0;

	HLS_PRINTF(" --- Enter Function: hls_merge_url_ext. --- \n");

	if(0 == MEMCMP(child_url, HLS_HTTP_URL_FLAG, strlen(HLS_HTTP_URL_FLAG)))
	{
		len = strlen(child_url) + 1;
		*desturl = (char *) malloc(len);
		if(*desturl == NULL)
		{
			HLS_PRINTF("Function:hls_merge_url_ext, type 01 malloc failed.\n");
			return -1;
		}
		memset(*desturl,'\0', len);	
		STRCPY(*desturl, child_url);
		resvalue = 0;
	}
	else
	{
		if(hls_url_get_first_session(child_url, sessionstr) == 0)
		{
			char *begin = strstr(parent_url, sessionstr);
			if(begin)
			{
				resvalue = 0;
				len = strlen(child_url) + (begin-parent_url) + 1;
				*desturl = (char *) malloc(len);
				if(*desturl == NULL)
				{
					HLS_PRINTF("Function:hls_merge_url_ext, type 01 malloc failed.\n");
					return -1;
				}
				memset(*desturl,'\0', len);	
				
				strncpy(*desturl,parent_url,begin-parent_url);
				strcat(*desturl, child_url);
			}
			else
			{
				begin = strrchr(parent_url, '/');
				if(begin)
				{
					len = strlen(child_url) + (begin-parent_url+1) + 1;
					*desturl = (char *) malloc(len);
					if(*desturl == NULL)
					{
						HLS_PRINTF("Function:hls_merge_url_ext, type 01 malloc failed.\n");
						return -1;
					}
					memset(*desturl,'\0', len);
					resvalue = 0;
					strncpy(*desturl,parent_url,begin-parent_url+1);
					strcat(*desturl, child_url);
				}
			}
		}
	}
	return resvalue;
}

static int hls_parse_m3u_stream(memory_stream_info *stream, hls_media_stream *info, char *source_url)
{
	char *temp1,*temp2;
	char tempstr[HLS_MAX_URL_LEN];
	UINT8 e_flag = 0;
	int resvalue = -1;
	UINT32 duration;
	int section_index = -1;

	HLS_PRINTF(" --- Enter Function: hls_parse_m3u_stream. --- \n");
	
	if((!stream) || (!info) || !(stream->begin) || (stream->size == 0) || (stream->offset>=stream->size))
	{
		return -1;
	}
//	MEMSET(info,0,sizeof(hls_media_stream));
	info->stream_media_sequence = HLS_DEFAULT_MEDIA_SEQUENCE;
	while(stream->offset<stream->size-1)
	{
		MEMSET(tempstr,0,sizeof(tempstr));
		if(memory_stream_readline(stream, tempstr) <= 0) //stream end or error
		{
			break;
		}
		else
		{
			HLS_PRINTF(" --- Enter Function: hls_parse_m3u_stream readline: %s ---\n", tempstr);
			if(*tempstr == '#')  //comment or tags
			{
				if(MEMCMP(tempstr, HLS_EXTINF, strlen(HLS_EXTINF)) == 0)
				{
					temp1 = hls_m3u_tag_get_content(tempstr);
					if(temp1)
					{
						temp2 = strchr(temp1, ',');
						if(temp2)
						{
							*temp2 = '\0';
							duration = (UINT32)atoi(temp1);
							HLS_PRINTF("duration=%d\n",duration);
							e_flag = 1;
						}
					}
				}
				else if(MEMCMP(tempstr, HLS_TARGETDURATION, strlen(HLS_TARGETDURATION)) == 0)
				{
					temp1 = hls_m3u_tag_get_content(tempstr);
					if(temp1)
					{
						HLS_PRINTF("section max duration=%s\n", temp1);
						info->section_max_duration= (UINT32)atoi(temp1);
					}
				}
				else if(MEMCMP(tempstr, HLS_MEDIA_SEQUENCE, strlen(HLS_MEDIA_SEQUENCE)) == 0)
				{
					temp1 = hls_m3u_tag_get_content(tempstr);
					if(temp1)
					{
						HLS_PRINTF("media sequence=%s\n", temp1);
						info->stream_media_sequence= (UINT32)atoi(temp1);
					}
				}
				else if(MEMCMP(tempstr, HLS_KEY, strlen(HLS_KEY)) == 0)
				{
					temp1 = hls_m3u_tag_get_content(tempstr);
					if(temp1)
					{
						hls_get_key_tag_info(temp1, &(info->encypt_info));
					}
				}
				else if(MEMCMP(tempstr, HLS_ENDLIST, strlen(HLS_ENDLIST)) == 0)
				{
					HLS_PRINTF("playlist end\n");
					info->play_mode = PLAY_MODE_VOD;
					break;
				}
			}
#if 0
			else if(strlen(tempstr)>3) //URL
			{
				if(e_flag == 1)
				{
					info->section_info[info->section_num].section_url = (char *) malloc(HLS_MAX_URL_LEN);
					if(info->section_info[info->section_num].section_url == NULL)
					{
						HLS_PRINTF("Function:hls_parse_m3u_stream, malloc failed.\n");
						return -1;
					}
//					memset(info->section_info[info->section_num].section_url,"\0", HLS_MAX_URL_LEN);
					memset(info->section_info[info->section_num].section_url,'\0', HLS_MAX_URL_LEN);
					if(0 == hls_merge_url(source_url, tempstr, info->section_info[info->section_num].section_url))
					{
						HLS_PRINTF("url=%s\n",info->section_info[info->section_num].section_url);
						info->section_info[info->section_num].section_duration = duration;
						info->stream_duration+=info->section_info[info->section_num].section_duration;
						info->section_num++;
						e_flag = 0;
					}
				}
			}
#else
			else if(strlen(tempstr)>3) //URL
			{
				if(e_flag == 1)
				{
					section_index = hls_get_available_index(info);
					if(section_index < 0)
					{
						HLS_PRINTF("Function:hls_parse_m3u_stream, get available index failed.\n");
						return -1;					
					}
#if 0					
					info->section_info[section_index].section_url = (char *) malloc(HLS_MAX_URL_LEN);
					if(info->section_info[section_index].section_url == NULL)
					{
						HLS_PRINTF("Function:hls_parse_m3u_stream, malloc failed.\n");
						return -1;
					}
//					memset(info->section_info[info->section_num].section_url,"\0", HLS_MAX_URL_LEN);
					memset(info->section_info[section_index].section_url,'\0', HLS_MAX_URL_LEN);
					if(0 == hls_merge_url(source_url, tempstr, info->section_info[section_index].section_url))
#endif
					if(0 == hls_merge_url_ext(source_url, tempstr, &info->section_info[section_index].section_url))
					{
						HLS_PRINTF("section_index:%d, url=%s\n",section_index, info->section_info[section_index].section_url);
						info->section_info[section_index].section_duration = duration;
						info->stream_duration+=info->section_info[section_index].section_duration;
						info->section_num++;

						if(info->last_section_index >= 0)
						{
							info->section_info[info->last_section_index].next_section_index = section_index;
							info->last_section_index = section_index;
						}

#if 0
						/*fix bug: if stop, info->last_section_index may be not 0*/
						if(info->section_info[0].next_section_index == 0)
						{
							info->section_info[0].next_section_index = section_index;
						}
#endif						
						e_flag = 0;
					}
				}
			}
#endif
		}
	}
	if(info->section_num>0)
	{
		resvalue = 0;
	}
	return resvalue;
}

static int hls_parse_m3u_playlist(memory_stream_info *stream, hls_media_info *media, char *source_url)
{
	char *temp1,*temp2;
	char tempstr[HLS_MAX_URL_LEN];
	char sessionstr[HLS_MAX_URL_LEN];
	UINT8 e_flag = 0;
	int resvalue = -1;
	if((!stream) || (!media) || !(stream->begin) || (stream->size == 0) || (stream->offset>=stream->size))
	{
		return -1;
	}
	while(stream->offset<stream->size-1)
	{
		MEMSET(tempstr,0,sizeof(tempstr));
		MEMSET(sessionstr,0,sizeof(sessionstr));
		if(memory_stream_readline(stream, tempstr) <= 0) //stream end or error
		{
			break;
		}
		else
		{
			if(media->stream_num>HLS_MAX_STREAM_TYPE)
				break;
			if(*tempstr == '#')  //comment or tags
			{
				if(MEMCMP(tempstr, HLS_STREAMINFO, strlen(HLS_STREAMINFO)) == 0) //#EXT-X-STREAM-INF
				{
					temp1 = hls_m3u_tag_get_content(tempstr);
					if(temp1)
					{
						e_flag = 1;
						hls_get_stream_tag_info(temp1, &(media->hls_stream_info[media->stream_num]));
					}
				}
			}
			else if(strlen(tempstr)>3) //URL
			{
				if(e_flag == 1)
				{
					if(0 == hls_merge_url(source_url, tempstr, media->hls_stream_info[media->stream_num].url))
					{
						HLS_PRINTF("url=%s\n",media->hls_stream_info[media->stream_num].url);
						media->stream_num++;
						e_flag = 0;
					}
				}
			}
		}
	}
	if(media->stream_num > 0)
	{
		resvalue = 0;
	}
	return resvalue;
}

static int hls_parse_m3u_memory(memory_stream_info *stream, hls_media_stream *media_stream, char *source_url)
{
	int resvalue = -1;
	if((MEMCMP(stream->begin, HLS_EXTM3U, strlen(HLS_EXTM3U))) != 0)
	{
		HLS_PRINTF("invalid m3u content\n");
		return -2;
	}
	if(hls_parse_m3u_stream(stream, media_stream, source_url) == 0)
	{
		resvalue = 0;
	}
	return resvalue;
}

static void init_stream_data(memory_stream_info *stream, char *begin, UINT32 size)
{
	stream->begin = begin;
	stream->size = size;
	stream->offset = 0;
}

int download_and_parse_m3u8(char *url, hls_media_info * media)
{
	int returnvalue=-2;
	struct MemoryStruct htmldata;
	memory_stream_info stream;
	UINT32 i;
	UINT32  flag = 0;
	if(hls_curl_download(url, &htmldata) != 0)
	{
		return -3;
	}
	init_stream_data(&stream, htmldata.memory, htmldata.size);
	STRCPY(media->source_url, url);
	if(sk_strstr(htmldata.memory, HLS_EXTINF,htmldata.size)) //playlist file
	{
		if(0 == hls_parse_m3u_memory(&stream, &(media->hls_stream[0]), media->source_url))
		{
			returnvalue = 0;
			media->stream_num = 1;
		}
	}
	else  //playlist url
	{
		if(0 == hls_parse_m3u_playlist(&stream, media, media->source_url))
		{
			for(i = 0;i<media->stream_num;i++)
			{
				if(hls_curl_download(media->hls_stream_info[i].url, &htmldata) == 0)
				{
					init_stream_data(&stream, htmldata.memory, htmldata.size);
					MEMSET(&(media->hls_stream[i]),0,sizeof(hls_media_stream));
					if(0 == hls_parse_m3u_memory(&stream, &(media->hls_stream[i]), media->hls_stream_info[i].url))
					{
						flag++;
					}
				}

			}
		}
		if(flag == media->stream_num)
		{
			returnvalue = 0;
		}
	}
	
	return returnvalue;
}

int hls_update_ts_list(hls_media_info * media, INT16 index)
{
	int returnvalue = -1;
	UINT32 i;
	struct MemoryStruct htmldata;
	memory_stream_info stream;

	if(!media || (index < 0))
	{
		return -1;
	}

	if(hls_curl_download(media->hls_stream_info[index].url, &htmldata) == 0)
	{
		init_stream_data(&stream, htmldata.memory, htmldata.size);
		if(0 == hls_parse_m3u_memory(&stream, &(media->hls_stream[index]), media->hls_stream_info[index].url))
		{
			returnvalue = 0;
		}
	}

	return returnvalue;
}

int hls_read_m3u_file(char  *path, hls_playlist_info *playlist_info)
{
	char *temp1,*temp2;
	char tempstr[HLS_MAX_URL_LEN];
	UINT8 e_flag = 0;
	FILE *fs = NULL;
	UINT32 file_size = 0;
	memory_stream_info stream;
	
	if((!path) || (!playlist_info))
	{
		return -1;
	}

	fs = fopen(path, "rb");
	if(fs==NULL)
	{
		HLS_PRINTF("open file failed\n");
		return -2;
	}
	fseek(fs,0,SEEK_END);
	file_size = ftell(fs);
	fseek(fs,0,SEEK_SET);

	if(file_size>HLS_URL_BUFFER_SIZE)
	{
		fclose(fs);
		return -3;
	}
  	fread(hls_global_memory_info.url_buffer_addr, 1, file_size, fs);

	init_stream_data(&stream, hls_global_memory_info.url_buffer_addr, file_size);

	MEMSET(playlist_info,0,sizeof(hls_playlist_info));
	while(stream.offset<stream.size-1)
	{
		MEMSET(tempstr,0,sizeof(tempstr));
		if(memory_stream_readline(&stream, tempstr) <= 0) //stream end or error
		{
			break;
		}
		else
		{
			if(*tempstr == '#')  //comment or tags
			{
				if(MEMCMP(tempstr, HLS_EXTINF, strlen(HLS_EXTINF)) == 0)
				{
					temp1 = hls_m3u_tag_get_content(tempstr);
					if(temp1)
					{
						temp2 = strchr(temp1, ' ');
						if(temp2)
						{
							temp2++;
							STRCPY(playlist_info->playlist[playlist_info->playlist_num].description, temp2);
							HLS_PRINTF("description=%s\n", temp2);
							e_flag = 1;
						}
					}
				}
			}
			else if(strlen(tempstr)>3) //URL
			{
				if(e_flag == 1)
				{
					STRCPY(playlist_info->playlist[playlist_info->playlist_num].play_url, tempstr);
					HLS_PRINTF("url=%s\n", tempstr);
					playlist_info->playlist_num++;
					if(playlist_info->playlist_num >= HLS_MAX_PLAYLIST_NUM)
					{
						break;
					}
					e_flag = 0;
				}
			}
		}
	}
	fclose(fs);
	return 0;
}


