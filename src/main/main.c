#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <curl/curl.h>
#include "../../inc/skycurl.h"
#include "sky_webradio.h"

#define WEB_RADIO_URL "http://ariva.tv/webradio/yp.xml"

static CURL *g_curl;
static sky_string_s g_str;

#define WEB_RADIO_NUM_MAX 1000

static webradio g_webradio[WEB_RADIO_NUM_MAX]= {0};
static int g_webradio_num = 0;

void sky_webradio_print(webradio *pwebradio, int num);

int main(int argc, char *argv[])
{
	CURLcode res;
	
	g_curl = sky_curl_init((sky_string_s *)&g_str);
	if(g_curl)
	{
		curl_easy_setopt(g_curl, CURLOPT_URL, WEB_RADIO_URL);
		curl_easy_setopt(g_curl, CURLOPT_WRITEFUNCTION, sky_curl_writefunc);
		curl_easy_setopt(g_curl, CURLOPT_WRITEDATA, &g_str);
		res = sky_curl_perform(g_curl);
	}
	
	printf("---len:%d, recv:%s----\n", g_str.str_len, g_str.p_str);

	g_webradio_num = sky_parse_xml(g_str.p_str, g_str.str_len, g_webradio);
	
	if(g_webradio_num < 0)
	{
		printf("Error: parse xml\n");
		g_webradio_num = 0;
	}
	else
	{
		sky_webradio_print(g_webradio, g_webradio_num);
	}

	if(g_curl)
	{
		sky_curl_cleanup(g_curl, (sky_string_s *)&g_str);
	} 
	return 0;
}


void sky_webradio_print(webradio *pwebradio, int num)
{
	int i;

	for(i = 0; i < num; i++)
	{
		printf("------------------- %d ------------------\n", i+1);
		printf("server_name:%s\n", pwebradio[i].server_name);
		printf("listen_url:%s\n", pwebradio[i].listen_url);
		printf("server_type:%s\n", pwebradio[i].server_type);
		printf("genre:%s\n", pwebradio[i].genre);
	}
}
