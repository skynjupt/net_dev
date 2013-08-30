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

HLSMemoryInfo hls_global_memory_info;
static UINT8 global_init_flag = 0;

void sky_hls_global_init(void)
{
	if(global_init_flag == 0)
	{
		MEMSET(&hls_global_memory_info, 0, sizeof(hls_global_memory_info));
		global_init_flag = 1;
	}
}
void sky_hls_init(	hls_key_url_callback callback)
{
	if(hls_global_memory_info.url_buffer_addr == NULL)
	{
		hls_global_memory_info.url_buffer_addr = (char *)MALLOC(HLS_URL_BUFFER_SIZE);
		ASSERT(hls_global_memory_info.url_buffer_addr!=NULL);
	}
	if(hls_global_memory_info.playlist_data_addr == NULL)
	{
		hls_global_memory_info.playlist_data_addr = (char *)MALLOC(sizeof(hls_media_info));
		ASSERT(hls_global_memory_info.playlist_data_addr!=NULL);
	}
	if(hls_global_memory_info.cache_buffer_addr == NULL)
	{
		hls_global_memory_info.cache_buffer_addr = (char *)MALLOC(HLS_CACHE_BUFFER_SIZE);
		ASSERT(hls_global_memory_info.cache_buffer_addr!=NULL);
	}
	hls_global_memory_info.keyurl_callback = callback;
}

void sky_hls_playlist_free(UINT8 flag)
{
	hls_media_info *media = NULL;
	UINT32 i = 0;
	UINT32 j = 0;

	if(hls_global_memory_info.playlist_data_addr != NULL)
	{
		media = (hls_media_info *)(hls_global_memory_info.playlist_data_addr);
		for(i = 0; i < media->stream_num; i++)
		{
			for(j = 0; j < HLS_MAX_SECTION_NUM; j++)
			{
				if(media->hls_stream[i].section_info[j].section_url != NULL)
				{
					FREE(media->hls_stream[i].section_info[j].section_url);
					media->hls_stream[i].section_info[j].section_url = NULL;
				}
			}
			media->hls_stream[i].last_section_index = 0;
		}
		if(flag)
		{
			FREE(hls_global_memory_info.playlist_data_addr);
			hls_global_memory_info.playlist_data_addr = NULL;
		}
	}
}

void sky_hls_CleanUp(void)
{
	
	if(hls_global_memory_info.url_buffer_addr != NULL)
	{
		FREE(hls_global_memory_info.url_buffer_addr);
		hls_global_memory_info.url_buffer_addr = NULL;
	}
	sky_hls_playlist_free(1);
	if(hls_global_memory_info.cache_buffer_addr != NULL)
	{
		FREE(hls_global_memory_info.cache_buffer_addr);
		hls_global_memory_info.cache_buffer_addr = NULL;
	}
	hls_global_memory_info.keyurl_callback = NULL;
}

int hls_parse_m3u_url_playlist(char *url)
{
	hls_media_info *media = NULL;
	if(!url)
	{
		HLS_PRINTF("input error\n");
		return -1;
	}
	media = (hls_media_info *)(hls_global_memory_info.playlist_data_addr);
	MEMSET(media, 0, sizeof(hls_media_info));
	return download_and_parse_m3u8(url, media);
}

hls_media_info *hls_get_media_info(void)
{
	return  (hls_media_info *)(hls_global_memory_info.playlist_data_addr);
}

UINT32 hls_set_seek_position(UINT32 pos)
{
	hls_media_info *media = (hls_media_info *)(hls_global_memory_info.playlist_data_addr);
	UINT32 stream_pos_begin = 0;
	UINT32 stream_pos_end = 0;
	UINT32 i = 0;
	if(pos<media->hls_stream[0].stream_duration)
	{
		for(i=0; i<media->hls_stream[0].section_num; i++)
		{
			stream_pos_end += media->hls_stream[0].section_info[i].section_duration;
			if((pos>=stream_pos_begin) && (pos<=stream_pos_end))
			{
				media->seek_info.section_index = i;
				media->seek_info.seek_time = stream_pos_begin;
				break;
			}
			stream_pos_begin = stream_pos_end;
		}
	}
	HLS_PRINTF("hls_set_seek_position, goal pos=%d, real pos=%d\n", pos,stream_pos_begin);
	return stream_pos_begin;
}

void hls_reset_seek_position(void)
{
	hls_media_info *media = (hls_media_info *)(hls_global_memory_info.playlist_data_addr);
	media->seek_info.section_index = 0;
	media->seek_info.seek_time = 0;
	HLS_PRINTF("hls_set_seek_position\n");
}


