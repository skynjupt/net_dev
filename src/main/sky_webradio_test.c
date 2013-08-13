#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <curl/curl.h>
#include "skycurl.h"
#include "skyxml2.h"
#include "sky_webradio.h"

#define WEB_RADIO_URL "http://ariva.tv/webradio/yp.xml"

#define WEB_RADIO_NUM_MAX 1000

static webradio g_webradio[WEB_RADIO_NUM_MAX]= {0};
static int g_webradio_num = 0;

static CURL *g_curl;
static sky_string_s g_str;

void sky_webradio_init(void)
{
	printf("------------step1: sky_webradio_init ---------------\n");
//	g_curl = sky_curl_init((sky_string_s *)&g_str);
	g_curl = sky_curl_init();
	if(g_curl)
	{
		printf("------------step2: sky_webradio_init ---------------\n");
		sky_curl_setopt(g_curl, CURLOPT_URL, WEB_RADIO_URL);
		sky_curl_setopt(g_curl, CURLOPT_WRITEFUNCTION, sky_curl_writefunc);
		sky_curl_setopt(g_curl, CURLOPT_WRITEDATA, &g_str);
	}

}

void sky_webradio_parse_xml(void)
{
	CURLcode res;

//	res = sky_curl_perform(g_curl);
	res = sky_curl_perform(g_curl, (sky_string_s *)&g_str);

	printf("sky_curl_perform return %s[%d]\n", curl_easy_strerror(res), res);
	printf("---len:%d, recv:\n%s----\n", g_str.str_len, g_str.p_str);

	g_webradio_num = sky_parse_xml(g_str.p_str, g_str.str_len, g_webradio);
	
	if(g_webradio_num < 0)
	{
		printf("Error: parse xml\n");
		g_webradio_num = 0;
	}
	else
	{
		sky_webradio_print();
	}

}

/*
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
*/

void sky_webradio_print(void)
{
	int i;
	
	for(i = 0; i < g_webradio_num; i++)
	{
		printf("------------------- %d ------------------\n", i+1);
		printf("server_name:%s\n", g_webradio[i].server_name);
		printf("listen_url:%s\n", g_webradio[i].listen_url);
		printf("server_type:%s\n", g_webradio[i].server_type);
		printf("genre:%s\n", g_webradio[i].genre);
	}
}	

void sky_webradio_close(void)
{
	if(g_curl)
	{
		sky_curl_cleanup(g_curl, (sky_string_s *)&g_str);
	} 
}
