SRCS:= skycurl.c skyxml2.c main.c 
OBJS:= $(SRCS:.c=.o) 

CFLAGS+=-I../../inc

MOD:=MAIN

skyapp : $(MOD).mk
	make -f $< $(OBJS)
	gcc -o $@ $(OBJS) -L../../lib -lcurl -L../../lib -lxml2 -lm
	
$(MOD).mk : $(SRCS)
	cp -f Makefile $@
	chmod +w $@
	gcc $(CFLAGS) -M $(SRCS) >> $@

.PHONY:clean
clean:
	-rm -f $(MOD).mk $(OBJS) skyapp 
