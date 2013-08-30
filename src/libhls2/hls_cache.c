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
#include "hls_private.h"
#include <skyworth/libnet/sknet.h>
#ifdef HLS_USE_CYASSL
#include <skyworth/cyassl/ctaocrypt/aes.h>
#else
#include <skyworth/openssl/aes.h>
#endif
#include <api/libsi/si_tdt.h>
#include "../../../prj/app/demo/dvbs/sabbat_dual/copper_common/com_api.h"
#endif

extern HLSMemoryInfo hls_global_memory_info;
static UINT8 hls_play_state = HLS_STATE_STOP;
static UINT8 hls_user_video_resolution = RESOLUTION_NORMAL;
static UINT32 hls_pause_count = 0; //added for fix pause issue:when pause for a long time, we could not connect to next chunk
#if 0
static void iptv_dump_section_data_to_usb(void *ptr, size_t size, int index)
{
	char file[100];
	sprintf(file,"/c/test/media_%d.ts", index);  
	FILE *fs = fopen(file, "ab+");
	if(fs)
	{
		fwrite(ptr, size, 1, fs);
		fclose(fs);
	}
}
static void iptv_dump_all_data_to_usb(char *file, void *ptr, size_t size)
{
	FILE *fs = fopen(file, "ab+");
	if(fs)
	{
		fwrite(ptr, size, 1, fs);
		fclose(fs);
		fs_sync(file);
	}
}
#endif
static void hls_buffer_init(hls_iptv_buffer *buffer)
{
	MEMSET(buffer, 0, sizeof(hls_iptv_buffer));
	buffer->buffer_start = (unsigned int)((char *)(hls_global_memory_info.cache_buffer_addr+HLS_CACHE_BUFFER_OFFSET));
	buffer->buffer_size = HLS_CACHE_BUFFER_SIZE-HLS_CACHE_BUFFER_OFFSET;
	buffer->buffer_status = STATUS_CLOSED;
	buffer->buffer_mutex = HLS_MUTEX_CREATE();
	ASSERT(buffer->buffer_mutex != INVALID_ID);
}
static void hls_buffer_stop(hls_iptv_buffer *buffer)
{
	HLS_MUTEX_LOCK(buffer->buffer_mutex, OSAL_WAIT_FOREVER_TIME);
	buffer->buffer_status = STATUS_STOPED;
	HLS_MUTEX_UNLOCK(buffer->buffer_mutex);
}
static void hls_buffer_destroy(hls_iptv_buffer *buffer)
{
	HLS_MUTEX_DELETE(buffer->buffer_mutex);
}
static int is_hls_buffer_end(hls_iptv_buffer *buffer)
{
	int resvalue = 0;
	HLS_MUTEX_LOCK(buffer->buffer_mutex, OSAL_WAIT_FOREVER_TIME);
	if((buffer->buffer_status == STATUS_STOPED) && (buffer->write_pos == buffer->read_pos))
		resvalue = 1;
	HLS_MUTEX_UNLOCK(buffer->buffer_mutex);
	return resvalue;
}
static UINT8 is_stream_resolution_switch_enabled(hls_media_info *media_info)
{
	UINT32 i;
	if(media_info->stream_num>1) //more than one resollution
	{
		for(i = 0; i<media_info->stream_num; i++)
		{
			if(media_info->hls_stream_info[i].bandwidth < 8000) //less than 8000bit/s is useless
			{
				return 0;
			}
		}
		return 1;//all bandwidth is usefull
	}
	return 0;
}
static UINT16 hls_get_min_resolution_stream(hls_media_info *media_info)
{
	UINT16 i = 0;
	UINT16 index = 0;
	UINT32 bandwidth = 0xffffffff;
	for(i = 0; i< media_info->stream_num; i++)
	{
		if(media_info->hls_stream_info[i].bandwidth<bandwidth)
		{
			index = i;
			bandwidth = media_info->hls_stream_info[i].bandwidth;
		}
	}
	return index;
}
static UINT16 hls_get_max_resolution_stream(hls_media_info *media_info)
{
	UINT16 i = 0;
	UINT16 index = 0;
	UINT32 bandwidth = 0;
	for(i = 0; i< media_info->stream_num; i++)
	{
		if(media_info->hls_stream_info[i].bandwidth>bandwidth)
		{
			index = i;
			bandwidth = media_info->hls_stream_info[i].bandwidth;
		}
	}
	return index;
}
static UINT16 hls_get_setting_resolution(hls_media_info *media_info)
{
	UINT16 index = 0;
	if(media_info->stream_num<=1) //only one stream,no choice
	{
		index = 0;
	}
	else
	{
		if(hls_user_video_resolution == RESOLUTION_NORMAL)
		{
			index = hls_get_min_resolution_stream(media_info);
		}
		else //RESOLUTION_HIGH
		{
			index = hls_get_max_resolution_stream(media_info);
		}
	}
	return index;
}
static void hls_seek_control_init(hls_iptv_playcontrol *playcontrol)
{
	hls_media_info *media_info = NULL;
	media_info= playcontrol->media_info;
	playcontrol->section_index = media_info->seek_info.section_index;
}
static void hls_resolutin_control_init(hls_iptv_playcontrol *playcontrol)
{
	hls_resolution_control *rescontrol = NULL;
	hls_media_info *media_info = NULL;
	media_info= playcontrol->media_info;
	rescontrol= &(playcontrol->res_control);
	//rescontrol->switch_enable = 0;
	rescontrol->current_stream_index = 0;
	rescontrol->section_download_size = 0;
	rescontrol->section_download_time = 0;
	if(is_stream_resolution_switch_enabled(media_info))//if more than one resolution
	{
		//rescontrol->switch_enable = 1;
		rescontrol->current_stream_index = hls_get_setting_resolution(media_info);
	}
	HLS_PRINTF("stream num=%d, current stream index = %d\n", media_info->stream_num, (int)(rescontrol->current_stream_index));
}
static int hls_decrypt_control_init(hls_iptv_playcontrol *playcontrol)
{
	hls_decrypt_control *decryptcontrol = NULL;
	hls_media_info *media_info = NULL;
	UINT32 i , j;
	decryptcontrol = &(playcontrol->decrypt_control);
	media_info= playcontrol->media_info;
	MEMSET(decryptcontrol, 0, sizeof(hls_decrypt_control));
	for(i = 0;i <media_info->stream_num; i++)
	{
		if(media_info->hls_stream[i].encypt_info.encrypt_flag)
		{
			struct MemoryStruct urldata;
			char *url = media_info->hls_stream[i].encypt_info.key_url;
			char *iv = media_info->hls_stream[i].encypt_info.key_iv;
			if(strlen(url)>0)
			{
				//get url
				UINT8 download_flag = 1;
				if(i>0)
				{
					for(j=0;j<i;j++)
					{
						if(0 == (STRCMP(url, media_info->hls_stream[j].encypt_info.key_url)))
						{
							download_flag = 0;
							decryptcontrol->decrypt_info[i].decrypt_flag = 1;
							MEMCPY(decryptcontrol->decrypt_info[i].user_key, decryptcontrol->decrypt_info[j].user_key, 16);
							break;
						}
					}
				}
				if(download_flag == 1)
				{
					if(hls_curl_download(url, &urldata) == 0)
					{
						if(urldata.size>=16) //aes-128
						{
							decryptcontrol->decrypt_info[i].decrypt_flag = 1;
							MEMCPY(decryptcontrol->decrypt_info[i].user_key, urldata.memory, 16);
						}
					}
					else
					{
						return 0;
					}
				}
				//get iv
				if((decryptcontrol->decrypt_info[i].decrypt_flag == 1)&&(strlen(iv)>=16))
				{
					MEMCPY(decryptcontrol->decrypt_info[i].user_iv, iv, 16);
				}
			}
		}
	}
	return 1;
}
#if 0
static void hls_resolution_auto_switch(hls_iptv_playcontrol *playcontrol)
{
	UINT16 i = 0;
	UINT16 index = 100;
	UINT32 old_bandwidth = 0;
	UINT32 bandwidth = 0;
	hls_resolution_control *res_control = &(playcontrol->res_control);
	hls_media_info *media_info = playcontrol->media_info;
	if((res_control->switch_enable)&&(res_control->section_download_time>0))
	{
		HLS_PRINTF("hls_resolution_auto_switch\n");
		old_bandwidth = (UINT32)(8000*(res_control->section_download_size)/(res_control->section_download_time));
		HLS_PRINTF("last section download speed = %d bit/s\n", (int)old_bandwidth);
		for(i = 0; i< media_info->stream_num; i++)
		{
			if((old_bandwidth > (media_info->hls_stream_info[i].bandwidth))&&((media_info->hls_stream_info[i].bandwidth)>bandwidth))
			{
				index = i;
				bandwidth = media_info->hls_stream_info[i].bandwidth;
			}
		}
		if(index == 100) //download bandwidth is not enough
		{
			//res_control->current_stream_index = hls_get_min_resolution_stream(media_info);
			//HLS_PRINTF("download speed is not enough, use min bandwidth stream %d\n", (int)(res_control->current_stream_index));
		}
		else
		{
			//res_control->current_stream_index = index;
			//HLS_PRINTF("switch to stream %d, bandwidth = %d bit/s\n", (int)index, (int)(media_info->hls_stream_info[index].bandwidth));
		}
		res_control->section_download_size = 0;
		res_control->section_download_time = 0;
	}
}
#endif
//return value: if >= 0 read data successfully or user abort
//              if <0 lost connection
int sknet_iptv_read(UrlResource *rsrc, hls_resolution_control *res_control, void *ptr, size_t size)
{
	int bytes_read   = 0;
	char *buf = NULL;
	int total_bytes_read  = 0;
	unsigned long rtc_time_begin,rtc_time_end;
	buf = (char *)ptr;
	rtc_time_begin = osal_get_tick();
	while((size >0)&&((rsrc->outfile_size == 0)||((rsrc->outfile_size>(res_control->section_download_size+total_bytes_read)))))
	{
		if((rsrc->running)&&(hls_play_state!=HLS_STATE_STOP))
		{
			bytes_read = S_READ(rsrc->socket, buf, size);
			if(bytes_read>0)
			{
				size-=bytes_read;
				buf+=bytes_read;
				total_bytes_read+=bytes_read;
			}
			if(bytes_read < 0) //connection error,wait for server
			{
				rsrc->net_global_retry_flag++;
				osal_task_sleep(1);
			}
			else
			{
				rsrc->net_global_retry_flag = 0;
			}
			if(bytes_read == 0) //bytes_read=0 means connection over
				break;
			if(rsrc->net_global_retry_flag>60000) //60s no data read,abort it
			{
				total_bytes_read = SKNET_READ_LOST_CONNECTION;
				HLS_PRINTF("no data in 60s,close connection\n");
				sky_network_app_callback(NET_APP_DOWNLOAD_FINISH, SKNET_ERR_LOSE_CONNECTION, TRUE);
				break;
			}
		}
		else
		{
			HLS_PRINTF("Url Read terminate!\n");
			return total_bytes_read;
		}
	}
	rtc_time_end = osal_get_tick();
	//if((res_control->switch_enable)&&(total_bytes_read>0))
	if(total_bytes_read>0)
	{
		res_control->section_download_size += total_bytes_read;
		res_control->section_download_time += (UINT32)(rtc_time_end-rtc_time_begin);
		//iptv_dump_all_data_to_usb("/c/iptv_dump_iptv_read.ts", ptr, total_bytes_read);

	}
	HLS_PRINTF("sknet_iptv_read,result=%d bytes, time=%d ms\n",total_bytes_read, rtc_time_end-rtc_time_begin);
	return total_bytes_read;
}
static void stop_iptv_task(UrlResource *rsrc)
{
	rsrc->running = 0;
}
static int iptv_fill_buffer(hls_iptv_buffer *buffer, void *ptr, size_t size)
{
	char *buf = (char *)ptr;
	size_t max_write_size = 0;
	size_t buffer_end_size = 0;
	int buffer_switch = 0;
	int resvalue = 0;
	HLS_MUTEX_LOCK(buffer->buffer_mutex, OSAL_WAIT_FOREVER_TIME);
	if(buffer->write_pos>=buffer->read_pos)
	{
		max_write_size = buffer->buffer_size-(buffer->write_pos - buffer->read_pos);
		buffer_end_size = buffer->buffer_size - buffer->write_pos;
		if(buffer_end_size<size)
			buffer_switch = 1;
	}
	else
	{
		max_write_size = buffer->read_pos-buffer->write_pos;
	}
	if(max_write_size>size)
	{
		if(buffer_switch)
		{
			memcpy((UINT8 *)(buffer->buffer_start + buffer->write_pos),buf, buffer_end_size);
			memcpy((UINT8 *)(buffer->buffer_start),buf+buffer_end_size, size - buffer_end_size);

		}
		else
		{
			memcpy((UINT8 *)(buffer->buffer_start + buffer->write_pos),buf, size);
		}
		buffer->write_pos += size;
		if(buffer->write_pos>=buffer->buffer_size)
			buffer->write_pos %= buffer->buffer_size;
		if(buffer->buffer_status == STATUS_CLOSED)
			buffer->buffer_status = STATUS_OPENED;
		resvalue = 1;
	}
	HLS_MUTEX_UNLOCK(buffer->buffer_mutex);
	return resvalue;
}

static void iptv_pause_keep_connection(hls_iptv_playcontrol *playcontrol)
{
	UrlResource *rsrc	= NULL;
	Url *u			= NULL;
	hls_media_info *media_info = playcontrol->media_info;
	hls_media_section_info *section_info = media_info->hls_stream[playcontrol->res_control.current_stream_index].section_info;
	UINT32 section_index = 0;
	HLS_PRINTF("iptv_pause_keep_connection\n");

	section_index = section_info[playcontrol->section_index].next_section_index;

	if((section_info[section_index].next_section_index != 0)
		&& (section_info[section_index].section_url != NULL))
	{
		rsrc 	= sknet_url_resource_new();
		rsrc->buffer = (char *)(hls_global_memory_info.cache_buffer_addr+HLS_CACHE_BUFFER_OFFSET); //just for tricking sknet_http_connect
		rsrc->buffer_len = 0x7fffffff; //just for tricking sknet_http_connect
		u = sknet_url_new();
		rsrc->url = u;
		rsrc->outfile_offset = 0;
		rsrc->url = sknet_url_init(rsrc->url, section_info[section_index].section_url);
		rsrc->outfile_size = 0;
		sknet_http_connect(rsrc);
		sknet_http_close(rsrc);
	}
}

static void iptv_wait_fill_data(hls_iptv_playcontrol *playcontrol, hls_iptv_buffer *buffer, void *ptr, size_t size)
{
	UrlResource *rsrc = playcontrol->rsrc;
	while((rsrc->running)&&(hls_play_state!=HLS_STATE_STOP))
	{
		if(iptv_fill_buffer(buffer, ptr, size)>0)
		{
			//iptv_dump_all_data_to_usb("/c/iptv_dump_fill_data.ts", ptr, size);
			hls_pause_count = 0;
			break;
		}
		osal_task_sleep(1);
		if(hls_play_state == HLS_STATE_PAUSE)
		{
			hls_pause_count++;
			if(hls_pause_count>60*1000) //every 60s
			{
				hls_pause_count = 0;
				iptv_pause_keep_connection(playcontrol);
			}
		}
		else
		{
			hls_pause_count = 0;
		}
	}
}
//function:download all content of a section
//return value: if > 0 dump data successfully
//				if = 0 dump data failed, connection abort
#ifdef HLS_USE_CYASSL
static int iptv_dump_data(hls_iptv_playcontrol *playcontrol)
{
	int bytes_read   = 0;
	char *hls_key = NULL;
	char hls_aes_iv[HLS_MAX_AES_KEY_IV_LEN];
	UINT32 stream_section_index;
	UrlResource *rsrc = playcontrol->rsrc;
	hls_iptv_buffer *buffer = &(playcontrol->buffer);
	hls_media_info *media_info = playcontrol->media_info;
	hls_decrypt_control *decryptcontrol = &(playcontrol->decrypt_control);
	hls_resolution_control *res_control = &(playcontrol->res_control);
	char *buf = (char *)(hls_global_memory_info.cache_buffer_addr+HLS_NET_TEMP_BUFFER_OFFSET);
	char *aes_buf = (char *)(hls_global_memory_info.cache_buffer_addr+HLS_AES_TEMP_BUFFER_OFFSET);;
	Aes cyassl_aes;
	
	//init iv
	MEMSET(&cyassl_aes, 0, sizeof(cyassl_aes));
	if(decryptcontrol->decrypt_info[res_control->current_stream_index].decrypt_flag)
	{
		hls_key = decryptcontrol->decrypt_info[res_control->current_stream_index].user_key;
		MEMSET(hls_aes_iv, 0, sizeof(hls_aes_iv));
		if(strlen(decryptcontrol->decrypt_info[res_control->current_stream_index].user_iv)>=16)
		{
			MEMCPY(hls_aes_iv, decryptcontrol->decrypt_info[res_control->current_stream_index].user_iv, 16);
		}
		else
		{
			MEMSET(hls_aes_iv, 0, 16);
			stream_section_index = playcontrol->section_index+playcontrol->media_info->hls_stream[res_control->current_stream_index].stream_media_sequence;
			if(stream_section_index>=0x1000000)
			{
				hls_aes_iv[12] = stream_section_index/0x1000000;
				stream_section_index = stream_section_index%0x1000000;
			}
			if(stream_section_index>=0x10000)
			{
				hls_aes_iv[13] = stream_section_index/0x10000;
				stream_section_index = stream_section_index%0x10000;
			}
			if(stream_section_index>=0x100)
			{
				hls_aes_iv[14] = stream_section_index/0x100;
				stream_section_index = stream_section_index%0x100;
			}
			hls_aes_iv[15] = stream_section_index;
		}
	}
	
	playcontrol->res_control.section_download_size = 0;
	playcontrol->res_control.section_download_time = 0;
	
	while((rsrc->running)&&(hls_play_state!=HLS_STATE_STOP))
	{
		if(hls_key)
		{
			bytes_read = sknet_iptv_read(rsrc, res_control, aes_buf, HLS_AES_TEMP_BUFFER_SIZE);
			if((bytes_read>0)&&(hls_play_state!=HLS_STATE_STOP))
			{
                		AesSetKey(&cyassl_aes, hls_key, 128, hls_aes_iv,AES_DECRYPTION);
				AesCbcEncrypt(&cyassl_aes, buf, aes_buf, bytes_read);
			}
		}
		else
		{
			bytes_read = sknet_iptv_read(rsrc, res_control, buf, HLS_NET_TEMP_BUFFER_SIZE);
		}
		if(bytes_read>0)
		{
			//osal_cache_flush(buf, bytes_read);
			//iptv_dump_all_data_to_usb("/c/iptv_dump_data.ts", buf, bytes_read);
		}
		//we use sknet_iptv_read to read size of HLS_NET_TEMP_BUFFER_SIZE
		//if return size < HLS_NET_TEMP_BUFFER_SIZE and >= 0, it means section over
		if((bytes_read>=0)&&((bytes_read<HLS_NET_TEMP_BUFFER_SIZE)))
		{
			if(bytes_read>0)
			{
				iptv_wait_fill_data(playcontrol, buffer, buf, bytes_read);
			}
			return 1;//successfully download all contents of a section
		}
		else if(bytes_read == HLS_NET_TEMP_BUFFER_SIZE) //read full data,continue
		{
			iptv_wait_fill_data(playcontrol, buffer, buf, bytes_read);
		}
		else //connection abort
		{
			return 0;
		}
	}
	return 0;//user abort
}

#else
static int iptv_dump_data(hls_iptv_playcontrol *playcontrol)
{
	int bytes_read   = 0;
	char *hls_key = NULL;
	char hls_aes_iv[HLS_MAX_AES_KEY_IV_LEN];
	UINT32 stream_section_index;
	UrlResource *rsrc = playcontrol->rsrc;
	hls_iptv_buffer *buffer = &(playcontrol->buffer);
	hls_media_info *media_info = playcontrol->media_info;
	hls_decrypt_control *decryptcontrol = &(playcontrol->decrypt_control);
	hls_resolution_control *res_control = &(playcontrol->res_control);
	char *buf = (char *)(hls_global_memory_info.cache_buffer_addr+HLS_NET_TEMP_BUFFER_OFFSET);
	char *aes_buf = (char *)(hls_global_memory_info.cache_buffer_addr+HLS_AES_TEMP_BUFFER_OFFSET);;
	AES_KEY ssl_aes_key;
	
	//init iv
	if(decryptcontrol->decrypt_info[res_control->current_stream_index].decrypt_flag)
	{
		hls_key = decryptcontrol->decrypt_info[res_control->current_stream_index].user_key;
		MEMSET(hls_aes_iv, 0, sizeof(hls_aes_iv));
		if(strlen(decryptcontrol->decrypt_info[res_control->current_stream_index].user_iv)>=16)
		{
			MEMCPY(hls_aes_iv, decryptcontrol->decrypt_info[res_control->current_stream_index].user_iv, 16);
		}
		else
		{
			MEMSET(hls_aes_iv, 0, 16);
			stream_section_index = playcontrol->section_index+playcontrol->media_info->hls_stream[res_control->current_stream_index].stream_media_sequence;
			if(stream_section_index>=0x1000000)
			{
				hls_aes_iv[12] = stream_section_index/0x1000000;
				stream_section_index = stream_section_index%0x1000000;
			}
			if(stream_section_index>=0x10000)
			{
				hls_aes_iv[13] = stream_section_index/0x10000;
				stream_section_index = stream_section_index%0x10000;
			}
			if(stream_section_index>=0x100)
			{
				hls_aes_iv[14] = stream_section_index/0x100;
				stream_section_index = stream_section_index%0x100;
			}
			hls_aes_iv[15] = stream_section_index;
		}
		MEMSET(&ssl_aes_key, 0, sizeof(ssl_aes_key));
		SK_AES_set_decrypt_key(hls_key, 128, &ssl_aes_key);
	}
	
	playcontrol->res_control.section_download_size = 0;
	playcontrol->res_control.section_download_time = 0;
	
	while((rsrc->running)&&(hls_play_state!=HLS_STATE_STOP))
	{
		if(hls_key)
		{
			bytes_read = sknet_iptv_read(rsrc, res_control, aes_buf, HLS_AES_TEMP_BUFFER_SIZE);
			if((bytes_read>0)&&(hls_play_state!=HLS_STATE_STOP))
			{
				SK_AES_cbc_encrypt(aes_buf, buf, bytes_read, &ssl_aes_key, hls_aes_iv, AES_DECRYPT);
			}
		}
		else
		{
			bytes_read = sknet_iptv_read(rsrc, res_control, buf, HLS_NET_TEMP_BUFFER_SIZE);
		}
		if(bytes_read>0)
		{
			//osal_cache_flush(buf, bytes_read);
			//iptv_dump_all_data_to_usb("/c/iptv_dump_data.ts", buf, bytes_read);
		}
		//we use sknet_iptv_read to read size of HLS_NET_TEMP_BUFFER_SIZE
		//if return size < HLS_NET_TEMP_BUFFER_SIZE and >= 0, it means section over
		if((bytes_read>=0)&&((bytes_read<HLS_NET_TEMP_BUFFER_SIZE)))
		{
			if(bytes_read>0)
			{
				iptv_wait_fill_data(playcontrol, buffer, buf, bytes_read);
			}
			return 1;//successfully download all contents of a section
		}
		else if(bytes_read == HLS_NET_TEMP_BUFFER_SIZE) //read full data,continue
		{
			iptv_wait_fill_data(playcontrol, buffer, buf, bytes_read);
		}
		else //connection abort
		{
			return 0;
		}
	}
	return 0;//user abort
}
#endif

static void hls_cache_start(UINT32 param1, UINT32 param2)
{
	hls_iptv_playcontrol *playcontrol = (hls_iptv_playcontrol *)param1;
	int last_download_index = -1;
	int temp_index = 0;
	int failed_index = -1;
	int try_nsec = 1;
	UINT8 is_download_failed = 0;
	hls_media_stream *info;
	UrlResource *rsrc =playcontrol->rsrc;
	hls_media_info *media_info = playcontrol->media_info;
	hls_seek_control_init(playcontrol);
	hls_resolutin_control_init(playcontrol);
	playcontrol->section_index = media_info->hls_stream[playcontrol->res_control.current_stream_index].section_info[0].next_section_index;	
	if(0 == hls_decrypt_control_init(playcontrol))
	{
		goto FINISH;
	}
	while((rsrc->running)&&(hls_play_state!=HLS_STATE_STOP))
	{
		info = &media_info->hls_stream[playcontrol->res_control.current_stream_index];
		HLS_PRINTF("before section_index:%d.\n", playcontrol->section_index);
		
		while(info->section_info[playcontrol->section_index].is_used)
		{
			playcontrol->section_index = info->section_info[playcontrol->section_index].next_section_index;
		}
		
		HLS_PRINTF("after section_index:%d.\n", playcontrol->section_index);
		
		if(info->section_info[playcontrol->section_index].section_url != NULL)
		{
			rsrc->url = sknet_url_init(rsrc->url, info->section_info[playcontrol->section_index].section_url);
			rsrc->outfile_size = 0;
			is_download_failed = 0;
			if(sknet_http_connect(rsrc)>0)
			{
				if(iptv_dump_data(playcontrol) > 0)
				{
					temp_index = playcontrol->section_index;
					last_download_index = playcontrol->section_index;
					info->section_info[playcontrol->section_index].is_used = 1;
					playcontrol->section_index = info->section_info[playcontrol->section_index].next_section_index;

					try_nsec = 1;
					failed_index = -1;
				}
				else
				{
					// download failed
					is_download_failed = 1;
				}
			}
			else
			{
				// connect failed
				is_download_failed = 1;
			}
			S_CLOSE(rsrc->socket);
			rsrc->socket = -1;
			sknet_url_destroy(rsrc->url);

			if(is_download_failed)
			{
				if(failed_index == playcontrol->section_index)
				{
					if(try_nsec <= HLS_NET_RETRY_MAXSLEEP/2)
					{
	//					osal_task_sleep(try_nsec);
					}
					
					try_nsec <<= 1;

					if(try_nsec > HLS_NET_RETRY_MAXSLEEP)
					{
						temp_index = playcontrol->section_index;
						info->section_info[playcontrol->section_index].is_used = 1;
						playcontrol->section_index = info->section_info[playcontrol->section_index].next_section_index;

						try_nsec = 1;
						failed_index = -1;
					}
				}
				else
				{
					failed_index = playcontrol->section_index;
					try_nsec = 1;
				}
			}

			if(info->play_mode == PLAY_MODE_LIVE)
			{
				if(hls_get_ts_node_count(info->section_info) > HLS_LIVE_TS_NOTE_MAX)
				{
					hls_del_first_ts_node(info->section_info);
				}
			}
			
		}

		/*live mode, update url list*/
		if(info->play_mode == PLAY_MODE_LIVE)
		{
			if(playcontrol->section_index == 0)
			{
				if(hls_update_ts_list(media_info, playcontrol->res_control.current_stream_index) == 0)
				{
					if((last_download_index >=0) 
						&& (info->section_info[last_download_index].next_section_index != 0)
						&& (temp_index == last_download_index))
					{
						HLS_PRINTF("--- Change section_index Type 1.--- \n");
						playcontrol->section_index = info->section_info[last_download_index].next_section_index;
					}
					else
					{
						HLS_PRINTF("--- Change section_index Type 2.--- \n");
						playcontrol->section_index = info->section_info[temp_index].next_section_index;
					}
				}
				else
				{
					HLS_PRINTF("--- Update url list failed.--- \n");
					osal_task_sleep(HLS_NET_RETRY_MAXSLEEP/2);
				}

			}
		}
		else if(info->play_mode == PLAY_MODE_VOD)
		{
			/*vod mode, not need to update the url list, so just quit*/
			if(playcontrol->section_index == 0)
			{
				break;
			}
		}
	}
FINISH:
	sky_hls_playlist_free(0);
	hls_buffer_stop(&(playcontrol->buffer));
	while(rsrc->running) //finish download or user aborted directly, just wait for pe cache close
	{
		osal_task_sleep(1);
	}
	hls_buffer_destroy(&(playcontrol->buffer));
	sknet_http_close(playcontrol->rsrc);
	FREE(playcontrol);
}
static int hls_create_cache_task(hls_iptv_playcontrol *playcontrol)
{
	OSAL_T_CTSK t_ctsk;
	OSAL_ID tsk_id;
	t_ctsk.itskpri = OSAL_PRI_NORMAL;
	t_ctsk.stksz = 0x8000;
	t_ctsk.quantum = 10;
	t_ctsk.para1 = (UINT32)playcontrol;
	t_ctsk.para2 = 0;
	t_ctsk.name[0] = 'T';
	t_ctsk.name[1] = 'R';
	t_ctsk.name[2] = 'A';
	t_ctsk.task = hls_cache_start;
	tsk_id = osal_task_create(&t_ctsk);
	HLS_PRINTF("tsk_id = %d\n", tsk_id);
	ASSERT(OSAL_INVALID_ID != tsk_id);

	return tsk_id;
}

FILE *hls_url_open(const char *path, unsigned char* buffer, unsigned int buf_len, unsigned int offset)
{
	hls_iptv_playcontrol *playcontrol = NULL;
	UrlResource *rsrc	= NULL;
	Url *u			= NULL;
	HLS_PRINTF("hls_url_open\n");
	playcontrol = malloc(sizeof(hls_iptv_playcontrol));
	rsrc 	= sknet_url_resource_new();
	rsrc->buffer = (char *)(hls_global_memory_info.cache_buffer_addr+HLS_CACHE_BUFFER_OFFSET); //just for tricking sknet_http_connect
	rsrc->buffer_len = 0x7fffffff; //just for tricking sknet_http_connect
	u = sknet_url_new();
	rsrc->url = u;
	playcontrol->rsrc = rsrc;
	playcontrol->media_info = hls_get_media_info();
//	playcontrol->section_index = 0;	
	playcontrol->section_index = 1;	
	hls_buffer_init(&(playcontrol->buffer));
	rsrc->outfile_offset = 0;
	hls_play_state = HLS_STATE_PLAY;
	rsrc->running = 1;
	hls_create_cache_task(playcontrol);
	return (FILE *)playcontrol;
}
size_t hls_url_read(void *ptr, size_t size, size_t nmemb, FILE *stream)
{
	unsigned int cache_data_size = 0;//可疑读取的缓冲区数据大小
	size_t real_read_size = 0;//实际上读取的数据大小
	int resvalue = SKNET_READ_SERVER_ERROR;
	size_t cache_end_size = 0;//缓冲区尾部数据大小
	hls_iptv_playcontrol *playcontrol = NULL;
	hls_iptv_buffer *buffer = NULL;
	char *dbuffer = NULL;
	playcontrol = (hls_iptv_playcontrol *)stream;
	buffer = &(playcontrol->buffer);
	dbuffer = (char *)ptr;
	HLS_MUTEX_LOCK(buffer->buffer_mutex, OSAL_WAIT_FOREVER_TIME);
	if(buffer->buffer_status == STATUS_CLOSED) //just wait
	{
		HLS_MUTEX_UNLOCK(buffer->buffer_mutex);
		return (size_t)SKNET_READ_SERVER_ERROR;
	}
	if(hls_play_state == HLS_STATE_STOP)
	{
		HLS_MUTEX_UNLOCK(buffer->buffer_mutex);
		return (size_t)SKNET_READ_CONNECTION_CLOSED;
	}

	if(buffer->read_pos<=buffer->write_pos)
	{
		cache_data_size = buffer->write_pos - buffer->read_pos;
		if(cache_data_size == 0) //no data to read
		{
			if(buffer->buffer_status == STATUS_STOPED) //download finish
			{
				resvalue = SKNET_READ_CONNECTION_CLOSED;
			}
			else //wait for download
			{
				resvalue = SKNET_READ_SERVER_ERROR;
			}
		}
		else
		{
			real_read_size = (cache_data_size>=size)?size:cache_data_size;
			memcpy((UINT8 *)(dbuffer), (UINT8 *)(buffer->buffer_start + buffer->read_pos), real_read_size);
			//iptv_dump_all_data_to_usb("/c/iptv_dump_url_read.ts", (UINT8 *)(dbuffer), real_read_size);
			buffer->read_pos += real_read_size;
			resvalue = (int)real_read_size;
		}
	}
	else
	{
		cache_data_size = buffer->buffer_size - (buffer->read_pos - buffer->write_pos);
		real_read_size = (cache_data_size>=size)?size:cache_data_size;
		if((buffer->read_pos + real_read_size) > buffer->buffer_size)
		{
			cache_end_size = buffer->buffer_size - buffer->read_pos;
			memcpy((UINT8 *)(dbuffer), (UINT8 *)(buffer->buffer_start + buffer->read_pos), cache_end_size);
			//iptv_dump_all_data_to_usb("/c/iptv_dump_url_read.ts", (UINT8 *)(dbuffer), cache_end_size);
			//iptv_dump_all_data_to_usb("/c/iptv_dump_buffer_end1.ts", (UINT8 *)(dbuffer), cache_end_size);
			memcpy((UINT8 *)(dbuffer +cache_end_size) , (UINT8 *)buffer->buffer_start, real_read_size - cache_end_size);
			//iptv_dump_all_data_to_usb("/c/iptv_dump_url_read.ts", (UINT8 *)(dbuffer +cache_end_size), real_read_size - cache_end_size);
			//iptv_dump_all_data_to_usb("/c/iptv_dump_buffer_end2.ts", (UINT8 *)(dbuffer +cache_end_size), real_read_size - cache_end_size);
		}
		else
		{
			memcpy((UINT8 *)(dbuffer), (UINT8 *)(buffer->buffer_start + buffer->read_pos), real_read_size);
			//iptv_dump_all_data_to_usb("/c/iptv_dump_url_read.ts", (UINT8 *)(dbuffer), real_read_size);
		}
		buffer->read_pos += real_read_size;
		resvalue = (int)real_read_size;
	}
	if(buffer->read_pos>=buffer->buffer_size)
		buffer->read_pos %= buffer->buffer_size;
	//if(resvalue>0)
	//	iptv_dump_all_data_to_usb("/c/iptv_dump_url_read11.ts", (UINT8 *)(dbuffer), resvalue);
	HLS_MUTEX_UNLOCK(buffer->buffer_mutex);
	//if(resvalue>0)
	//{
	//	osal_cache_flush(dbuffer, resvalue);
	//	iptv_dump_all_data_to_usb("/c/iptv_dump_url_read22.ts", (UINT8 *)(dbuffer), resvalue);
	//}
	return (size_t)resvalue;
}
size_t hls_url_close(FILE * fp)
{
	hls_iptv_playcontrol *playcontrol = NULL;
	playcontrol = (hls_iptv_playcontrol *)fp;
	HLS_PRINTF("hls_url_close\n");
	stop_iptv_task(playcontrol->rsrc);
}
int hls_url_eof(FILE *stream)
{
	hls_iptv_playcontrol *playcontrol = NULL;
	playcontrol = (hls_iptv_playcontrol *)stream;
	if(hls_play_state == HLS_STATE_STOP)
	{
		return 1;
	}
	return is_hls_buffer_end(&(playcontrol->buffer));
}

void hls_net_user_abort(void)
{
	hls_play_state = HLS_STATE_STOP;
	
}

void hls_net_user_pause(void)
{
	hls_play_state = HLS_STATE_PAUSE;
}

void hls_net_user_play(void)
{
	hls_play_state = HLS_STATE_PLAY;
}

void hls_set_user_video_resolution(UINT8 resolution)
{
	hls_user_video_resolution = resolution % MAX_RESOLUTION_TYPE;
}

