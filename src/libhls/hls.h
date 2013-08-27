#ifndef _HLS_H_
#define _HLS_H_

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define HLS_DEBUG
#ifdef HLS_DEBUG
#define HLS_PRINTF  printf
#else
#define HLS_PRINTF(...)	do{}while(0)
#endif

#define UINT32 unsigned int
#define UINT8 unsigned char

#define HLS_MAX_URL_LEN 1024

#define HLS_MAX_LIST_NODE_COUNT 5
#define HLS_MAX_TS_NODE_COUNT 2048

#define HLS_URL_BUFFER_SIZE (200*256) 
typedef struct hls_list_node_s
{
	UINT32 bandwidth;
	UINT32 program_id;
	UINT32 video_width;
	UINT32 video_height;
	char *url;
}hls_list_node_t;

typedef struct hls_ts_node_s
{
	char* url;
	UINT32 section_duration;
	UINT32 uNextNodeIndex;
	UINT8 bIsUsed;
}hls_ts_node_t;

struct MemoryStruct {
  char *memory;
  size_t size;
};

#define HLS_STREAMINFO "#EXT-X-STREAM-INF"
#define HLS_STREAMINFO_BANDWIDTH "BANDWIDTH"
#define HLS_STREAMINFO_PROGRAMID "PROGRAM-ID"
#define HLS_EXTINF "#EXTINF"
#define HLS_TARGETDURATION "#EXT-X-TARGETDURATION"
#define HLS_MEDIA_SEQUENCE  "#EXT-X-MEDIA-SEQUENCE"
#define HLS_KEY "#EXT-X-KEY"
#define HLS_ENDLIST "#EXT-X-ENDLIST"


#define HLS_HTTP_URL_FLAG "http://"


extern char *url_buffer_addr;

extern UINT8 m3u8_num;
extern UINT8 ts_num;

#define MEMSET memset
#define MALLOC malloc
#define STRCPY strcpy
#define MEMCMP memcmp

void sky_hls_test_main(void);
#endif


