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

extern HLSMemoryInfo hls_global_memory_info;

static size_t WriteMemoryCallback(void *ptr, size_t size, size_t nmemb, void *data)
{
	size_t realsize = size * nmemb;
	struct MemoryStruct *mem = (struct MemoryStruct *)data;

	if ((mem->memory)&&((mem->size+realsize)<HLS_URL_BUFFER_SIZE)) 
	{
		memcpy(&(mem->memory[mem->size]), ptr, realsize);
		mem->size += realsize;
		mem->memory[mem->size] = 0;
	}
	return realsize;
}

int hls_curl_download(char *url, struct MemoryStruct *pdata)
{
	CURL *curl;
	CURLcode res;
	int returnvalue=0;
	if((!url)||(!pdata))
		return -2;
	pdata->memory = hls_global_memory_info.url_buffer_addr;
	pdata->size = 0;
	curl = curl_easy_init();
	if(curl) 
	{
		curl_easy_setopt(curl, CURLOPT_URL, url);
#if 0//def HLS_DEBUG
		curl_easy_setopt(curl, CURLOPT_VERBOSE,1);//for display curl debug information
#endif
		curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, WriteMemoryCallback);
		curl_easy_setopt(curl, CURLOPT_WRITEDATA, (void *)pdata);
		curl_easy_setopt(curl, CURLOPT_CONNECTTIMEOUT, 5);//5s timeout
		curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1);
		res = curl_easy_perform(curl);
		HLS_PRINTF("easy perform result=%d\n",res);
		if(res==0) //操作成功
		{
			HLS_PRINTF("perform result is usefull\n");
			if(pdata->memory&&pdata->size>0)
			{
				returnvalue = 0;
			}
			else
			{
		    		returnvalue=-5;
			}
		}
		else //操作失败
		{
		    returnvalue=-4;
		}
		curl_easy_cleanup(curl);
	}
	else
	{
		returnvalue=-3;
	}
	return returnvalue;
}

