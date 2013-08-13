
#CROSS_COMPILE:=mipsel-linux-uclibc-
CROSS_COMPILE:=

CC:=$(CROSS_COMPILE)gcc
AR:=$(CROSS_COMPILE)ar
STRIP:=$(CROSS_COMPILE)strip

SRCS:= skycurl.c skyxml2.c sky_webradio_test.c main.c 
OBJS:= $(SRCS:.c=.o) 

CFLAGS+=-I../../inc

MOD:=MAIN

skyapp : $(MOD).mk
	make -f $< $(OBJS)
	$(CC) -o $@ $(OBJS) -L../../lib -lcurl -L../../lib -lxml2 -lm
	
$(MOD).mk : $(SRCS)
	cp -f Makefile $@
	chmod +w $@
	$(CC) $(CFLAGS) -M $(SRCS) >> $@

%.o:%.c
	@echo "-----"$(CC)" "$<"-------"
	$(CC) $(CFLAGS) -c $< -O1 -o $@

.PHONY:clean
clean:
	-rm -f $(MOD).mk $(OBJS) skyapp 
