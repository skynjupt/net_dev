#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <curl/curl.h>
#include <stdarg.h>
#include "../../inc/skycurl.h"


//CURL *curl_easy_init( );
//CURL *sky_curl_init(sky_string_s *s)
CURL *sky_curl_init()
{
	CURL *ret = NULL;
/*
	s->str_len = 0;
	s->p_str = (char *) malloc(s->str_len + 1);
	if(s->p_str == NULL)
	{
		fprintf(stderr, "malloc failed!");
		exit(EXIT_FAILURE);
	}	
	s->p_str[0] = '\0';
*/
	ret = curl_easy_init();
	
	return ret;
}

void sky_curl_buf_init(sky_string_s *s)
{
	if(s->p_str != NULL)
	{
		free(s->p_str);
		s->p_str = NULL; 
	}

	s->str_len = 0;
	s->p_str = (char *) malloc(s->str_len + 1);
	if(s->p_str == NULL)
	{
		fprintf(stderr, "malloc failed!");
		exit(EXIT_FAILURE);
	}	
	s->p_str[0] = '\0';
}

//void curl_easy_cleanup(CURL *handle);
void sky_curl_cleanup(CURL *handle, sky_string_s *s)
{ 
	if(s->p_str != NULL)
	{
		free(s->p_str);
		s->p_str = NULL; 
	}
	curl_easy_cleanup(handle);
}

//URLcode curl_easy_setopt(CURL *handle, CURLoption option, parameter);
CURLcode sky_curl_setopt(CURL *handle, CURLoption option, va_list parameter)
{
	return curl_easy_setopt(handle, option, parameter);
}

size_t sky_curl_writefunc(void *ptr, size_t size, size_t nmemb, sky_string_s *s)
{
	size_t new_len = s->str_len + size*nmemb;
	
	s->p_str = (char *) realloc(s->p_str, new_len+1);
	if(s->p_str == NULL)
	{
		fprintf(stderr, "realloc error");
		exit(EXIT_FAILURE);
	}
	memcpy(s->p_str+s->str_len, ptr, size*nmemb);
	s->p_str[new_len] = '\0';
	s->str_len = new_len;
	
	return size*nmemb;
}

//CURLcode curl_easy_perform(CURL *handle);
CURLcode sky_curl_perform(CURL *handle, sky_string_s *s)
{
	sky_curl_buf_init(s);
	return curl_easy_perform(handle);
}
