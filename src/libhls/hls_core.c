#include <pthread.h>
#include "hls.h"


static hls_list_node_t g_m3u8_list[HLS_MAX_LIST_NODE_COUNT] = {0};
static hls_ts_node_t g_ts_list[HLS_MAX_TS_NODE_COUNT] = {0};

UINT8 m3u8_num = 0;
UINT8 ts_num = 0;
pthread_t download_file_tid;

typedef enum
{
	HLS_THREAD_FLAG_NONE=0,
	HLS_THREAD_FLAG_STOP,
	HLS_THREAD_FLAG_GO,
	HLS_THREAD_FLAG_PAUSE,
	HLS_THREAD_FLAG_COUNT
} hls_thread_flag_t;

static hls_thread_flag_t file_thread_flag = HLS_THREAD_FLAG_NONE;

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
#define FILE_NAME_DIR	"./TS/"
#define FILE_NAME_MAX_LEN	100

void* sky_hls_download_file(void *argc)
{
	int i, len;
	char filename[FILE_NAME_MAX_LEN];
	char tmp_str[FILE_NAME_MAX_LEN];
	char *str1, *str2;
	int last_download_index=-1;	
	struct MemoryStruct htmldata;
	memory_stream_info stream;	

	HLS_PRINTF("Enter File Download Thread:%u.\n", pthread_self());

#if 0
	for(i = 0; i < ts_num; i++)
	{
		str1 = strrchr(g_ts_list[i].url, '/');
		str1++;
		str2 = strchr(g_ts_list[i].url, '?');
		memset(tmp_str, '\0', FILE_NAME_MAX_LEN);
		strncpy(tmp_str, str1, str2-str1);
		memset(filename, '\0', FILE_NAME_MAX_LEN);
		len = sprintf(filename, "%s", FILE_NAME_DIR);
		sprintf(filename+len, "%s", tmp_str);

		HLS_PRINTF("Begin Downloading File:%s.\n", tmp_str);
		hls_curl_download_ext(g_ts_list[i].url, filename);
	}
#else
	while(file_thread_flag != HLS_THREAD_FLAG_NONE)
	{
		if(file_thread_flag == HLS_THREAD_FLAG_GO)
		{
			HLS_PRINTF("now file_index:%d.\n", file_index);
			if(g_ts_list[file_index].url!=NULL)
			{			
				str1 = strrchr(g_ts_list[file_index].url, '/');
				str1++;
				str2 = strchr(g_ts_list[file_index].url, '?');
				memset(tmp_str, '\0', FILE_NAME_MAX_LEN);
				strncpy(tmp_str, str1, str2-str1);
				memset(filename, '\0', FILE_NAME_MAX_LEN);
				len = sprintf(filename, "%s", FILE_NAME_DIR);
				sprintf(filename+len, "%s", tmp_str);

				HLS_PRINTF("Begin Downloading File:%s.\n", tmp_str);
				if(hls_curl_download_ext(g_ts_list[file_index].url, filename) == 0)
				{
					g_ts_list[file_index].bIsUsed=1;
					last_download_index = file_index;
					file_index = g_ts_list[file_index].uNextNodeIndex;
				}
			}

			if(file_index==0)
			{
				for(i = 0; i < m3u8_num; i++)
				{
					if(hls_curl_download(g_m3u8_list[i].url, &htmldata) == 0)
					{
						init_stream_data(&stream, htmldata.memory, htmldata.size);
						if(0 == hls_parse_m3u_stream(&stream, g_ts_list, g_m3u8_list[i].url))
						{
							HLS_PRINTF("step1.\n");
							if(last_download_index >=0 && g_ts_list[last_download_index].uNextNodeIndex!=0)
							{
								HLS_PRINTF("step2.\n");
								file_index = g_ts_list[last_download_index].uNextNodeIndex;
							}
							else
							{
								HLS_PRINTF("step3.\n");
								file_index = g_ts_list[0].uNextNodeIndex;						
							}
						}
					}
				}
			}
		}
	}

	
#endif

	HLS_PRINTF("Exit File Download Thread:%u.\n", pthread_self());
	pthread_exit(NULL);
}

void sky_hls_test_main()
{
	HLS_PRINTF("--- Enter Function:sky_hls_test_main---\n");
	
	hls_parse_m3u_url_playlist(HLS_TEST_URL);

	file_index = g_ts_list[0].uNextNodeIndex;
	file_thread_flag = HLS_THREAD_FLAG_GO;

	if(pthread_create(&download_file_tid, NULL, sky_hls_download_file, NULL) != 0)
	{
		HLS_PRINTF("create pthread_create:download_file_tid error\n");
	}

	if(pthread_join(download_file_tid, NULL) != 0)
	{
		HLS_PRINTF("pthread_join:download_file_tid error\n");
	}
	
	hls_player_close();

	HLS_PRINTF("--- Leave Function:sky_hls_test_main---\n");
}
