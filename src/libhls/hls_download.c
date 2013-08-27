#include <curl/curl.h>
#include "hls.h"
#include <string.h>

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
	pdata->memory = url_buffer_addr;
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
		    returnvalue = -5;
			}
		}
		else //操作失败
		{
		    returnvalue = -4;
		}
		curl_easy_cleanup(curl);
	}
	else
	{
		returnvalue = -3;
	}
	return returnvalue;
}

size_t write_data_callback(void *ptr, size_t size, size_t nmemb, FILE *stream)
{
	size_t written;
	written = fwrite(ptr, size, nmemb, stream);
	return written;
}

int hls_curl_download_ext(char *url, char *filename)
{
	CURL *curl;
	CURLcode res;
	int returnvalue=0;
	FILE *fp;

	if((!url)||(!filename))
	{
		return -2;
	}
	curl = curl_easy_init();
	if(curl) 
	{
		fp = fopen(filename, "wb");		
		if(fp == NULL)
		{
			HLS_PRINTF("fopen file error\n");
			curl_easy_cleanup(curl);
			return -1;
		}
		curl_easy_setopt(curl, CURLOPT_URL, url);
#if 0//def HLS_DEBUG
		curl_easy_setopt(curl, CURLOPT_VERBOSE,1);//for display curl debug information
#endif
		curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_data_callback);
		curl_easy_setopt(curl, CURLOPT_WRITEDATA, fp);
		curl_easy_setopt(curl, CURLOPT_CONNECTTIMEOUT, 5);//5s timeout
		res = curl_easy_perform(curl);
		HLS_PRINTF("easy perform result=%d\n",res);
		if(res==0) //操作成功
		{
			HLS_PRINTF("perform result is usefull\n");
			returnvalue = 0;
		}
		else //操作失败
		{
		    	returnvalue = -4;
		}
		curl_easy_cleanup(curl);
		fclose(fp);
	}
	else
	{
		returnvalue = -3;
	}
	return returnvalue;
}
