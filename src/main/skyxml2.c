#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <libxml/parser.h>
#include <libxml/tree.h>
#include "skyxml2.h"
#include "sky_webradio.h"

int sky_parse_xml(char *pxml, int len, webradio *pwebradio)
{
	xmlDocPtr pdoc = NULL;
	xmlNodePtr proot = NULL, curNode = NULL;	
	int webradio_num = 0;

	if (pxml == NULL)
	{
		return -1;
	}

//	xmlKeepBlankDefault(0);
	pdoc = xmlReadMemory(pxml, len, "in_memory.xml", NULL, 0); 
	if(pdoc == NULL)
	{
		printf("Error:read xml from memory\n");
		exit(1);
	}
	
	proot = xmlDocGetRootElement(pdoc);
	
	if(proot == NULL)
	{
		printf("Error:hasn't root node\n");
		exit(1);
	}

	if(xmlStrcmp(proot->name, BAD_CAST "directory") != 0)
	{
		printf("Error:file xml have node of directory\n");
		exit(1);
	}

	curNode = proot->xmlChildrenNode;
	while(curNode != NULL)
	{
		if(!xmlStrcmp(curNode->name, BAD_CAST "entry"))
		{
			xmlNodePtr ptmp = curNode->xmlChildrenNode;
			while(ptmp != NULL)
			{
				if(!xmlStrcmp(ptmp->name, BAD_CAST "server_name"))
				{
					sprintf(pwebradio[webradio_num].server_name, "%s", (char *)xmlNodeGetContent(ptmp));
				}
				else if(!xmlStrcmp(ptmp->name, BAD_CAST "listen_url"))
				{
					sprintf(pwebradio[webradio_num].listen_url, "%s", (char *)xmlNodeGetContent(ptmp));
				}
				else if(!xmlStrcmp(ptmp->name, BAD_CAST "server_type"))
				{
					sprintf(pwebradio[webradio_num].server_type, "%s", (char *)xmlNodeGetContent(ptmp));
				}
				else if(!xmlStrcmp(ptmp->name, BAD_CAST "genre"))
				{
					sprintf(pwebradio[webradio_num].genre, "%s", (char *)xmlNodeGetContent(ptmp));
				}
				ptmp = ptmp->next;
			}
			webradio_num++;
		}
		curNode = curNode->next; 
	}

	xmlFreeDoc(pdoc);
	
	return webradio_num;
}
