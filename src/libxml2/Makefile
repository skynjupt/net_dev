
#CROSS_COMPILE:=mipsel-linux-uclibc-
CROSS_COMPILE:=

CC:=$(CROSS_COMPILE)gcc
AR:=$(CROSS_COMPILE)ar
STRIP:=$(CROSS_COMPILE)strip

CFLAGS += -I../../inc

libxml2_la_SOURCES = SAX.c entities.c encoding.c error.c parserInternals.c  \
                parser.c tree.c hash.c list.c xmlIO.c xmlmemory.c uri.c  \
                valid.c xlink.c HTMLparser.c HTMLtree.c debugXML.c xpath.c  \
                xpointer.c xinclude.c nanohttp.c nanoftp.c DOCBparser.c \
                catalog.c globals.c threads.c c14n.c xmlstring.c \
                xmlregexp.c xmlschemas.c xmlschemastypes.c xmlunicode.c \
                xmlreader.c relaxng.c dict.c SAX2.c \
                xmlwriter.c legacy.c chvalid.c pattern.c xmlsave.c \
                xmlmodule.c schematron.c

SRCS:= $(libxml2_la_SOURCES) 

OBJS:= $(SRCS:.c=.o) 

MOD = LIB_XML2

OUT = libxml2

all : $(MOD).mk
	@echo --- begin compile ---
	make -f $(MOD).mk $(OBJS)
	@echo --- begin ar ---
	$(AR) -r $(OUT).a $(OBJS)
	@echo --- success compile and ar ---
#	$(STRIP) $(OUT).a
	cp -f $(OUT).a ../../lib/

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
