include ./Makefile.inc

#VPATH = ../include
#vpath %.h ../include

CFLAGS += -I../../inc -DHAVE_CONFIG_H

SRCS:= $(CSOURCES) 
OBJS:= $(SRCS:.c=.o) 

#HAVE_CONFIG_H := 1

MOD = LIB_CURL

OUT = libcurl

all : $(MOD).mk
	@echo --- begin compile ---
	make -f $(MOD).mk $(OBJS)
	@echo --- begin ar ---
	ar -r $(OUT).a $(OBJS)
	@echo --- success compile and ar ---
	cp -f $(OUT).a ../../lib

$(MOD).mk : $(SRCS)
	cp -f Makefile $@
	chmod +w $@
	gcc $(CFLAGS) -M $(SRCS) >> $@

.PHONY:test clean
test:
	@echo $(SRCS)
	@echo =============================
	@echo $(OBJS)
ifdef HAVE_CONFIG_H
	@echo Hello World!
endif
#	ar cr libcurl.a 

	
clean:
	-rm -f $(MOD).mk $(OBJS) $(OUT).a
