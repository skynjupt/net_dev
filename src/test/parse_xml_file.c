#include <stdio.h>
#include <libxml/parser.h>
#include <libxml/tree.h>

int main(int argc, char *argv[])
{
	xmlDocPtr doc;
	xmlNodePtr curNode;
	xmlNodePtr propNodePtr;
	xmlChar *szKey;
	xmlAttrPtr attrPtr;
	char *szDocName;

	if(argc != 2)
	{
		printf("usage:%s docname\n", argv[0]);
		return 0;
	}
	
	szDocName = argv[1];
	
	doc = xmlReadFile(szDocName, "GB2312", XML_PARSE_RECOVER);
	if(NULL == doc)
	{
		fprintf(stderr, "Docment not parsed successfully. \n");
		return -1;
	}
	curNode = xmlDocGetRootElement(doc);
	if(NULL == curNode)
	{
		fprintf(stderr, "empty document\n");
		xmlFreeDoc(doc);
		return -1;
	}
	
	if(xmlStrcmp(curNode->name, BAD_CAST "root"))
	{
		fprintf(stderr, "document of the wrong type, root node != root");
		xmlFreeDoc(doc);
		return -1;
	}

	curNode = curNode->xmlChildrenNode;
	propNodePtr = curNode;

	while(curNode != NULL)
	{
		if(!xmlStrcmp(curNode->name, (const xmlChar *)"node1"))
		{
			szKey = xmlNodeGetContent(curNode);
			printf("node1: %s\n", szKey);
			xmlFree(szKey);
		}
		if(xmlHasProp(curNode, BAD_CAST "attribute"))
		{
			propNodePtr = curNode;
		}

		curNode = curNode->next;
	}
	
	attrPtr = propNodePtr->properties;
	while(attrPtr != NULL)
	{
		if(!xmlStrcmp(attrPtr->name, BAD_CAST "attribute"))
		{
			xmlChar *szAttr = xmlGetProp(propNodePtr, BAD_CAST "attribute");
			printf("attribute: %s\n", szAttr);
			xmlFree(szAttr);
		}
		attrPtr = attrPtr->next;
	}
	xmlFreeDoc(doc);	

	return 0;
}
