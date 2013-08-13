#ifndef _SKYCURL_H_
#define _SKYCURL_H_

typedef struct sky_string
{
	int str_len;
	char *p_str;	
}sky_string_s; 


//CURL *sky_curl_init(sky_string_s *s);
CURL *sky_curl_init();

void sky_curl_cleanup(CURL *handle, sky_string_s *s);

size_t sky_curl_writefunc(void *ptr, size_t size, size_t nmemb, sky_string_s *s);
//CURLcode sky_curl_perform(CURL *handle);
CURLcode sky_curl_perform(CURL *handle, sky_string_s *s);

void sky_curl_buf_init(sky_string_s *s);
#endif
