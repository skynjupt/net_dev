SRCS:= skycurl.c main.c 
OBJS:= $(SRCS:.c=.o) 

MOD:=MAIN

skyapp : $(MOD).mk
	make -f $< $(OBJS)
	gcc -o $@ $(OBJS) -L../../lib -lcurl
	
$(MOD).mk : $(SRCS)
	cp -f Makefile $@
	chmod +w $@
	gcc $(CFLAGS) -M $(SRCS) >> $@

.PHONY:clean
clean:
	-rm -f $(MOD).mk $(OBJS) skyapp 
