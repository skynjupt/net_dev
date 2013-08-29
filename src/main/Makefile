
#CROSS_COMPILE:=mipsel-linux-uclibc-
CROSS_COMPILE:=

CC:=$(CROSS_COMPILE)gcc
AR:=$(CROSS_COMPILE)ar
STRIP:=$(CROSS_COMPILE)strip

ifdef SUPPORT_WEBRADIO
SRCS:= skycurl.c skyxml2.c sky_webradio_test.c main.c 
else
SRCS:= hls_main.c
endif
OBJS:= $(SRCS:.c=.o) 

CFLAGS+=-I../../inc

MOD:=MAIN

skyapp : $(MOD).mk
	make -f $< $(OBJS)
ifdef SUPPORT_WEBRADIO
	$(CC) -o $@ $(OBJS) -L../../lib -lcurl -L../../lib -lxml2 -lm
else
	$(CC) -g -o $@ $(OBJS) -L../../lib -lhls -L../../lib -lcurl -pthread
endif
	
$(MOD).mk : $(SRCS)
	cp -f Makefile $@
	chmod +w $@
	$(CC) $(CFLAGS) -M $(SRCS) >> $@

%.o:%.c
	@echo "-----"$(CC)" "$<"-------"
	$(CC) $(CFLAGS) -g -c $< -O1 -o $@

.PHONY:clean
clean:
	-rm -f $(MOD).mk $(OBJS) skyapp 
