download:download.o
	gcc -o $@ $< -L../../lib -lcurl

download.o:download.c

.PHONY:clean

clean:
	-rm -f download download.o
