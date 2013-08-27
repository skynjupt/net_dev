
#CROSS_COMPILE:=mipsel-linux-uclibc-
CROSS_COMPILE:=

CC:=$(CROSS_COMPILE)gcc
AR:=$(CROSS_COMPILE)ar
STRIP:=$(CROSS_COMPILE)strip

CFLAGS += -I../../inc

SRCS:= hls_core.c hls_download.c hls_m3u8_parse.c 
OBJS:= $(SRCS:.c=.o) 

MOD = LIB_HLS 

OUT = libhls

all : $(MOD).mk
	@echo --- begin compile ---
	make -f $(MOD).mk $(OBJS)
	@echo --- begin ar ---
	$(AR) -r $(OUT).a $(OBJS)
	@echo --- success compile and ar ---
#	$(STRIP) $(OUT).a
	cp -f $(OUT).a ../../lib

$(MOD).mk : $(SRCS)
	cp -f Makefile $@
	chmod +w $@
	$(CC) $(CFLAGS) -M $(SRCS) >> $@

%.o:%.c
	@echo "-----"$(CC)" "$<"-------"
	$(CC) $(CFLAGS) -c $< -O1 -o $@

.PHONY:test clean
test:
	@echo $(SRCS)
	@echo =============================
	@echo $(OBJS)
	
clean:
	-rm -f $(MOD).mk $(OBJS) $(OUT).a
