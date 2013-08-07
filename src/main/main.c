#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <curl/curl.h>
#include "../../inc/skycurl.h"

#define WEB_RADIO_URL "http://ariva.tv/webradio/yp.xml"

static CURL *g_curl;
static sky_string_s g_str;

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
	
	if(g_curl)
	{
		sky_curl_cleanup(g_curl, (sky_string_s *)&g_str);
	} 
	return 0;
}
