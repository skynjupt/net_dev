CFLAGS += -I./include

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
	ar -r $(OUT).a $(OBJS)
	@echo --- success compile and ar ---
#	cp -f $(OUT).a ../../lib

$(MOD).mk : $(SRCS)
	cp -f Makefile $@
	chmod +w $@
	gcc $(CFLAGS) -M $(SRCS) >> $@

.PHONY:test clean
test:
	@echo $(SRCS)
	@echo =============================
	@echo $(OBJS)
	
clean:
	-rm -f $(MOD).mk $(OBJS) $(OUT).a
SAX.o: SAX.c libxml.h config.h include/libxml/xmlversion.h \
  include/libxml/xmlexports.h /usr/include/stdio.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/stdlib.h /usr/include/sys/types.h /usr/include/time.h \
  /usr/include/endian.h /usr/include/bits/endian.h \
  /usr/include/sys/select.h /usr/include/bits/select.h \
  /usr/include/bits/sigset.h /usr/include/bits/time.h \
  /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h \
  /usr/include/alloca.h /usr/include/string.h include/libxml/xmlmemory.h \
  include/libxml/threads.h include/libxml/globals.h \
  include/libxml/parser.h include/libxml/tree.h \
  include/libxml/xmlstring.h include/libxml/xmlregexp.h \
  include/libxml/dict.h include/libxml/hash.h include/libxml/valid.h \
  include/libxml/xmlerror.h include/libxml/list.h \
  include/libxml/xmlautomata.h include/libxml/entities.h \
  include/libxml/encoding.h /usr/include/iconv.h include/libxml/xmlIO.h \
  include/libxml/SAX.h include/libxml/xlink.h include/libxml/SAX2.h \
  include/libxml/parserInternals.h include/libxml/HTMLparser.h \
  include/libxml/chvalid.h include/libxml/debugXML.h \
  include/libxml/xpath.h include/libxml/uri.h include/libxml/HTMLtree.h \
  elfgcchack.h
entities.o: entities.c libxml.h config.h include/libxml/xmlversion.h \
  include/libxml/xmlexports.h /usr/include/stdio.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/string.h /usr/include/stdlib.h /usr/include/sys/types.h \
  /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h \
  /usr/include/sys/select.h /usr/include/bits/select.h \
  /usr/include/bits/sigset.h /usr/include/bits/time.h \
  /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h \
  /usr/include/alloca.h include/libxml/xmlmemory.h \
  include/libxml/threads.h include/libxml/globals.h \
  include/libxml/parser.h include/libxml/tree.h \
  include/libxml/xmlstring.h include/libxml/xmlregexp.h \
  include/libxml/dict.h include/libxml/hash.h include/libxml/valid.h \
  include/libxml/xmlerror.h include/libxml/list.h \
  include/libxml/xmlautomata.h include/libxml/entities.h \
  include/libxml/encoding.h /usr/include/iconv.h include/libxml/xmlIO.h \
  include/libxml/SAX.h include/libxml/xlink.h include/libxml/SAX2.h \
  include/libxml/parserInternals.h include/libxml/HTMLparser.h \
  include/libxml/chvalid.h elfgcchack.h
encoding.o: encoding.c libxml.h config.h include/libxml/xmlversion.h \
  include/libxml/xmlexports.h /usr/include/stdio.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/string.h /usr/include/ctype.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/stdlib.h \
  /usr/include/sys/types.h /usr/include/time.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/alloca.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  include/libxml/encoding.h /usr/include/iconv.h include/libxml/tree.h \
  include/libxml/xmlstring.h include/libxml/xmlregexp.h \
  include/libxml/dict.h include/libxml/xmlmemory.h \
  include/libxml/threads.h include/libxml/globals.h \
  include/libxml/parser.h include/libxml/hash.h include/libxml/valid.h \
  include/libxml/xmlerror.h include/libxml/list.h \
  include/libxml/xmlautomata.h include/libxml/entities.h \
  include/libxml/xmlIO.h include/libxml/SAX.h include/libxml/xlink.h \
  include/libxml/SAX2.h include/libxml/HTMLparser.h elfgcchack.h
error.o: error.c libxml.h config.h include/libxml/xmlversion.h \
  include/libxml/xmlexports.h /usr/include/stdio.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/string.h include/libxml/parser.h include/libxml/tree.h \
  include/libxml/xmlstring.h include/libxml/xmlregexp.h \
  include/libxml/dict.h include/libxml/hash.h include/libxml/valid.h \
  include/libxml/xmlerror.h include/libxml/list.h \
  include/libxml/xmlautomata.h include/libxml/entities.h \
  include/libxml/encoding.h /usr/include/iconv.h include/libxml/xmlIO.h \
  include/libxml/globals.h include/libxml/SAX.h /usr/include/stdlib.h \
  /usr/include/sys/types.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/alloca.h \
  include/libxml/xlink.h include/libxml/SAX2.h include/libxml/xmlmemory.h \
  include/libxml/threads.h elfgcchack.h
parserInternals.o: parserInternals.c libxml.h config.h \
  include/libxml/xmlversion.h include/libxml/xmlexports.h \
  /usr/include/stdio.h /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/string.h /usr/include/ctype.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/stdlib.h \
  /usr/include/sys/types.h /usr/include/time.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/alloca.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h /usr/include/fcntl.h \
  /usr/include/bits/fcntl.h /usr/include/unistd.h \
  /usr/include/bits/posix_opt.h /usr/include/bits/confname.h \
  /usr/include/getopt.h /usr/include/zlib.h /usr/include/zconf.h \
  include/libxml/xmlmemory.h include/libxml/threads.h \
  include/libxml/globals.h include/libxml/parser.h include/libxml/tree.h \
  include/libxml/xmlstring.h include/libxml/xmlregexp.h \
  include/libxml/dict.h include/libxml/hash.h include/libxml/valid.h \
  include/libxml/xmlerror.h include/libxml/list.h \
  include/libxml/xmlautomata.h include/libxml/entities.h \
  include/libxml/encoding.h /usr/include/iconv.h include/libxml/xmlIO.h \
  include/libxml/SAX.h include/libxml/xlink.h include/libxml/SAX2.h \
  include/libxml/parserInternals.h include/libxml/HTMLparser.h \
  include/libxml/chvalid.h include/libxml/uri.h include/libxml/catalog.h \
  elfgcchack.h
parser.o: parser.c libxml.h config.h include/libxml/xmlversion.h \
  include/libxml/xmlexports.h /usr/include/stdio.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/stdlib.h /usr/include/sys/types.h /usr/include/time.h \
  /usr/include/endian.h /usr/include/bits/endian.h \
  /usr/include/sys/select.h /usr/include/bits/select.h \
  /usr/include/bits/sigset.h /usr/include/bits/time.h \
  /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h \
  /usr/include/alloca.h /usr/include/string.h include/libxml/xmlmemory.h \
  include/libxml/threads.h include/libxml/globals.h \
  include/libxml/parser.h include/libxml/tree.h \
  include/libxml/xmlstring.h include/libxml/xmlregexp.h \
  include/libxml/dict.h include/libxml/hash.h include/libxml/valid.h \
  include/libxml/xmlerror.h include/libxml/list.h \
  include/libxml/xmlautomata.h include/libxml/entities.h \
  include/libxml/encoding.h /usr/include/iconv.h include/libxml/xmlIO.h \
  include/libxml/SAX.h include/libxml/xlink.h include/libxml/SAX2.h \
  include/libxml/parserInternals.h include/libxml/HTMLparser.h \
  include/libxml/chvalid.h include/libxml/uri.h include/libxml/catalog.h \
  include/libxml/xmlschemastypes.h include/libxml/schemasInternals.h \
  include/libxml/xmlschemas.h include/libxml/relaxng.h \
  /usr/include/ctype.h /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/fcntl.h /usr/include/bits/fcntl.h /usr/include/unistd.h \
  /usr/include/bits/posix_opt.h /usr/include/bits/confname.h \
  /usr/include/getopt.h /usr/include/zlib.h /usr/include/zconf.h \
  include/libxml/xpath.h elfgcchack.h
tree.o: tree.c libxml.h config.h include/libxml/xmlversion.h \
  include/libxml/xmlexports.h /usr/include/stdio.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/string.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/ctype.h \
  /usr/include/endian.h /usr/include/bits/endian.h /usr/include/stdlib.h \
  /usr/include/sys/types.h /usr/include/time.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/alloca.h \
  /usr/include/zlib.h /usr/include/zconf.h /usr/include/unistd.h \
  /usr/include/bits/posix_opt.h /usr/include/bits/confname.h \
  /usr/include/getopt.h include/libxml/xmlmemory.h \
  include/libxml/threads.h include/libxml/globals.h \
  include/libxml/parser.h include/libxml/tree.h \
  include/libxml/xmlstring.h include/libxml/xmlregexp.h \
  include/libxml/dict.h include/libxml/hash.h include/libxml/valid.h \
  include/libxml/xmlerror.h include/libxml/list.h \
  include/libxml/xmlautomata.h include/libxml/entities.h \
  include/libxml/encoding.h /usr/include/iconv.h include/libxml/xmlIO.h \
  include/libxml/SAX.h include/libxml/xlink.h include/libxml/SAX2.h \
  include/libxml/uri.h include/libxml/parserInternals.h \
  include/libxml/HTMLparser.h include/libxml/chvalid.h \
  include/libxml/HTMLtree.h include/libxml/debugXML.h \
  include/libxml/xpath.h elfgcchack.h
hash.o: hash.c libxml.h config.h include/libxml/xmlversion.h \
  include/libxml/xmlexports.h /usr/include/stdio.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/string.h include/libxml/parser.h include/libxml/tree.h \
  include/libxml/xmlstring.h include/libxml/xmlregexp.h \
  include/libxml/dict.h include/libxml/hash.h include/libxml/valid.h \
  include/libxml/xmlerror.h include/libxml/list.h \
  include/libxml/xmlautomata.h include/libxml/entities.h \
  include/libxml/encoding.h /usr/include/iconv.h include/libxml/xmlIO.h \
  include/libxml/globals.h include/libxml/SAX.h /usr/include/stdlib.h \
  /usr/include/sys/types.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/alloca.h \
  include/libxml/xlink.h include/libxml/SAX2.h include/libxml/xmlmemory.h \
  include/libxml/threads.h elfgcchack.h
list.o: list.c libxml.h config.h include/libxml/xmlversion.h \
  include/libxml/xmlexports.h /usr/include/stdio.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/stdlib.h /usr/include/sys/types.h /usr/include/time.h \
  /usr/include/endian.h /usr/include/bits/endian.h \
  /usr/include/sys/select.h /usr/include/bits/select.h \
  /usr/include/bits/sigset.h /usr/include/bits/time.h \
  /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h \
  /usr/include/alloca.h /usr/include/string.h include/libxml/xmlmemory.h \
  include/libxml/threads.h include/libxml/globals.h \
  include/libxml/parser.h include/libxml/tree.h \
  include/libxml/xmlstring.h include/libxml/xmlregexp.h \
  include/libxml/dict.h include/libxml/hash.h include/libxml/valid.h \
  include/libxml/xmlerror.h include/libxml/list.h \
  include/libxml/xmlautomata.h include/libxml/entities.h \
  include/libxml/encoding.h /usr/include/iconv.h include/libxml/xmlIO.h \
  include/libxml/SAX.h include/libxml/xlink.h include/libxml/SAX2.h \
  elfgcchack.h
xmlIO.o: xmlIO.c libxml.h config.h include/libxml/xmlversion.h \
  include/libxml/xmlexports.h /usr/include/stdio.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/string.h /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/types.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/sys/stat.h \
  /usr/include/bits/stat.h /usr/include/fcntl.h /usr/include/bits/fcntl.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  /usr/include/stdlib.h /usr/include/alloca.h /usr/include/zlib.h \
  /usr/include/zconf.h include/libxml/xmlmemory.h \
  include/libxml/threads.h include/libxml/globals.h \
  include/libxml/parser.h include/libxml/tree.h \
  include/libxml/xmlstring.h include/libxml/xmlregexp.h \
  include/libxml/dict.h include/libxml/hash.h include/libxml/valid.h \
  include/libxml/xmlerror.h include/libxml/list.h \
  include/libxml/xmlautomata.h include/libxml/entities.h \
  include/libxml/encoding.h /usr/include/iconv.h include/libxml/xmlIO.h \
  include/libxml/SAX.h include/libxml/xlink.h include/libxml/SAX2.h \
  include/libxml/parserInternals.h include/libxml/HTMLparser.h \
  include/libxml/chvalid.h include/libxml/uri.h include/libxml/nanohttp.h \
  include/libxml/nanoftp.h include/libxml/catalog.h elfgcchack.h
xmlmemory.o: xmlmemory.c libxml.h config.h include/libxml/xmlversion.h \
  include/libxml/xmlexports.h /usr/include/stdio.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/string.h /usr/include/sys/types.h /usr/include/time.h \
  /usr/include/endian.h /usr/include/bits/endian.h \
  /usr/include/sys/select.h /usr/include/bits/select.h \
  /usr/include/bits/sigset.h /usr/include/bits/time.h \
  /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h \
  /usr/include/stdlib.h /usr/include/alloca.h /usr/include/ctype.h \
  include/libxml/globals.h include/libxml/parser.h include/libxml/tree.h \
  include/libxml/xmlstring.h include/libxml/xmlregexp.h \
  include/libxml/dict.h include/libxml/hash.h include/libxml/valid.h \
  include/libxml/xmlerror.h include/libxml/list.h \
  include/libxml/xmlautomata.h include/libxml/entities.h \
  include/libxml/encoding.h /usr/include/iconv.h include/libxml/xmlIO.h \
  include/libxml/SAX.h include/libxml/xlink.h include/libxml/SAX2.h \
  include/libxml/xmlmemory.h include/libxml/threads.h elfgcchack.h
uri.o: uri.c libxml.h config.h include/libxml/xmlversion.h \
  include/libxml/xmlexports.h /usr/include/stdio.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/string.h include/libxml/xmlmemory.h \
  include/libxml/threads.h include/libxml/globals.h \
  include/libxml/parser.h include/libxml/tree.h \
  include/libxml/xmlstring.h include/libxml/xmlregexp.h \
  include/libxml/dict.h include/libxml/hash.h include/libxml/valid.h \
  include/libxml/xmlerror.h include/libxml/list.h \
  include/libxml/xmlautomata.h include/libxml/entities.h \
  include/libxml/encoding.h /usr/include/iconv.h include/libxml/xmlIO.h \
  include/libxml/SAX.h /usr/include/stdlib.h /usr/include/sys/types.h \
  /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h \
  /usr/include/sys/select.h /usr/include/bits/select.h \
  /usr/include/bits/sigset.h /usr/include/bits/time.h \
  /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h \
  /usr/include/alloca.h include/libxml/xlink.h include/libxml/SAX2.h \
  include/libxml/uri.h elfgcchack.h
valid.o: valid.c libxml.h config.h include/libxml/xmlversion.h \
  include/libxml/xmlexports.h /usr/include/stdio.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/string.h /usr/include/stdlib.h /usr/include/sys/types.h \
  /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h \
  /usr/include/sys/select.h /usr/include/bits/select.h \
  /usr/include/bits/sigset.h /usr/include/bits/time.h \
  /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h \
  /usr/include/alloca.h include/libxml/xmlmemory.h \
  include/libxml/threads.h include/libxml/globals.h \
  include/libxml/parser.h include/libxml/tree.h \
  include/libxml/xmlstring.h include/libxml/xmlregexp.h \
  include/libxml/dict.h include/libxml/hash.h include/libxml/valid.h \
  include/libxml/xmlerror.h include/libxml/list.h \
  include/libxml/xmlautomata.h include/libxml/entities.h \
  include/libxml/encoding.h /usr/include/iconv.h include/libxml/xmlIO.h \
  include/libxml/SAX.h include/libxml/xlink.h include/libxml/SAX2.h \
  include/libxml/uri.h include/libxml/parserInternals.h \
  include/libxml/HTMLparser.h include/libxml/chvalid.h elfgcchack.h
xlink.o: xlink.c libxml.h config.h include/libxml/xmlversion.h \
  include/libxml/xmlexports.h /usr/include/stdio.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/string.h /usr/include/ctype.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/stdlib.h \
  /usr/include/sys/types.h /usr/include/time.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/alloca.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h /usr/include/fcntl.h \
  /usr/include/bits/fcntl.h /usr/include/unistd.h \
  /usr/include/bits/posix_opt.h /usr/include/bits/confname.h \
  /usr/include/getopt.h /usr/include/zlib.h /usr/include/zconf.h \
  include/libxml/xmlmemory.h include/libxml/threads.h \
  include/libxml/globals.h include/libxml/parser.h include/libxml/tree.h \
  include/libxml/xmlstring.h include/libxml/xmlregexp.h \
  include/libxml/dict.h include/libxml/hash.h include/libxml/valid.h \
  include/libxml/xmlerror.h include/libxml/list.h \
  include/libxml/xmlautomata.h include/libxml/entities.h \
  include/libxml/encoding.h /usr/include/iconv.h include/libxml/xmlIO.h \
  include/libxml/SAX.h include/libxml/xlink.h include/libxml/SAX2.h \
  elfgcchack.h
HTMLparser.o: HTMLparser.c libxml.h config.h include/libxml/xmlversion.h \
  include/libxml/xmlexports.h /usr/include/stdio.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/string.h /usr/include/ctype.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/stdlib.h \
  /usr/include/sys/types.h /usr/include/time.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/alloca.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h /usr/include/fcntl.h \
  /usr/include/bits/fcntl.h /usr/include/unistd.h \
  /usr/include/bits/posix_opt.h /usr/include/bits/confname.h \
  /usr/include/getopt.h /usr/include/zlib.h /usr/include/zconf.h \
  include/libxml/xmlmemory.h include/libxml/threads.h \
  include/libxml/globals.h include/libxml/parser.h include/libxml/tree.h \
  include/libxml/xmlstring.h include/libxml/xmlregexp.h \
  include/libxml/dict.h include/libxml/hash.h include/libxml/valid.h \
  include/libxml/xmlerror.h include/libxml/list.h \
  include/libxml/xmlautomata.h include/libxml/entities.h \
  include/libxml/encoding.h /usr/include/iconv.h include/libxml/xmlIO.h \
  include/libxml/SAX.h include/libxml/xlink.h include/libxml/SAX2.h \
  include/libxml/parserInternals.h include/libxml/HTMLparser.h \
  include/libxml/chvalid.h include/libxml/HTMLtree.h include/libxml/uri.h \
  elfgcchack.h
HTMLtree.o: HTMLtree.c libxml.h config.h include/libxml/xmlversion.h \
  include/libxml/xmlexports.h /usr/include/stdio.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/string.h /usr/include/ctype.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/stdlib.h \
  /usr/include/sys/types.h /usr/include/time.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/alloca.h \
  include/libxml/xmlmemory.h include/libxml/threads.h \
  include/libxml/globals.h include/libxml/parser.h include/libxml/tree.h \
  include/libxml/xmlstring.h include/libxml/xmlregexp.h \
  include/libxml/dict.h include/libxml/hash.h include/libxml/valid.h \
  include/libxml/xmlerror.h include/libxml/list.h \
  include/libxml/xmlautomata.h include/libxml/entities.h \
  include/libxml/encoding.h /usr/include/iconv.h include/libxml/xmlIO.h \
  include/libxml/SAX.h include/libxml/xlink.h include/libxml/SAX2.h \
  include/libxml/HTMLparser.h include/libxml/HTMLtree.h \
  include/libxml/parserInternals.h include/libxml/chvalid.h \
  include/libxml/uri.h elfgcchack.h
debugXML.o: debugXML.c libxml.h config.h include/libxml/xmlversion.h \
  include/libxml/xmlexports.h /usr/include/stdio.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/string.h /usr/include/stdlib.h /usr/include/sys/types.h \
  /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h \
  /usr/include/sys/select.h /usr/include/bits/select.h \
  /usr/include/bits/sigset.h /usr/include/bits/time.h \
  /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h \
  /usr/include/alloca.h include/libxml/xmlmemory.h \
  include/libxml/threads.h include/libxml/globals.h \
  include/libxml/parser.h include/libxml/tree.h \
  include/libxml/xmlstring.h include/libxml/xmlregexp.h \
  include/libxml/dict.h include/libxml/hash.h include/libxml/valid.h \
  include/libxml/xmlerror.h include/libxml/list.h \
  include/libxml/xmlautomata.h include/libxml/entities.h \
  include/libxml/encoding.h /usr/include/iconv.h include/libxml/xmlIO.h \
  include/libxml/SAX.h include/libxml/xlink.h include/libxml/SAX2.h \
  include/libxml/parserInternals.h include/libxml/HTMLparser.h \
  include/libxml/chvalid.h include/libxml/debugXML.h \
  include/libxml/xpath.h include/libxml/HTMLtree.h \
  include/libxml/xpathInternals.h include/libxml/uri.h \
  include/libxml/relaxng.h elfgcchack.h
xpath.o: xpath.c libxml.h config.h include/libxml/xmlversion.h \
  include/libxml/xmlexports.h /usr/include/stdio.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/string.h /usr/include/sys/types.h /usr/include/time.h \
  /usr/include/endian.h /usr/include/bits/endian.h \
  /usr/include/sys/select.h /usr/include/bits/select.h \
  /usr/include/bits/sigset.h /usr/include/bits/time.h \
  /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h \
  /usr/include/math.h /usr/include/bits/huge_val.h \
  /usr/include/bits/mathdef.h /usr/include/bits/mathcalls.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/float.h \
  /usr/include/ctype.h /usr/include/signal.h /usr/include/bits/signum.h \
  /usr/include/bits/siginfo.h /usr/include/bits/sigaction.h \
  /usr/include/bits/sigcontext.h /usr/include/asm/sigcontext.h \
  /usr/include/bits/sigstack.h /usr/include/bits/sigthread.h \
  include/libxml/xmlmemory.h include/libxml/threads.h \
  include/libxml/globals.h include/libxml/parser.h include/libxml/tree.h \
  include/libxml/xmlstring.h include/libxml/xmlregexp.h \
  include/libxml/dict.h include/libxml/hash.h include/libxml/valid.h \
  include/libxml/xmlerror.h include/libxml/list.h \
  include/libxml/xmlautomata.h include/libxml/entities.h \
  include/libxml/encoding.h /usr/include/iconv.h include/libxml/xmlIO.h \
  include/libxml/SAX.h /usr/include/stdlib.h /usr/include/alloca.h \
  include/libxml/xlink.h include/libxml/SAX2.h include/libxml/xpath.h \
  include/libxml/xpathInternals.h include/libxml/parserInternals.h \
  include/libxml/HTMLparser.h include/libxml/chvalid.h \
  include/libxml/xpointer.h include/libxml/debugXML.h \
  include/libxml/pattern.h trionan.c triodef.h trionan.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/assert.h elfgcchack.h
xpointer.o: xpointer.c libxml.h config.h include/libxml/xmlversion.h \
  include/libxml/xmlexports.h /usr/include/stdio.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/string.h include/libxml/xpointer.h include/libxml/tree.h \
  include/libxml/xmlstring.h include/libxml/xmlregexp.h \
  include/libxml/dict.h include/libxml/xmlmemory.h \
  include/libxml/threads.h include/libxml/globals.h \
  include/libxml/parser.h include/libxml/hash.h include/libxml/valid.h \
  include/libxml/xmlerror.h include/libxml/list.h \
  include/libxml/xmlautomata.h include/libxml/entities.h \
  include/libxml/encoding.h /usr/include/iconv.h include/libxml/xmlIO.h \
  include/libxml/SAX.h /usr/include/stdlib.h /usr/include/sys/types.h \
  /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h \
  /usr/include/sys/select.h /usr/include/bits/select.h \
  /usr/include/bits/sigset.h /usr/include/bits/time.h \
  /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h \
  /usr/include/alloca.h include/libxml/xlink.h include/libxml/SAX2.h \
  include/libxml/xpath.h include/libxml/parserInternals.h \
  include/libxml/HTMLparser.h include/libxml/chvalid.h \
  include/libxml/uri.h include/libxml/xpathInternals.h elfgcchack.h
xinclude.o: xinclude.c libxml.h config.h include/libxml/xmlversion.h \
  include/libxml/xmlexports.h /usr/include/stdio.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/string.h include/libxml/xmlmemory.h \
  include/libxml/threads.h include/libxml/globals.h \
  include/libxml/parser.h include/libxml/tree.h \
  include/libxml/xmlstring.h include/libxml/xmlregexp.h \
  include/libxml/dict.h include/libxml/hash.h include/libxml/valid.h \
  include/libxml/xmlerror.h include/libxml/list.h \
  include/libxml/xmlautomata.h include/libxml/entities.h \
  include/libxml/encoding.h /usr/include/iconv.h include/libxml/xmlIO.h \
  include/libxml/SAX.h /usr/include/stdlib.h /usr/include/sys/types.h \
  /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h \
  /usr/include/sys/select.h /usr/include/bits/select.h \
  /usr/include/bits/sigset.h /usr/include/bits/time.h \
  /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h \
  /usr/include/alloca.h include/libxml/xlink.h include/libxml/SAX2.h \
  include/libxml/uri.h include/libxml/xpointer.h include/libxml/xpath.h \
  include/libxml/parserInternals.h include/libxml/HTMLparser.h \
  include/libxml/chvalid.h include/libxml/xinclude.h elfgcchack.h
nanohttp.o: nanohttp.c libxml.h config.h include/libxml/xmlversion.h \
  include/libxml/xmlexports.h /usr/include/stdio.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/string.h /usr/include/stdlib.h /usr/include/sys/types.h \
  /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h \
  /usr/include/sys/select.h /usr/include/bits/select.h \
  /usr/include/bits/sigset.h /usr/include/bits/time.h \
  /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h \
  /usr/include/alloca.h /usr/include/unistd.h \
  /usr/include/bits/posix_opt.h /usr/include/bits/confname.h \
  /usr/include/getopt.h /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  /usr/include/netinet/in.h /usr/include/stdint.h /usr/include/bits/in.h \
  /usr/include/bits/byteswap.h /usr/include/arpa/inet.h \
  /usr/include/netdb.h /usr/include/rpc/netdb.h /usr/include/bits/netdb.h \
  /usr/include/arpa/nameser.h /usr/include/sys/param.h \
  /usr/include/linux/param.h /usr/include/asm/param.h \
  /usr/include/sys/bitypes.h /usr/include/arpa/nameser_compat.h \
  /usr/include/resolv.h /usr/include/fcntl.h /usr/include/bits/fcntl.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/time.h /usr/include/poll.h /usr/include/sys/poll.h \
  /usr/include/bits/poll.h /usr/include/strings.h /usr/include/zlib.h \
  /usr/include/zconf.h include/libxml/globals.h include/libxml/parser.h \
  include/libxml/tree.h include/libxml/xmlstring.h \
  include/libxml/xmlregexp.h include/libxml/dict.h include/libxml/hash.h \
  include/libxml/valid.h include/libxml/xmlerror.h include/libxml/list.h \
  include/libxml/xmlautomata.h include/libxml/entities.h \
  include/libxml/encoding.h /usr/include/iconv.h include/libxml/xmlIO.h \
  include/libxml/SAX.h include/libxml/xlink.h include/libxml/SAX2.h \
  include/libxml/xmlmemory.h include/libxml/threads.h \
  include/libxml/nanohttp.h include/libxml/uri.h elfgcchack.h
nanoftp.o: nanoftp.c libxml.h config.h include/libxml/xmlversion.h \
  include/libxml/xmlexports.h /usr/include/stdio.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/string.h /usr/include/stdlib.h /usr/include/sys/types.h \
  /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h \
  /usr/include/sys/select.h /usr/include/bits/select.h \
  /usr/include/bits/sigset.h /usr/include/bits/time.h \
  /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h \
  /usr/include/alloca.h /usr/include/unistd.h \
  /usr/include/bits/posix_opt.h /usr/include/bits/confname.h \
  /usr/include/getopt.h /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  /usr/include/netinet/in.h /usr/include/stdint.h /usr/include/bits/in.h \
  /usr/include/bits/byteswap.h /usr/include/arpa/inet.h \
  /usr/include/netdb.h /usr/include/rpc/netdb.h /usr/include/bits/netdb.h \
  /usr/include/fcntl.h /usr/include/bits/fcntl.h /usr/include/errno.h \
  /usr/include/bits/errno.h /usr/include/linux/errno.h \
  /usr/include/asm/errno.h /usr/include/asm-generic/errno.h \
  /usr/include/asm-generic/errno-base.h /usr/include/sys/time.h \
  /usr/include/strings.h include/libxml/xmlmemory.h \
  include/libxml/threads.h include/libxml/globals.h \
  include/libxml/parser.h include/libxml/tree.h \
  include/libxml/xmlstring.h include/libxml/xmlregexp.h \
  include/libxml/dict.h include/libxml/hash.h include/libxml/valid.h \
  include/libxml/xmlerror.h include/libxml/list.h \
  include/libxml/xmlautomata.h include/libxml/entities.h \
  include/libxml/encoding.h /usr/include/iconv.h include/libxml/xmlIO.h \
  include/libxml/SAX.h include/libxml/xlink.h include/libxml/SAX2.h \
  include/libxml/uri.h include/libxml/nanoftp.h elfgcchack.h
DOCBparser.o: DOCBparser.c libxml.h config.h include/libxml/xmlversion.h \
  include/libxml/xmlexports.h /usr/include/stdio.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  include/libxml/xmlerror.h include/libxml/parser.h include/libxml/tree.h \
  include/libxml/xmlstring.h include/libxml/xmlregexp.h \
  include/libxml/dict.h include/libxml/hash.h include/libxml/valid.h \
  include/libxml/list.h include/libxml/xmlautomata.h \
  include/libxml/entities.h include/libxml/encoding.h \
  /usr/include/iconv.h include/libxml/xmlIO.h include/libxml/globals.h \
  include/libxml/SAX.h /usr/include/stdlib.h /usr/include/sys/types.h \
  /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h \
  /usr/include/sys/select.h /usr/include/bits/select.h \
  /usr/include/bits/sigset.h /usr/include/bits/time.h \
  /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h \
  /usr/include/alloca.h include/libxml/xlink.h include/libxml/SAX2.h \
  include/libxml/xmlmemory.h include/libxml/threads.h \
  include/libxml/DOCBparser.h include/libxml/parserInternals.h \
  include/libxml/HTMLparser.h include/libxml/chvalid.h elfgcchack.h
catalog.o: catalog.c libxml.h config.h include/libxml/xmlversion.h \
  include/libxml/xmlexports.h /usr/include/stdio.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/sys/types.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/sys/stat.h \
  /usr/include/bits/stat.h /usr/include/unistd.h \
  /usr/include/bits/posix_opt.h /usr/include/bits/confname.h \
  /usr/include/getopt.h /usr/include/fcntl.h /usr/include/bits/fcntl.h \
  /usr/include/stdlib.h /usr/include/alloca.h /usr/include/string.h \
  include/libxml/xmlmemory.h include/libxml/threads.h \
  include/libxml/globals.h include/libxml/parser.h include/libxml/tree.h \
  include/libxml/xmlstring.h include/libxml/xmlregexp.h \
  include/libxml/dict.h include/libxml/hash.h include/libxml/valid.h \
  include/libxml/xmlerror.h include/libxml/list.h \
  include/libxml/xmlautomata.h include/libxml/entities.h \
  include/libxml/encoding.h /usr/include/iconv.h include/libxml/xmlIO.h \
  include/libxml/SAX.h include/libxml/xlink.h include/libxml/SAX2.h \
  include/libxml/uri.h include/libxml/parserInternals.h \
  include/libxml/HTMLparser.h include/libxml/chvalid.h \
  include/libxml/catalog.h elfgcchack.h
globals.o: globals.c libxml.h config.h include/libxml/xmlversion.h \
  include/libxml/xmlexports.h /usr/include/stdio.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/stdlib.h /usr/include/sys/types.h /usr/include/time.h \
  /usr/include/endian.h /usr/include/bits/endian.h \
  /usr/include/sys/select.h /usr/include/bits/select.h \
  /usr/include/bits/sigset.h /usr/include/bits/time.h \
  /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h \
  /usr/include/alloca.h /usr/include/string.h include/libxml/globals.h \
  include/libxml/parser.h include/libxml/tree.h \
  include/libxml/xmlstring.h include/libxml/xmlregexp.h \
  include/libxml/dict.h include/libxml/hash.h include/libxml/valid.h \
  include/libxml/xmlerror.h include/libxml/list.h \
  include/libxml/xmlautomata.h include/libxml/entities.h \
  include/libxml/encoding.h /usr/include/iconv.h include/libxml/xmlIO.h \
  include/libxml/SAX.h include/libxml/xlink.h include/libxml/SAX2.h \
  include/libxml/xmlmemory.h include/libxml/threads.h elfgcchack.h
threads.o: threads.c libxml.h config.h include/libxml/xmlversion.h \
  include/libxml/xmlexports.h /usr/include/stdio.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/string.h include/libxml/threads.h include/libxml/globals.h \
  include/libxml/parser.h include/libxml/tree.h \
  include/libxml/xmlstring.h include/libxml/xmlregexp.h \
  include/libxml/dict.h include/libxml/hash.h include/libxml/valid.h \
  include/libxml/xmlerror.h include/libxml/list.h \
  include/libxml/xmlautomata.h include/libxml/entities.h \
  include/libxml/encoding.h /usr/include/iconv.h include/libxml/xmlIO.h \
  include/libxml/SAX.h /usr/include/stdlib.h /usr/include/sys/types.h \
  /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h \
  /usr/include/sys/select.h /usr/include/bits/select.h \
  /usr/include/bits/sigset.h /usr/include/bits/time.h \
  /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h \
  /usr/include/alloca.h include/libxml/xlink.h include/libxml/SAX2.h \
  include/libxml/xmlmemory.h /usr/include/unistd.h \
  /usr/include/bits/posix_opt.h /usr/include/bits/confname.h \
  /usr/include/getopt.h /usr/include/pthread.h /usr/include/sched.h \
  /usr/include/bits/sched.h /usr/include/signal.h \
  /usr/include/bits/setjmp.h elfgcchack.h
c14n.o: c14n.c libxml.h config.h include/libxml/xmlversion.h \
  include/libxml/xmlexports.h /usr/include/stdio.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/stdlib.h /usr/include/sys/types.h /usr/include/time.h \
  /usr/include/endian.h /usr/include/bits/endian.h \
  /usr/include/sys/select.h /usr/include/bits/select.h \
  /usr/include/bits/sigset.h /usr/include/bits/time.h \
  /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h \
  /usr/include/alloca.h /usr/include/string.h include/libxml/tree.h \
  include/libxml/xmlstring.h include/libxml/xmlregexp.h \
  include/libxml/dict.h include/libxml/xmlmemory.h \
  include/libxml/threads.h include/libxml/globals.h \
  include/libxml/parser.h include/libxml/hash.h include/libxml/valid.h \
  include/libxml/xmlerror.h include/libxml/list.h \
  include/libxml/xmlautomata.h include/libxml/entities.h \
  include/libxml/encoding.h /usr/include/iconv.h include/libxml/xmlIO.h \
  include/libxml/SAX.h include/libxml/xlink.h include/libxml/SAX2.h \
  include/libxml/uri.h include/libxml/xpathInternals.h \
  include/libxml/xpath.h include/libxml/c14n.h elfgcchack.h
xmlstring.o: xmlstring.c libxml.h config.h include/libxml/xmlversion.h \
  include/libxml/xmlexports.h /usr/include/stdio.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/stdlib.h /usr/include/sys/types.h /usr/include/time.h \
  /usr/include/endian.h /usr/include/bits/endian.h \
  /usr/include/sys/select.h /usr/include/bits/select.h \
  /usr/include/bits/sigset.h /usr/include/bits/time.h \
  /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h \
  /usr/include/alloca.h /usr/include/string.h include/libxml/xmlmemory.h \
  include/libxml/threads.h include/libxml/globals.h \
  include/libxml/parser.h include/libxml/tree.h \
  include/libxml/xmlstring.h include/libxml/xmlregexp.h \
  include/libxml/dict.h include/libxml/hash.h include/libxml/valid.h \
  include/libxml/xmlerror.h include/libxml/list.h \
  include/libxml/xmlautomata.h include/libxml/entities.h \
  include/libxml/encoding.h /usr/include/iconv.h include/libxml/xmlIO.h \
  include/libxml/SAX.h include/libxml/xlink.h include/libxml/SAX2.h \
  include/libxml/parserInternals.h include/libxml/HTMLparser.h \
  include/libxml/chvalid.h elfgcchack.h
xmlregexp.o: xmlregexp.c libxml.h config.h include/libxml/xmlversion.h \
  include/libxml/xmlexports.h /usr/include/stdio.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/string.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h include/libxml/tree.h \
  include/libxml/xmlstring.h include/libxml/xmlregexp.h \
  include/libxml/dict.h include/libxml/xmlmemory.h \
  include/libxml/threads.h include/libxml/globals.h \
  include/libxml/parser.h include/libxml/hash.h include/libxml/valid.h \
  include/libxml/xmlerror.h include/libxml/list.h \
  include/libxml/xmlautomata.h include/libxml/entities.h \
  include/libxml/encoding.h /usr/include/iconv.h include/libxml/xmlIO.h \
  include/libxml/SAX.h /usr/include/stdlib.h /usr/include/sys/types.h \
  /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h \
  /usr/include/sys/select.h /usr/include/bits/select.h \
  /usr/include/bits/sigset.h /usr/include/bits/time.h \
  /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h \
  /usr/include/alloca.h include/libxml/xlink.h include/libxml/SAX2.h \
  include/libxml/parserInternals.h include/libxml/HTMLparser.h \
  include/libxml/chvalid.h include/libxml/xmlunicode.h elfgcchack.h
xmlschemas.o: xmlschemas.c libxml.h config.h include/libxml/xmlversion.h \
  include/libxml/xmlexports.h /usr/include/stdio.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/string.h include/libxml/xmlmemory.h \
  include/libxml/threads.h include/libxml/globals.h \
  include/libxml/parser.h include/libxml/tree.h \
  include/libxml/xmlstring.h include/libxml/xmlregexp.h \
  include/libxml/dict.h include/libxml/hash.h include/libxml/valid.h \
  include/libxml/xmlerror.h include/libxml/list.h \
  include/libxml/xmlautomata.h include/libxml/entities.h \
  include/libxml/encoding.h /usr/include/iconv.h include/libxml/xmlIO.h \
  include/libxml/SAX.h /usr/include/stdlib.h /usr/include/sys/types.h \
  /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h \
  /usr/include/sys/select.h /usr/include/bits/select.h \
  /usr/include/bits/sigset.h /usr/include/bits/time.h \
  /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h \
  /usr/include/alloca.h include/libxml/xlink.h include/libxml/SAX2.h \
  include/libxml/parserInternals.h include/libxml/HTMLparser.h \
  include/libxml/chvalid.h include/libxml/uri.h \
  include/libxml/xmlschemas.h include/libxml/schemasInternals.h \
  include/libxml/xmlschemastypes.h include/libxml/pattern.h \
  include/libxml/xmlreader.h include/libxml/relaxng.h elfgcchack.h
xmlschemastypes.o: xmlschemastypes.c libxml.h config.h \
  include/libxml/xmlversion.h include/libxml/xmlexports.h \
  /usr/include/stdio.h /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/string.h include/libxml/xmlmemory.h \
  include/libxml/threads.h include/libxml/globals.h \
  include/libxml/parser.h include/libxml/tree.h \
  include/libxml/xmlstring.h include/libxml/xmlregexp.h \
  include/libxml/dict.h include/libxml/hash.h include/libxml/valid.h \
  include/libxml/xmlerror.h include/libxml/list.h \
  include/libxml/xmlautomata.h include/libxml/entities.h \
  include/libxml/encoding.h /usr/include/iconv.h include/libxml/xmlIO.h \
  include/libxml/SAX.h /usr/include/stdlib.h /usr/include/sys/types.h \
  /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h \
  /usr/include/sys/select.h /usr/include/bits/select.h \
  /usr/include/bits/sigset.h /usr/include/bits/time.h \
  /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h \
  /usr/include/alloca.h include/libxml/xlink.h include/libxml/SAX2.h \
  include/libxml/parserInternals.h include/libxml/HTMLparser.h \
  include/libxml/chvalid.h include/libxml/xpath.h include/libxml/uri.h \
  include/libxml/xmlschemas.h include/libxml/schemasInternals.h \
  include/libxml/xmlschemastypes.h /usr/include/math.h \
  /usr/include/bits/huge_val.h /usr/include/bits/mathdef.h \
  /usr/include/bits/mathcalls.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/float.h elfgcchack.h
xmlunicode.o: xmlunicode.c libxml.h config.h include/libxml/xmlversion.h \
  include/libxml/xmlexports.h /usr/include/stdio.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/string.h include/libxml/xmlunicode.h \
  include/libxml/chvalid.h include/libxml/xmlstring.h elfgcchack.h
xmlreader.o: xmlreader.c libxml.h config.h include/libxml/xmlversion.h \
  include/libxml/xmlexports.h /usr/include/stdio.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/string.h /usr/include/ctype.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/stdlib.h \
  /usr/include/sys/types.h /usr/include/time.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/alloca.h \
  include/libxml/xmlmemory.h include/libxml/threads.h \
  include/libxml/globals.h include/libxml/parser.h include/libxml/tree.h \
  include/libxml/xmlstring.h include/libxml/xmlregexp.h \
  include/libxml/dict.h include/libxml/hash.h include/libxml/valid.h \
  include/libxml/xmlerror.h include/libxml/list.h \
  include/libxml/xmlautomata.h include/libxml/entities.h \
  include/libxml/encoding.h /usr/include/iconv.h include/libxml/xmlIO.h \
  include/libxml/SAX.h include/libxml/xlink.h include/libxml/SAX2.h \
  include/libxml/xmlreader.h include/libxml/relaxng.h \
  include/libxml/xmlschemas.h include/libxml/parserInternals.h \
  include/libxml/HTMLparser.h include/libxml/chvalid.h \
  include/libxml/uri.h include/libxml/xinclude.h include/libxml/pattern.h \
  elfgcchack.h
relaxng.o: relaxng.c libxml.h config.h include/libxml/xmlversion.h \
  include/libxml/xmlexports.h /usr/include/stdio.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/string.h include/libxml/xmlmemory.h \
  include/libxml/threads.h include/libxml/globals.h \
  include/libxml/parser.h include/libxml/tree.h \
  include/libxml/xmlstring.h include/libxml/xmlregexp.h \
  include/libxml/dict.h include/libxml/hash.h include/libxml/valid.h \
  include/libxml/xmlerror.h include/libxml/list.h \
  include/libxml/xmlautomata.h include/libxml/entities.h \
  include/libxml/encoding.h /usr/include/iconv.h include/libxml/xmlIO.h \
  include/libxml/SAX.h /usr/include/stdlib.h /usr/include/sys/types.h \
  /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h \
  /usr/include/sys/select.h /usr/include/bits/select.h \
  /usr/include/bits/sigset.h /usr/include/bits/time.h \
  /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h \
  /usr/include/alloca.h include/libxml/xlink.h include/libxml/SAX2.h \
  include/libxml/parserInternals.h include/libxml/HTMLparser.h \
  include/libxml/chvalid.h include/libxml/uri.h include/libxml/relaxng.h \
  include/libxml/xmlschemastypes.h include/libxml/schemasInternals.h \
  include/libxml/xmlschemas.h elfgcchack.h
dict.o: dict.c libxml.h config.h include/libxml/xmlversion.h \
  include/libxml/xmlexports.h /usr/include/stdio.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/string.h /usr/include/stdint.h include/libxml/tree.h \
  include/libxml/xmlstring.h include/libxml/xmlregexp.h \
  include/libxml/dict.h include/libxml/xmlmemory.h \
  include/libxml/threads.h include/libxml/globals.h \
  include/libxml/parser.h include/libxml/hash.h include/libxml/valid.h \
  include/libxml/xmlerror.h include/libxml/list.h \
  include/libxml/xmlautomata.h include/libxml/entities.h \
  include/libxml/encoding.h /usr/include/iconv.h include/libxml/xmlIO.h \
  include/libxml/SAX.h /usr/include/stdlib.h /usr/include/sys/types.h \
  /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h \
  /usr/include/sys/select.h /usr/include/bits/select.h \
  /usr/include/bits/sigset.h /usr/include/bits/time.h \
  /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h \
  /usr/include/alloca.h include/libxml/xlink.h include/libxml/SAX2.h \
  elfgcchack.h
SAX2.o: SAX2.c libxml.h config.h include/libxml/xmlversion.h \
  include/libxml/xmlexports.h /usr/include/stdio.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/stdlib.h /usr/include/sys/types.h /usr/include/time.h \
  /usr/include/endian.h /usr/include/bits/endian.h \
  /usr/include/sys/select.h /usr/include/bits/select.h \
  /usr/include/bits/sigset.h /usr/include/bits/time.h \
  /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h \
  /usr/include/alloca.h /usr/include/string.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h include/libxml/xmlmemory.h \
  include/libxml/threads.h include/libxml/globals.h \
  include/libxml/parser.h include/libxml/tree.h \
  include/libxml/xmlstring.h include/libxml/xmlregexp.h \
  include/libxml/dict.h include/libxml/hash.h include/libxml/valid.h \
  include/libxml/xmlerror.h include/libxml/list.h \
  include/libxml/xmlautomata.h include/libxml/entities.h \
  include/libxml/encoding.h /usr/include/iconv.h include/libxml/xmlIO.h \
  include/libxml/SAX.h include/libxml/xlink.h include/libxml/SAX2.h \
  include/libxml/parserInternals.h include/libxml/HTMLparser.h \
  include/libxml/chvalid.h include/libxml/debugXML.h \
  include/libxml/xpath.h include/libxml/uri.h include/libxml/HTMLtree.h \
  elfgcchack.h
xmlwriter.o: xmlwriter.c libxml.h config.h include/libxml/xmlversion.h \
  include/libxml/xmlexports.h /usr/include/stdio.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/string.h include/libxml/xmlmemory.h \
  include/libxml/threads.h include/libxml/globals.h \
  include/libxml/parser.h include/libxml/tree.h \
  include/libxml/xmlstring.h include/libxml/xmlregexp.h \
  include/libxml/dict.h include/libxml/hash.h include/libxml/valid.h \
  include/libxml/xmlerror.h include/libxml/list.h \
  include/libxml/xmlautomata.h include/libxml/entities.h \
  include/libxml/encoding.h /usr/include/iconv.h include/libxml/xmlIO.h \
  include/libxml/SAX.h /usr/include/stdlib.h /usr/include/sys/types.h \
  /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h \
  /usr/include/sys/select.h /usr/include/bits/select.h \
  /usr/include/bits/sigset.h /usr/include/bits/time.h \
  /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h \
  /usr/include/alloca.h include/libxml/xlink.h include/libxml/SAX2.h \
  include/libxml/uri.h include/libxml/HTMLtree.h \
  include/libxml/HTMLparser.h include/libxml/xmlwriter.h elfgcchack.h
legacy.o: legacy.c libxml.h config.h include/libxml/xmlversion.h \
  include/libxml/xmlexports.h /usr/include/stdio.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/string.h include/libxml/tree.h include/libxml/xmlstring.h \
  include/libxml/xmlregexp.h include/libxml/dict.h \
  include/libxml/xmlmemory.h include/libxml/threads.h \
  include/libxml/globals.h include/libxml/parser.h include/libxml/hash.h \
  include/libxml/valid.h include/libxml/xmlerror.h include/libxml/list.h \
  include/libxml/xmlautomata.h include/libxml/entities.h \
  include/libxml/encoding.h /usr/include/iconv.h include/libxml/xmlIO.h \
  include/libxml/SAX.h /usr/include/stdlib.h /usr/include/sys/types.h \
  /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h \
  /usr/include/sys/select.h /usr/include/bits/select.h \
  /usr/include/bits/sigset.h /usr/include/bits/time.h \
  /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h \
  /usr/include/alloca.h include/libxml/xlink.h include/libxml/SAX2.h \
  include/libxml/parserInternals.h include/libxml/HTMLparser.h \
  include/libxml/chvalid.h elfgcchack.h
chvalid.o: chvalid.c libxml.h config.h include/libxml/xmlversion.h \
  include/libxml/xmlexports.h /usr/include/stdio.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  include/libxml/chvalid.h include/libxml/xmlstring.h elfgcchack.h
pattern.o: pattern.c libxml.h config.h include/libxml/xmlversion.h \
  include/libxml/xmlexports.h /usr/include/stdio.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/string.h include/libxml/xmlmemory.h \
  include/libxml/threads.h include/libxml/globals.h \
  include/libxml/parser.h include/libxml/tree.h \
  include/libxml/xmlstring.h include/libxml/xmlregexp.h \
  include/libxml/dict.h include/libxml/hash.h include/libxml/valid.h \
  include/libxml/xmlerror.h include/libxml/list.h \
  include/libxml/xmlautomata.h include/libxml/entities.h \
  include/libxml/encoding.h /usr/include/iconv.h include/libxml/xmlIO.h \
  include/libxml/SAX.h /usr/include/stdlib.h /usr/include/sys/types.h \
  /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h \
  /usr/include/sys/select.h /usr/include/bits/select.h \
  /usr/include/bits/sigset.h /usr/include/bits/time.h \
  /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h \
  /usr/include/alloca.h include/libxml/xlink.h include/libxml/SAX2.h \
  include/libxml/parserInternals.h include/libxml/HTMLparser.h \
  include/libxml/chvalid.h include/libxml/pattern.h elfgcchack.h
xmlsave.o: xmlsave.c libxml.h config.h include/libxml/xmlversion.h \
  include/libxml/xmlexports.h /usr/include/stdio.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/string.h include/libxml/xmlmemory.h \
  include/libxml/threads.h include/libxml/globals.h \
  include/libxml/parser.h include/libxml/tree.h \
  include/libxml/xmlstring.h include/libxml/xmlregexp.h \
  include/libxml/dict.h include/libxml/hash.h include/libxml/valid.h \
  include/libxml/xmlerror.h include/libxml/list.h \
  include/libxml/xmlautomata.h include/libxml/entities.h \
  include/libxml/encoding.h /usr/include/iconv.h include/libxml/xmlIO.h \
  include/libxml/SAX.h /usr/include/stdlib.h /usr/include/sys/types.h \
  /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h \
  /usr/include/sys/select.h /usr/include/bits/select.h \
  /usr/include/bits/sigset.h /usr/include/bits/time.h \
  /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h \
  /usr/include/alloca.h include/libxml/xlink.h include/libxml/SAX2.h \
  include/libxml/parserInternals.h include/libxml/HTMLparser.h \
  include/libxml/chvalid.h include/libxml/xmlsave.h \
  include/libxml/HTMLtree.h elfgcchack.h
xmlmodule.o: xmlmodule.c libxml.h config.h include/libxml/xmlversion.h \
  include/libxml/xmlexports.h /usr/include/stdio.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/string.h include/libxml/xmlmemory.h \
  include/libxml/threads.h include/libxml/globals.h \
  include/libxml/parser.h include/libxml/tree.h \
  include/libxml/xmlstring.h include/libxml/xmlregexp.h \
  include/libxml/dict.h include/libxml/hash.h include/libxml/valid.h \
  include/libxml/xmlerror.h include/libxml/list.h \
  include/libxml/xmlautomata.h include/libxml/entities.h \
  include/libxml/encoding.h /usr/include/iconv.h include/libxml/xmlIO.h \
  include/libxml/SAX.h /usr/include/stdlib.h /usr/include/sys/types.h \
  /usr/include/time.h /usr/include/endian.h /usr/include/bits/endian.h \
  /usr/include/sys/select.h /usr/include/bits/select.h \
  /usr/include/bits/sigset.h /usr/include/bits/time.h \
  /usr/include/sys/sysmacros.h /usr/include/bits/pthreadtypes.h \
  /usr/include/alloca.h include/libxml/xlink.h include/libxml/SAX2.h \
  include/libxml/xmlmodule.h /usr/include/dlfcn.h \
  /usr/include/bits/dlfcn.h elfgcchack.h
schematron.o: schematron.c libxml.h config.h include/libxml/xmlversion.h \
  include/libxml/xmlexports.h /usr/include/stdio.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/types.h /usr/include/bits/typesizes.h \
  /usr/include/libio.h /usr/include/_G_config.h /usr/include/wchar.h \
  /usr/include/bits/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/string.h include/libxml/parser.h include/libxml/tree.h \
  include/libxml/xmlstring.h include/libxml/xmlregexp.h \
  include/libxml/dict.h include/libxml/hash.h include/libxml/valid.h \
  include/libxml/xmlerror.h include/libxml/list.h \
  include/libxml/xmlautomata.h include/libxml/entities.h \
  include/libxml/encoding.h /usr/include/iconv.h include/libxml/xmlIO.h \
  include/libxml/globals.h include/libxml/SAX.h /usr/include/stdlib.h \
  /usr/include/sys/types.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/alloca.h \
  include/libxml/xlink.h include/libxml/SAX2.h include/libxml/xmlmemory.h \
  include/libxml/threads.h include/libxml/uri.h include/libxml/xpath.h \
  include/libxml/xpathInternals.h include/libxml/pattern.h \
  include/libxml/schematron.h elfgcchack.h
