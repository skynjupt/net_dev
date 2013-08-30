
#ifndef __HEADER_GMAP_PRIVATE
#define __HEADER_GMAP_PRIVATE

#define STD_LINUX

#define HLS_DEBUG
#ifdef HLS_DEBUG
#ifdef STD_LINUX	printf
#else
#define HLS_PRINTF  libc_printf
#endif
#else
#define HLS_PRINTF(...)	do{}while(0)
#endif
//#define HLS_USE_CYASSL

//HLS cache buffer
//cache buffer = net temp buffer(one block)+aes temp buffer(one block)+cache
#define HLS_CACHE_BLOCK_SIZE (32*1024)  //as aes-128 block size is 16byte
#define HLS_NET_TEMP_BUFFER_OFFSET 0
#define HLS_NET_TEMP_BUFFER_SIZE HLS_CACHE_BLOCK_SIZE
#define HLS_AES_TEMP_BUFFER_OFFSET (HLS_NET_TEMP_BUFFER_OFFSET+HLS_NET_TEMP_BUFFER_SIZE)
#define HLS_AES_TEMP_BUFFER_SIZE HLS_NET_TEMP_BUFFER_SIZE
#define HLS_CACHE_BUFFER_OFFSET (HLS_AES_TEMP_BUFFER_OFFSET+HLS_AES_TEMP_BUFFER_SIZE)

#define HLS_URL_BUFFER_SIZE (200*256)
#define HLS_CACHE_BUFFER_SIZE (16*HLS_CACHE_BLOCK_SIZE)

//hls flag
#define HLS_EXTM3U "#EXTM3U"
#define HLS_EXTINF "#EXTINF"
#define HLS_TARGETDURATION "#EXT-X-TARGETDURATION"
#define HLS_MEDIA_SEQUENCE  "#EXT-X-MEDIA-SEQUENCE"
#define HLS_KEY "#EXT-X-KEY"
#define HLS_KEY_METHOD "METHOD"
#define HLS_KEY_METHOD_AES128 "AES-128"
#define HLS_KEY_URI "URI=\""
#define HLS_KEY_IV "IV"
#define HLS_ENDLIST "#EXT-X-ENDLIST"
#define HLS_STREAMINFO "#EXT-X-STREAM-INF"
#define HLS_STREAMINFO_BANDWIDTH "BANDWIDTH"
#define HLS_STREAMINFO_PROGRAMID "PROGRAM-ID"
#define HLS_STREAMINFO_CODECS "CODECS"
#define HLS_STREAMINFO_RESOLUTION "RESOLUTION"
#define HLS_HTTP_URL_FLAG "http://"

#define HLS_DEFAULT_MEDIA_SEQUENCE 1

#ifdef STD_LINUX
#define HLS_MUTEX_CREATE 	pthread_mutex_init
#define HLS_MUTEX_LOCK 		pthread_mutex_lock
#define HLS_MUTEX_UNLOCK	pthread_mutex_unlock
#define HLS_MUTEX_DELETE	pthread_mutex_destory

#define S_WRITE(s, data, size) \
			write(s, data, size)

#define S_READ(s, data, size) \
			read(s, data, size)

#define S_CLOSE(s) \
			close(s)

#else
#define HLS_MUTEX_CREATE osal_mutex_create
#define HLS_MUTEX_LOCK osal_mutex_lock
#define HLS_MUTEX_UNLOCK osal_mutex_unlock
#define HLS_MUTEX_DELETE osal_mutex_delete

#define S_WRITE(s, data, size) \
			lwip_write(s, data, size)

#define S_READ(s, data, size) \
			lwip_read(s, data, size)

#define S_CLOSE(s) \
			lwip_close(s)
#endif
			
struct MemoryStruct {
  char *memory;
  size_t size;
};

typedef struct _HLSMemoryInfo {
	char *url_buffer_addr;
	char *playlist_data_addr;
	char *cache_buffer_addr;
	hls_key_url_callback keyurl_callback;
}HLSMemoryInfo;

enum HLSPlayState {
	HLS_STATE_PLAY = 0,
	HLS_STATE_STOP,
	HLS_STATE_PAUSE,
};

int download_and_parse_m3u8(char *url, hls_media_info * media);

#endif

