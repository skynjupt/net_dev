#include <stdio.h>
#include <libxml/parser.h>
#include <libxml/tree.h>

int main(int argc, char *argv[])
{
	xmlDocPtr doc = NULL;
	xmlNodePtr root_note = NULL;
	xmlNodePtr node = NULL;
	xmlNodePtr node1 = NULL;

	doc = xmlNewDoc(BAD_CAST "1.0");
	root_note = xmlNewNode(NULL, BAD_CAST "root");
	xmlDocSetRootElement(doc, root_note);
	xmlNewChild(root_note, NULL, BAD_CAST "node1", BAD_CAST "content of node1");
	node = xmlNewChild(root_note, NULL, BAD_CAST "node3", BAD_CAST "node has attributes");
	xmlNewProp(node, BAD_CAST "attribure", BAD_CAST "yes");
	node = xmlNewNode(NULL, BAD_CAST "node4");
	node1 = xmlNewText(BAD_CAST "other way to create content");
	xmlAddChild(node, node1);
	xmlAddChild(root_note, node);
	xmlSaveFormatFileEnc(argc > 1? argv[1]:"-", doc, "UTF-8", 1);
	xmlFreeDoc(doc);
	xmlCleanupParser();
	xmlMemoryDump();
	return 0; 
}
