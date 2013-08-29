
#include "hls.h"

static int g_last_sequnce=-1;
static int last_index=0;

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

void init_stream_data(memory_stream_info *stream, char *begin, UINT32 size)
{
	stream->begin = begin;
	stream->size = size;
	stream->offset = 0;
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

static void hls_get_stream_tag_info(char *content, hls_list_node_t *p_m3u_list)
{
	char bandwidth[16];
	char programid[16];
	
	MEMSET(bandwidth, 0, sizeof(bandwidth));
	MEMSET(programid, 0, sizeof(programid));
	
	if(0 == hls_m3u_tag_get_attribution(content, HLS_STREAMINFO_PROGRAMID, programid))
	{
		p_m3u_list->program_id = (UINT32)atoi(programid);
	}
	if(0 == hls_m3u_tag_get_attribution(content, HLS_STREAMINFO_BANDWIDTH, bandwidth))
	{
		p_m3u_list->bandwidth= (UINT32)atoi(bandwidth);
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

static int hls_merge_url(char *parent_url, char *child_url, char **desturl)
{
	char sessionstr[HLS_MAX_URL_LEN];
	UINT8 resvalue = -1;
	if(0 == MEMCMP(child_url, HLS_HTTP_URL_FLAG, strlen(HLS_HTTP_URL_FLAG)))
	{
	//	*desturl = (char *)malloc(strlen(child_url)+1);
		*desturl = (char *)malloc(HLS_MAX_URL_LEN);
		memset(*desturl, '\0', HLS_MAX_URL_LEN);
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
//				*desturl = (char *)malloc(strlen(child_url)+(begin-parent_url)+1);
				*desturl = (char *)malloc(HLS_MAX_URL_LEN);
				memset(*desturl, '\0', HLS_MAX_URL_LEN);
				strncpy(*desturl,parent_url,begin-parent_url);
				strcat(*desturl, child_url);
			}
			else
			{
				begin = strrchr(parent_url, '/');
				if(begin)
				{
					resvalue = 0;
	//				*desturl = (char *)malloc(strlen(child_url)+(begin-parent_url+1)+1);
					*desturl = (char *)malloc(HLS_MAX_URL_LEN);
					memset(*desturl, '\0', HLS_MAX_URL_LEN);
					strncpy(*desturl,parent_url,begin-parent_url+1);
					strcat(*desturl, child_url);
				}
			}
		}
	}
	return resvalue;
}



static int hls_parse_m3u_playlist(memory_stream_info *stream, hls_list_node_t *p_m3u_list, char *source_url)
{
	char *temp1,*temp2;	
	char tempstr[HLS_MAX_URL_LEN];
	UINT8 e_flag = 0;	
	
	if((!stream) || (!p_m3u_list) || !(stream->begin) || (stream->size == 0) || (stream->offset>=stream->size))
	{
		return -1;
	}

	while(stream->offset < stream->size-1)
	{
		MEMSET(tempstr,0,sizeof(tempstr));
		if(memory_stream_readline(stream, tempstr) <= 0) //stream end or error
		{
			break;
		}
		else
		{
			if(m3u8_num >= HLS_MAX_LIST_NODE_COUNT)
			{
				break;
			}
			if(*tempstr == '#')  //comment or tags
			{
				if(MEMCMP(tempstr, HLS_STREAMINFO, strlen(HLS_STREAMINFO)) == 0) //#EXT-X-STREAM-INF
				{
					temp1 = hls_m3u_tag_get_content(tempstr);
					if(temp1)
					{
						e_flag = 1;
						hls_get_stream_tag_info(temp1, &p_m3u_list[m3u8_num]);
					}
				}
			}
			else if(strlen(tempstr)>3) //URL
			{
				if(e_flag == 1)
				{
					if(0 == hls_merge_url(source_url, tempstr, &p_m3u_list[m3u8_num].url))
					{
						HLS_PRINTF("url=%s\n",p_m3u_list[m3u8_num].url);
						e_flag = 0;
						m3u8_num++;
					}
				}
			}
		}
	}

	return 1;
}


int hls_get_available_index(hls_ts_node_t* g_ts_list)
{
	int i;
	
	for(i=1;i<HLS_MAX_TS_NODE_COUNT;i++)
	{
		if(g_ts_list[i].section_duration == 0)
		{
			return i;
		}
	}

	//清空已经使用过的节点
	for(i=1;i<HLS_MAX_TS_NODE_COUNT;i++)
	{
		if(g_ts_list[i].bIsUsed==1)
		{
			HLS_PRINTF("--- free ts node: %d ---\n",i);
			if(g_ts_list[i].url!=NULL)
			{
				free(g_ts_list[i].url);
				g_ts_list[i].url=NULL;
			}
			memset(&g_ts_list[i],0,sizeof(hls_ts_node_t));
			ts_num--;
		}
	}

	for(i=1;i<HLS_MAX_TS_NODE_COUNT;i++)
	{
		if(g_ts_list[i].section_duration==0)
		{
			return i;
		}
	}
	return -1;
}

int hls_parse_m3u_stream(memory_stream_info *stream, hls_ts_node_t *p_ts_list, char *source_url)
{
	char *temp1,*temp2;
	char tempstr[HLS_MAX_URL_LEN];
	UINT8 e_flag = 0;
	int resvalue = -1;
	int list_index = 0;
	char is_first_parse = 0;
	char bIsExist = 0;
	int ts_durtime=0;

	
	if((!stream) || (!p_ts_list) || !(stream->begin) || (stream->size == 0) || (stream->offset>=stream->size))
	{
		return -1;
	}

	if(p_ts_list[0].uNextNodeIndex == 0)
	{
		is_first_parse = 1;
	}
	
	while(stream->offset < stream->size-1)
	{
		MEMSET(tempstr,0,sizeof(tempstr));
		if(memory_stream_readline(stream, tempstr) <= 0) //stream end or error
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
						temp2 = strchr(temp1, ',');
						if(temp2)
						{
							*temp2 = '\0';
							ts_durtime = (UINT32)atoi(temp1);
//							p_ts_list[ts_num].section_duration= (UINT32)atoi(temp1);
							HLS_PRINTF("duration=%d\n",ts_durtime);
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
					}
				}
				else if(MEMCMP(tempstr, HLS_MEDIA_SEQUENCE, strlen(HLS_MEDIA_SEQUENCE)) == 0)
				{
					temp1 = hls_m3u_tag_get_content(tempstr);
					if(temp1)
					{
						HLS_PRINTF("media sequence=%s\n", temp1);
					}
				}
				else if(MEMCMP(tempstr, HLS_KEY, strlen(HLS_KEY)) == 0)
				{
					temp1 = hls_m3u_tag_get_content(tempstr);
					if(temp1)
					{
//						hls_get_key_tag_info(temp1, &(info->encypt_info));
					}
				}
				else if(MEMCMP(tempstr, HLS_ENDLIST, strlen(HLS_ENDLIST)) == 0)
				{
					HLS_PRINTF("playlist end\n");
					break;
				}
			}
			else if(strlen(tempstr)>3) //URL
			{
				if(e_flag == 1)
				{

					list_index = hls_get_available_index(p_ts_list);
					if(list_index == -1)
					{
						HLS_PRINTF("Error: hls_get_available_index,not available index\n");
					}
					
					//检测是否有重复
					if(!is_first_parse)
					{
						int tmp=0;
						while(p_ts_list[tmp].uNextNodeIndex!=0)
						{
							tmp=p_ts_list[tmp].uNextNodeIndex;
							if(p_ts_list[tmp].url != NULL)
							{
								if(strcmp(p_ts_list[tmp].url,tempstr)==0)
								{
									HLS_PRINTF("=======url '%s' already exist,p_ts_list[%d].url=%s=======\n",tempstr,tmp,p_ts_list[tmp].url);
									bIsExist=1;
									break;
								}
							}
							else
							{
								break;
							}
						}
					}
				
					if(bIsExist!=1)
					{
						
						HLS_PRINTF(">>>> list_index=%d\n",list_index);
						HLS_PRINTF(">>>> source_url url=%s\n",source_url);
						HLS_PRINTF(">>>> tempstr url=%s\n",tempstr);
						if(0 == hls_merge_url(source_url, tempstr, &p_ts_list[list_index].url))
						{
							HLS_PRINTF("url=%s\n",p_ts_list[list_index].url);
							ts_num++;
							e_flag = 0;
						}
						
						if(last_index!=-1)
						{
							p_ts_list[last_index].uNextNodeIndex=list_index;
						}
						last_index=list_index;
						p_ts_list[last_index].uNextNodeIndex = 0;
						p_ts_list[list_index].section_duration=ts_durtime;
					}
/*					
					if(0 == hls_merge_url(source_url, tempstr, &p_ts_list[list_index].url))
					{
						HLS_PRINTF("url=%s\n",p_ts_list[ts_num].url);
						ts_num++;
						e_flag = 0;
					}

*/					
				}
			}
		}
	}	

	return 0;
}

int download_and_parse_m3u8(char *url, hls_list_node_t *p_m3u_list, hls_ts_node_t *p_ts_list)
{
	struct MemoryStruct htmldata;
	memory_stream_info stream;
	int i;
	UINT32  flag = 0;

	if(hls_curl_download(url, &htmldata) != 0)
	{
		return -3;
	}
	
	init_stream_data(&stream, htmldata.memory, htmldata.size);
	hls_parse_m3u_playlist(&stream, p_m3u_list, url);

	for(i = 0; i < m3u8_num; i++)
	{
		if(hls_curl_download(p_m3u_list[i].url, &htmldata) == 0)
		{
			init_stream_data(&stream, htmldata.memory, htmldata.size);
			if(0 == hls_parse_m3u_stream(&stream, p_ts_list, p_m3u_list[i].url))
			{
				flag++;
			}
		}

	}
		
	return 0;
}

