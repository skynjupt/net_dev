#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "sky_webradio.h"

#define TEST_NUM	1000

int main(int argc, char *argv[])
{
	int i;
	long int test_num = 0;
	char *endptr = NULL;
	
	if(argc == 2)
	{
		test_num = strtol(argv[1], &endptr, 10);
		if(*endptr )
		{
			printf("Invalid argument!\n");
			exit(1);
		}
	}
		
	sky_webradio_init();
	if(argc == 2)
	{
		for (i = 0; i < test_num; i++)
		{
			printf("--------------------------------------------- TEST %d ----------------------------------------\n", i);
			sky_webradio_parse_xml();
		}
	}
	else
	{
		for (i = 0; i < TEST_NUM; i++)
		{
			printf("--------------------------------------------- TEST %d ----------------------------------------\n", i);
			sky_webradio_parse_xml();
		}
	}
	sky_webradio_close();
	return 0;
}
