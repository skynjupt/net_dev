#include "hls.h"


static hls_list_node_t g_m3u8_list[HLS_MAX_LIST_NODE_COUNT] = {0};
static hls_ts_node_t g_ts_list[HLS_MAX_TS_NODE_COUNT] = {0};

UINT8 m3u8_num = 0;
UINT8 ts_num = 0;

static int file_index = 0;

char *url_buffer_addr;

int hls_parse_m3u_url_playlist(char *url)
{
	url_buffer_addr = (char *)MALLOC(HLS_URL_BUFFER_SIZE);
	memset(g_m3u8_list, 0, sizeof(hls_list_node_t)*HLS_MAX_LIST_NODE_COUNT);
	memset(g_ts_list, 0, sizeof(hls_ts_node_t)*HLS_MAX_TS_NODE_COUNT);
	
	download_and_parse_m3u8(url, g_m3u8_list, g_ts_list);

}

void hls_player_close(void)
{
	int i;	

	if(url_buffer_addr)
	{
		free(url_buffer_addr);
		url_buffer_addr = NULL;
	}

	for(i=0; i < m3u8_num; i++)
	{
		if(g_m3u8_list[i].url != NULL)
		{
			HLS_PRINTF(">>>> url=%s\n",g_m3u8_list[i].url);
			free(g_m3u8_list[i].url);
			g_m3u8_list[i].url = NULL;
		}
	}

	for(i=0; i < ts_num; i++)
	{
		if(g_ts_list[i].url != NULL)
		{
			free(g_ts_list[i].url);
			g_ts_list[i].url = NULL;
		}
	}
} 

#define HLS_TEST_URL "http://46.20.4.42:80/powerturk/powerturk1/playlist.m3u8"

void sky_hls_test_main()
{
	int i;
	char filename[100];
	char *str1, *str2;

	HLS_PRINTF("--- Enter Function:sky_hls_test_main---\n");

	hls_parse_m3u_url_playlist(HLS_TEST_URL);
	for(i = 0; i < ts_num; i++)
	{
		str1 = strrchr(g_ts_list[i].url, '/');
		str1++;
		str2 = strchr(g_ts_list[i].url, '?');
		memset(filename, '\0', 100);
		strncpy(filename, str1, str2-str1);
		hls_curl_download_ext(g_ts_list[i].url, filename);		 
	}	
	hls_player_close();
	HLS_PRINTF("--- Leave Function:sky_hls_test_main---\n");
}
