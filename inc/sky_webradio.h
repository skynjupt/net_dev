#ifndef _SKY_WEBRADIO_H_
#define _SKY_WEBRADIO_H_

#define SERVER_NAME_LEN_MAX 100
#define URL_MAX 200
#define SERVER_TYPE_MAX 20
#define GENRE_MAX 20

typedef struct webradio_s
{
	char server_name[SERVER_NAME_LEN_MAX];
	char listen_url[URL_MAX];
	char server_type[SERVER_TYPE_MAX];
	char genre[GENRE_MAX];
}webradio;

#endif
