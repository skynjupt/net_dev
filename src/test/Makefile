CFLAGS+=-I../../inc

all:
	@echo ---- help info -----
	@echo make download
	@echo make xmltest
	@echo make parsexml

download:download.o
	gcc -o $@ $< -L../../lib -lcurl

xmltest:testxml.o
	gcc -o $@ $< -L../../lib -lxml2 -lm 

parsexml:parse_xml_file.o
	gcc -o $@ $< -L../../lib -lxml2 -lm

download.o:download.c

testxml.o:testxml.c

parse_xml_file.o:parse_xml_file.c

.PHONY:clean

clean:
	-rm -f download download.o testxml.o xmltest parse_xml_file.o parsexml
