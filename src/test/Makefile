CFLAGS+=-I../../inc

SCRS:=download.c simple.c simplepost.c sendrecv.c \
	testxml.c parse_xml_file.c

OBJS:=$(SCRS:.c=.o)
 
TARGET_APP:=download simple simplepost sendrecv \
		xmltest parsexml

all:$(TARGET_APP)

download:download.o
	gcc -o $@ $< -L../../lib -lcurl

simple:simple.o
	gcc -o $@ $< -L../../lib -lcurl

simplepost:simplepost.o
	gcc -o $@ $< -L../../lib -lcurl

sendrecv:sendrecv.o
	gcc -o $@ $< -L../../lib -lcurl

xmltest:testxml.o
	gcc -o $@ $< -L../../lib -lxml2 -lm 

parsexml:parse_xml_file.o
	gcc -o $@ $< -L../../lib -lxml2 -lm

download.o:download.c

simple.o:simple.c

simplepost.o:simplepost.c

sendrecv.o:sendrecv.c

testxml.o:testxml.c

parse_xml_file.o:parse_xml_file.c

.PHONY:clean

clean:
	-rm -f $(OBJS) $(TARGET_APP) 
