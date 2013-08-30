#ifndef _HLS_H
#define _HLS_H

#include <skyworth/libnet/sk_url.h>

//此文件中的内容请不要修改，除非你编译HLS 库

#define HLS_MAX_URL_LEN 512
#define HLS_MAX_URL_DESCRIPTION_LEN 128
#define HLS_MAX_PLAYLIST_NUM 64
#define HLS_MAX_KEY_IV_LEN 64
#define HLS_MAX_STREAM_TYPE 3
#define HLS_MAX_SECTION_NUM 1000
#define HLS_MAX_CODECS_LEN 256
#define HLS_MAX_RESOLUTION_LEN 16
#define HLS_MAX_AES_KEY_IV_LEN 16 //128bit aes

#define HLS_NET_RETRY_MAXSLEEP	128
#define HLS_LIVE_TS_NOTE_MAX	20

#define HLS_PE_CACHE_URL "http://www.skyworth.com/hls.ts"

typedef enum {
	STATUS_CLOSED = 0,
	STATUS_OPENED,
	STATUS_STOPED,
} hls_buffer_status;

typedef enum {
	RESOLUTION_NORMAL = 0,
	RESOLUTION_HIGH,
	MAX_RESOLUTION_TYPE,
} hls_resolution_status;

typedef void(*hls_key_url_callback)(char *url);

#if 0
typedef struct _hls_media_section_info {
	UINT32 section_duration;
	char section_url[HLS_MAX_URL_LEN];
}hls_media_section_info;
#else
typedef struct _hls_media_section_info {
	UINT32 section_duration;
	char *section_url;
	UINT32 is_used;
	UINT32 next_section_index;
}hls_media_section_info;
#endif

typedef enum {
	PLAY_MODE_LIVE = 0,
	PLAY_MODE_VOD,
	PLAY_MODE_NUM,
}hls_play_mode_e;

typedef struct _hls_encrypt_info {
	UINT32 encrypt_flag;
	char key_url[HLS_MAX_URL_LEN];
	char key_iv[HLS_MAX_KEY_IV_LEN];
}hls_encrypt_info;

typedef struct _hls_media_stream {
	UINT32 section_num;
	UINT32 last_section_index;
	UINT32 stream_duration;
	UINT32 section_max_duration;
	UINT32 stream_media_sequence;
	hls_encrypt_info encypt_info;
	hls_play_mode_e play_mode;
	hls_media_section_info section_info[HLS_MAX_SECTION_NUM];
}hls_media_stream;

typedef struct _hls_playlist {
	char  description[HLS_MAX_URL_DESCRIPTION_LEN];
	char play_url[HLS_MAX_URL_LEN];
}hls_playlist;

typedef struct _hls_playlist_info {
	UINT32 playlist_num;
	hls_playlist playlist[HLS_MAX_PLAYLIST_NUM];
}hls_playlist_info;

typedef struct _hls_stream_information {
	UINT32 bandwidth;
	UINT32 program_id;
	char codecs[HLS_MAX_CODECS_LEN];
	char resolution[HLS_MAX_RESOLUTION_LEN];
	char url[HLS_MAX_URL_LEN];
}hls_stream_information;

typedef struct _hls_stream_seek_info {
	UINT32 seek_time;
	UINT32 section_index;
}hls_stream_seek_info;

typedef struct _hls_media_info {
	char source_url[HLS_MAX_URL_LEN];
	UINT32 stream_num;
	hls_stream_seek_info seek_info;
	hls_stream_information hls_stream_info[HLS_MAX_STREAM_TYPE];
	hls_media_stream hls_stream[HLS_MAX_STREAM_TYPE];
}hls_media_info;

typedef struct _hls_iptv_buffer {
	unsigned int buffer_start;
	unsigned int buffer_size;
	unsigned int write_pos;
	unsigned int read_pos;
	hls_buffer_status buffer_status;
	ID buffer_mutex;
}hls_iptv_buffer;

typedef struct _hls_resolution_control {
	UINT16 switch_enable;
	UINT16 current_stream_index;
	UINT64 section_download_size;
	UINT64 section_download_time;
}hls_resolution_control;

typedef struct _hls_decrypt_info {
	UINT32 decrypt_flag;
	char user_key[HLS_MAX_AES_KEY_IV_LEN];
	char user_iv[HLS_MAX_AES_KEY_IV_LEN];
}hls_decrypt_info;

typedef struct _hls_decrypt_control {
	hls_decrypt_info decrypt_info[HLS_MAX_STREAM_TYPE];
}hls_decrypt_control;

typedef struct _hls_iptv_playcontrol {
	hls_media_info *media_info;
	UINT32 section_index;
	hls_resolution_control res_control;
	hls_decrypt_control decrypt_control;
	hls_iptv_buffer buffer;
	UrlResource *rsrc;
}hls_iptv_playcontrol;

void sky_hls_global_init(void);
void sky_hls_init(	hls_key_url_callback callback);
void sky_hls_CleanUp(void);
int hls_parse_m3u_url_playlist(char *url);
hls_media_info *hls_get_media_info(void);
void hls_net_user_abort(void);
void hls_net_user_pause(void);
void hls_net_user_play(void);
void hls_set_user_video_resolution(UINT8 resolution);
UINT32 hls_set_seek_position(UINT32 pos);
void hls_reset_seek_position(void);
int hls_read_m3u_file(char  *path, hls_playlist_info *playlist_info);
#endif


