#define CURL_STATICLIB
#include <stdio.h>
#include <curl/curl.h>
#include <curl/types.h>
#include <curl/easy.h>
#include <string.h>

size_t write_data(void *ptr, size_t size, size_t nmemb, FILE * stream)
{
	size_t written;
	written = fwrite(ptr, size, nmemb, stream);
	return written;
}

int main(int argc, char *argv[])
{
	CURL *curl;
	FILE *fp;
	CURLcode res;
//	char *url = "http://localhost/home/Harry/code/04_curl/aa.txt";
	char *url = "http://192.168.1.103/aaa.txt";
//	char *url = "http://ariva.tv/webradio/yp.xml";
	char outfilename[FILENAME_MAX] = "./bbb.txt";
	curl = curl_easy_init();
	if (curl)
	{
		fp = fopen(outfilename, "wb");
		curl_easy_setopt(curl, CURLOPT_URL, url);
		curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_data);
		curl_easy_setopt(curl, CURLOPT_WRITEDATA, fp); res = curl_easy_perform(curl);
		curl_easy_cleanup(curl);
		fclose(fp);
	}
	return 0;
}
