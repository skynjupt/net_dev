CFLAGS+=-I../../inc

all:
	@echo ---- help info -----
	@echo make download
	@echo make xmltest

download:download.o
	gcc -o $@ $< -L../../lib -lcurl

xmltest:testxml.o
	gcc -o $@ $< -L../../lib -lxml2 -lm 

download.o:download.c

testxml.o:testxml.c

.PHONY:clean

clean:
	-rm -f download download.o testxml.o xmltest
