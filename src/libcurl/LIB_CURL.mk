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
file.o: file.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  /usr/include/netinet/in.h /usr/include/bits/in.h \
  /usr/include/bits/byteswap.h /usr/include/netdb.h \
  /usr/include/rpc/netdb.h /usr/include/bits/netdb.h \
  /usr/include/arpa/inet.h /usr/include/net/if.h /usr/include/sys/ioctl.h \
  /usr/include/bits/ioctls.h /usr/include/asm/ioctls.h \
  /usr/include/asm/ioctl.h /usr/include/asm-generic/ioctl.h \
  /usr/include/bits/ioctl-types.h /usr/include/sys/ttydefaults.h \
  /usr/include/sys/param.h /usr/include/linux/param.h \
  /usr/include/asm/param.h /usr/include/fcntl.h /usr/include/bits/fcntl.h \
  strtoofft.h urldata.h cookie.h ../../inc/curl/curl.h \
  ../../inc/curl/curlver.h ../../inc/curl/curlbuild.h \
  ../../inc/curl/curlrules.h ../../inc/curl/easy.h ../../inc/curl/multi.h \
  ../../inc/curl/curl.h formdata.h timeval.h /usr/include/zlib.h \
  /usr/include/zconf.h http_chunks.h hostip.h hash.h llist.h \
  curl_addrinfo.h asyn.h /usr/include/setjmp.h /usr/include/bits/setjmp.h \
  splay.h imap.h pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h \
  rtsp.h wildcard.h progress.h sendf.h escape.h speedcheck.h getinfo.h \
  transfer.h url.h curl_memory.h parsedate.h warnless.h \
  ../../inc/curl/mprintf.h memdebug.h
timeval.o: timeval.c timeval.h curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h
base64.o: base64.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  ../../inc/curl/mprintf.h ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h urldata.h cookie.h \
  ../../inc/curl/curl.h formdata.h /usr/include/netinet/in.h \
  /usr/include/bits/in.h /usr/include/bits/byteswap.h timeval.h \
  /usr/include/zlib.h /usr/include/zconf.h http_chunks.h hostip.h hash.h \
  llist.h curl_addrinfo.h /usr/include/netdb.h /usr/include/rpc/netdb.h \
  /usr/include/bits/netdb.h /usr/include/arpa/inet.h asyn.h \
  /usr/include/setjmp.h /usr/include/bits/setjmp.h splay.h imap.h \
  pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h rtsp.h wildcard.h \
  warnless.h curl_base64.h curl_memory.h non-ascii.h memdebug.h
hostip.o: hostip.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  /usr/include/netinet/in.h /usr/include/bits/in.h \
  /usr/include/bits/byteswap.h /usr/include/netdb.h \
  /usr/include/rpc/netdb.h /usr/include/bits/netdb.h \
  /usr/include/arpa/inet.h /usr/include/setjmp.h \
  /usr/include/bits/setjmp.h /usr/include/signal.h \
  /usr/include/bits/signum.h /usr/include/bits/siginfo.h \
  /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h \
  /usr/include/asm/sigcontext.h /usr/include/bits/sigstack.h \
  /usr/include/bits/sigthread.h urldata.h cookie.h ../../inc/curl/curl.h \
  ../../inc/curl/curlver.h ../../inc/curl/curlbuild.h \
  ../../inc/curl/curlrules.h ../../inc/curl/easy.h ../../inc/curl/multi.h \
  ../../inc/curl/curl.h formdata.h timeval.h /usr/include/zlib.h \
  /usr/include/zconf.h http_chunks.h hostip.h hash.h llist.h \
  curl_addrinfo.h asyn.h splay.h imap.h pingpong.h pop3.h smtp.h ftp.h \
  file.h ssh.h http.h rtsp.h wildcard.h sendf.h share.h strerror.h url.h \
  inet_ntop.h warnless.h ../../inc/curl/mprintf.h curl_memory.h \
  memdebug.h
progress.o: progress.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h urldata.h cookie.h \
  ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h ../../inc/curl/curl.h \
  formdata.h /usr/include/netinet/in.h /usr/include/bits/in.h \
  /usr/include/bits/byteswap.h timeval.h /usr/include/zlib.h \
  /usr/include/zconf.h http_chunks.h hostip.h hash.h llist.h \
  curl_addrinfo.h /usr/include/netdb.h /usr/include/rpc/netdb.h \
  /usr/include/bits/netdb.h /usr/include/arpa/inet.h asyn.h \
  /usr/include/setjmp.h /usr/include/bits/setjmp.h splay.h imap.h \
  pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h rtsp.h wildcard.h \
  sendf.h progress.h ../../inc/curl/mprintf.h
formdata.o: formdata.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h ../../inc/curl/curl.h \
  /usr/include/libgen.h urldata.h cookie.h formdata.h \
  /usr/include/netinet/in.h /usr/include/bits/in.h \
  /usr/include/bits/byteswap.h timeval.h /usr/include/zlib.h \
  /usr/include/zconf.h http_chunks.h hostip.h hash.h llist.h \
  curl_addrinfo.h /usr/include/netdb.h /usr/include/rpc/netdb.h \
  /usr/include/bits/netdb.h /usr/include/arpa/inet.h asyn.h \
  /usr/include/setjmp.h /usr/include/bits/setjmp.h splay.h imap.h \
  pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h rtsp.h wildcard.h \
  curl_rand.h strequal.h curl_memory.h sendf.h ../../inc/curl/mprintf.h \
  memdebug.h
cookie.o: cookie.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  ../../inc/curl/mprintf.h ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h urldata.h cookie.h \
  ../../inc/curl/curl.h formdata.h /usr/include/netinet/in.h \
  /usr/include/bits/in.h /usr/include/bits/byteswap.h timeval.h \
  /usr/include/zlib.h /usr/include/zconf.h http_chunks.h hostip.h hash.h \
  llist.h curl_addrinfo.h /usr/include/netdb.h /usr/include/rpc/netdb.h \
  /usr/include/bits/netdb.h /usr/include/arpa/inet.h asyn.h \
  /usr/include/setjmp.h /usr/include/bits/setjmp.h splay.h imap.h \
  pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h rtsp.h wildcard.h \
  strequal.h strtok.h sendf.h curl_memory.h share.h strtoofft.h rawstr.h \
  curl_memrchr.h memdebug.h
http.o: http.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  /usr/include/netinet/in.h /usr/include/bits/in.h \
  /usr/include/bits/byteswap.h /usr/include/netdb.h \
  /usr/include/rpc/netdb.h /usr/include/bits/netdb.h \
  /usr/include/arpa/inet.h /usr/include/net/if.h /usr/include/sys/ioctl.h \
  /usr/include/bits/ioctls.h /usr/include/asm/ioctls.h \
  /usr/include/asm/ioctl.h /usr/include/asm-generic/ioctl.h \
  /usr/include/bits/ioctl-types.h /usr/include/sys/ttydefaults.h \
  /usr/include/sys/param.h /usr/include/linux/param.h \
  /usr/include/asm/param.h urldata.h cookie.h ../../inc/curl/curl.h \
  ../../inc/curl/curlver.h ../../inc/curl/curlbuild.h \
  ../../inc/curl/curlrules.h ../../inc/curl/easy.h ../../inc/curl/multi.h \
  ../../inc/curl/curl.h formdata.h timeval.h /usr/include/zlib.h \
  /usr/include/zconf.h http_chunks.h hostip.h hash.h llist.h \
  curl_addrinfo.h asyn.h /usr/include/setjmp.h /usr/include/bits/setjmp.h \
  splay.h imap.h pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h \
  rtsp.h wildcard.h transfer.h sendf.h progress.h curl_base64.h \
  strequal.h sslgen.h http_digest.h curl_ntlm.h curl_ntlm_wb.h \
  http_negotiate.h url.h share.h curl_memory.h select.h \
  /usr/include/sys/poll.h /usr/include/bits/poll.h parsedate.h \
  strtoofft.h multiif.h rawstr.h content_encoding.h http_proxy.h \
  warnless.h non-ascii.h bundles.h pipeline.h ../../inc/curl/mprintf.h \
  memdebug.h
sendf.o: sendf.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h ../../inc/curl/curl.h \
  urldata.h cookie.h formdata.h /usr/include/netinet/in.h \
  /usr/include/bits/in.h /usr/include/bits/byteswap.h timeval.h \
  /usr/include/zlib.h /usr/include/zconf.h http_chunks.h hostip.h hash.h \
  llist.h curl_addrinfo.h /usr/include/netdb.h /usr/include/rpc/netdb.h \
  /usr/include/bits/netdb.h /usr/include/arpa/inet.h asyn.h \
  /usr/include/setjmp.h /usr/include/bits/setjmp.h splay.h imap.h \
  pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h rtsp.h wildcard.h \
  sendf.h connect.h nonblock.h sockaddr.h sslgen.h multiif.h non-ascii.h \
  ../../inc/curl/mprintf.h curl_memory.h strerror.h memdebug.h
ftp.o: ftp.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  /usr/include/netinet/in.h /usr/include/bits/in.h \
  /usr/include/bits/byteswap.h /usr/include/arpa/inet.h \
  /usr/include/netdb.h /usr/include/rpc/netdb.h /usr/include/bits/netdb.h \
  ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h ../../inc/curl/curl.h \
  urldata.h cookie.h formdata.h timeval.h /usr/include/zlib.h \
  /usr/include/zconf.h http_chunks.h hostip.h hash.h llist.h \
  curl_addrinfo.h asyn.h /usr/include/setjmp.h /usr/include/bits/setjmp.h \
  splay.h imap.h pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h \
  rtsp.h wildcard.h sendf.h if2ip.h progress.h transfer.h escape.h \
  socks.h fileinfo.h ftplistparser.h strtoofft.h strequal.h sslgen.h \
  connect.h nonblock.h sockaddr.h strerror.h inet_ntop.h inet_pton.h \
  select.h /usr/include/sys/poll.h /usr/include/bits/poll.h parsedate.h \
  multiif.h url.h rawstr.h speedcheck.h warnless.h http_proxy.h \
  non-ascii.h ../../inc/curl/mprintf.h curl_memory.h memdebug.h
url.o: url.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  /usr/include/netinet/in.h /usr/include/bits/in.h \
  /usr/include/bits/byteswap.h /usr/include/netdb.h \
  /usr/include/rpc/netdb.h /usr/include/bits/netdb.h \
  /usr/include/arpa/inet.h /usr/include/net/if.h /usr/include/sys/ioctl.h \
  /usr/include/bits/ioctls.h /usr/include/asm/ioctls.h \
  /usr/include/asm/ioctl.h /usr/include/asm-generic/ioctl.h \
  /usr/include/bits/ioctl-types.h /usr/include/sys/ttydefaults.h \
  /usr/include/sys/param.h /usr/include/linux/param.h \
  /usr/include/asm/param.h urldata.h cookie.h ../../inc/curl/curl.h \
  ../../inc/curl/curlver.h ../../inc/curl/curlbuild.h \
  ../../inc/curl/curlrules.h ../../inc/curl/easy.h ../../inc/curl/multi.h \
  ../../inc/curl/curl.h formdata.h timeval.h /usr/include/zlib.h \
  /usr/include/zconf.h http_chunks.h hostip.h hash.h llist.h \
  curl_addrinfo.h asyn.h /usr/include/setjmp.h /usr/include/bits/setjmp.h \
  splay.h imap.h pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h \
  rtsp.h wildcard.h netrc.h sslgen.h transfer.h sendf.h progress.h \
  strequal.h strerror.h escape.h strtok.h share.h content_encoding.h \
  http_digest.h http_negotiate.h select.h /usr/include/sys/poll.h \
  /usr/include/bits/poll.h multiif.h easyif.h speedcheck.h rawstr.h \
  warnless.h non-ascii.h inet_pton.h dict.h telnet.h tftp.h curl_ldap.h \
  url.h connect.h nonblock.h sockaddr.h inet_ntop.h curl_ntlm.h \
  curl_ntlm_wb.h socks.h curl_rtmp.h gopher.h http_proxy.h bundles.h \
  conncache.h multihandle.h pipeline.h ../../inc/curl/mprintf.h \
  curl_memory.h memdebug.h
dict.o: dict.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  /usr/include/netinet/in.h /usr/include/bits/in.h \
  /usr/include/bits/byteswap.h /usr/include/netdb.h \
  /usr/include/rpc/netdb.h /usr/include/bits/netdb.h \
  /usr/include/arpa/inet.h /usr/include/net/if.h /usr/include/sys/ioctl.h \
  /usr/include/bits/ioctls.h /usr/include/asm/ioctls.h \
  /usr/include/asm/ioctl.h /usr/include/asm-generic/ioctl.h \
  /usr/include/bits/ioctl-types.h /usr/include/sys/ttydefaults.h \
  /usr/include/sys/param.h /usr/include/linux/param.h \
  /usr/include/asm/param.h urldata.h cookie.h ../../inc/curl/curl.h \
  ../../inc/curl/curlver.h ../../inc/curl/curlbuild.h \
  ../../inc/curl/curlrules.h ../../inc/curl/easy.h ../../inc/curl/multi.h \
  ../../inc/curl/curl.h formdata.h timeval.h /usr/include/zlib.h \
  /usr/include/zconf.h http_chunks.h hostip.h hash.h llist.h \
  curl_addrinfo.h asyn.h /usr/include/setjmp.h /usr/include/bits/setjmp.h \
  splay.h imap.h pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h \
  rtsp.h wildcard.h transfer.h sendf.h progress.h strequal.h dict.h \
  rawstr.h ../../inc/curl/mprintf.h curl_memory.h memdebug.h
if2ip.o: if2ip.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  /usr/include/netinet/in.h /usr/include/bits/in.h \
  /usr/include/bits/byteswap.h /usr/include/arpa/inet.h \
  /usr/include/net/if.h /usr/include/sys/ioctl.h \
  /usr/include/bits/ioctls.h /usr/include/asm/ioctls.h \
  /usr/include/asm/ioctl.h /usr/include/asm-generic/ioctl.h \
  /usr/include/bits/ioctl-types.h /usr/include/sys/ttydefaults.h \
  /usr/include/netdb.h /usr/include/rpc/netdb.h /usr/include/bits/netdb.h \
  /usr/include/ifaddrs.h /usr/include/stropts.h \
  /usr/include/bits/xtitypes.h /usr/include/bits/stropts.h inet_ntop.h \
  strequal.h ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h ../../inc/curl/curl.h \
  if2ip.h ../../inc/curl/mprintf.h curl_memory.h memdebug.h
speedcheck.o: speedcheck.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h ../../inc/curl/curl.h \
  urldata.h cookie.h formdata.h /usr/include/netinet/in.h \
  /usr/include/bits/in.h /usr/include/bits/byteswap.h timeval.h \
  /usr/include/zlib.h /usr/include/zconf.h http_chunks.h hostip.h hash.h \
  llist.h curl_addrinfo.h /usr/include/netdb.h /usr/include/rpc/netdb.h \
  /usr/include/bits/netdb.h /usr/include/arpa/inet.h asyn.h \
  /usr/include/setjmp.h /usr/include/bits/setjmp.h splay.h imap.h \
  pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h rtsp.h wildcard.h \
  sendf.h multiif.h speedcheck.h
ldap.o: ldap.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h
ssluse.o: ssluse.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h urldata.h cookie.h \
  ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h ../../inc/curl/curl.h \
  formdata.h /usr/include/netinet/in.h /usr/include/bits/in.h \
  /usr/include/bits/byteswap.h timeval.h /usr/include/zlib.h \
  /usr/include/zconf.h http_chunks.h hostip.h hash.h llist.h \
  curl_addrinfo.h /usr/include/netdb.h /usr/include/rpc/netdb.h \
  /usr/include/bits/netdb.h /usr/include/arpa/inet.h asyn.h \
  /usr/include/setjmp.h /usr/include/bits/setjmp.h splay.h imap.h \
  pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h rtsp.h wildcard.h \
  sendf.h url.h inet_pton.h ssluse.h connect.h nonblock.h sockaddr.h \
  strequal.h select.h /usr/include/sys/poll.h /usr/include/bits/poll.h \
  sslgen.h rawstr.h hostcheck.h ../../inc/curl/mprintf.h
version.o: version.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h ../../inc/curl/curl.h \
  urldata.h cookie.h formdata.h /usr/include/netinet/in.h \
  /usr/include/bits/in.h /usr/include/bits/byteswap.h timeval.h \
  /usr/include/zlib.h /usr/include/zconf.h http_chunks.h hostip.h hash.h \
  llist.h curl_addrinfo.h /usr/include/netdb.h /usr/include/rpc/netdb.h \
  /usr/include/bits/netdb.h /usr/include/arpa/inet.h asyn.h \
  /usr/include/setjmp.h /usr/include/bits/setjmp.h splay.h imap.h \
  pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h rtsp.h wildcard.h \
  sslgen.h ../../inc/curl/mprintf.h
getenv.o: getenv.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h ../../inc/curl/curl.h \
  curl_memory.h memdebug.h
escape.o: escape.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h ../../inc/curl/curl.h \
  curl_memory.h urldata.h cookie.h formdata.h /usr/include/netinet/in.h \
  /usr/include/bits/in.h /usr/include/bits/byteswap.h timeval.h \
  /usr/include/zlib.h /usr/include/zconf.h http_chunks.h hostip.h hash.h \
  llist.h curl_addrinfo.h /usr/include/netdb.h /usr/include/rpc/netdb.h \
  /usr/include/bits/netdb.h /usr/include/arpa/inet.h asyn.h \
  /usr/include/setjmp.h /usr/include/bits/setjmp.h splay.h imap.h \
  pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h rtsp.h wildcard.h \
  warnless.h non-ascii.h escape.h ../../inc/curl/mprintf.h memdebug.h
mprintf.o: mprintf.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  ../../inc/curl/mprintf.h ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h curl_memory.h \
  ../../inc/curl/curl.h memdebug.h
telnet.o: telnet.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  /usr/include/netinet/in.h /usr/include/bits/in.h \
  /usr/include/bits/byteswap.h /usr/include/netdb.h \
  /usr/include/rpc/netdb.h /usr/include/bits/netdb.h \
  /usr/include/arpa/inet.h /usr/include/net/if.h /usr/include/sys/ioctl.h \
  /usr/include/bits/ioctls.h /usr/include/asm/ioctls.h \
  /usr/include/asm/ioctl.h /usr/include/asm-generic/ioctl.h \
  /usr/include/bits/ioctl-types.h /usr/include/sys/ttydefaults.h \
  /usr/include/sys/param.h /usr/include/linux/param.h \
  /usr/include/asm/param.h urldata.h cookie.h ../../inc/curl/curl.h \
  ../../inc/curl/curlver.h ../../inc/curl/curlbuild.h \
  ../../inc/curl/curlrules.h ../../inc/curl/easy.h ../../inc/curl/multi.h \
  ../../inc/curl/curl.h formdata.h timeval.h /usr/include/zlib.h \
  /usr/include/zconf.h http_chunks.h hostip.h hash.h llist.h \
  curl_addrinfo.h asyn.h /usr/include/setjmp.h /usr/include/bits/setjmp.h \
  splay.h imap.h pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h \
  rtsp.h wildcard.h transfer.h sendf.h telnet.h connect.h nonblock.h \
  sockaddr.h progress.h ../../inc/curl/mprintf.h arpa_telnet.h \
  curl_memory.h select.h /usr/include/sys/poll.h /usr/include/bits/poll.h \
  strequal.h rawstr.h warnless.h memdebug.h
netrc.o: netrc.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h /usr/include/pwd.h \
  ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h ../../inc/curl/curl.h \
  netrc.h strequal.h strtok.h curl_memory.h rawstr.h \
  ../../inc/curl/mprintf.h memdebug.h
getinfo.o: getinfo.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h ../../inc/curl/curl.h \
  urldata.h cookie.h formdata.h /usr/include/netinet/in.h \
  /usr/include/bits/in.h /usr/include/bits/byteswap.h timeval.h \
  /usr/include/zlib.h /usr/include/zconf.h http_chunks.h hostip.h hash.h \
  llist.h curl_addrinfo.h /usr/include/netdb.h /usr/include/rpc/netdb.h \
  /usr/include/bits/netdb.h /usr/include/arpa/inet.h asyn.h \
  /usr/include/setjmp.h /usr/include/bits/setjmp.h splay.h imap.h \
  pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h rtsp.h wildcard.h \
  getinfo.h curl_memory.h sslgen.h connect.h nonblock.h sockaddr.h \
  progress.h memdebug.h
transfer.o: transfer.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h strtoofft.h \
  strequal.h ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h ../../inc/curl/curl.h \
  rawstr.h /usr/include/netinet/in.h /usr/include/bits/in.h \
  /usr/include/bits/byteswap.h /usr/include/netdb.h \
  /usr/include/rpc/netdb.h /usr/include/bits/netdb.h \
  /usr/include/arpa/inet.h /usr/include/net/if.h /usr/include/sys/ioctl.h \
  /usr/include/bits/ioctls.h /usr/include/asm/ioctls.h \
  /usr/include/asm/ioctl.h /usr/include/asm-generic/ioctl.h \
  /usr/include/bits/ioctl-types.h /usr/include/sys/ttydefaults.h \
  /usr/include/signal.h /usr/include/bits/signum.h \
  /usr/include/bits/siginfo.h /usr/include/bits/sigaction.h \
  /usr/include/bits/sigcontext.h /usr/include/asm/sigcontext.h \
  /usr/include/bits/sigstack.h /usr/include/bits/sigthread.h \
  /usr/include/sys/param.h /usr/include/linux/param.h \
  /usr/include/asm/param.h urldata.h cookie.h formdata.h timeval.h \
  /usr/include/zlib.h /usr/include/zconf.h http_chunks.h hostip.h hash.h \
  llist.h curl_addrinfo.h asyn.h /usr/include/setjmp.h \
  /usr/include/bits/setjmp.h splay.h imap.h pingpong.h pop3.h smtp.h \
  ftp.h file.h ssh.h http.h rtsp.h wildcard.h netrc.h content_encoding.h \
  transfer.h sendf.h speedcheck.h progress.h url.h getinfo.h sslgen.h \
  http_digest.h curl_ntlm.h http_negotiate.h share.h curl_memory.h \
  select.h /usr/include/sys/poll.h /usr/include/bits/poll.h multiif.h \
  connect.h nonblock.h sockaddr.h non-ascii.h ../../inc/curl/mprintf.h \
  memdebug.h
strequal.o: strequal.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  /usr/include/strings.h strequal.h ../../inc/curl/curl.h \
  ../../inc/curl/curlver.h ../../inc/curl/curlbuild.h \
  ../../inc/curl/curlrules.h ../../inc/curl/easy.h ../../inc/curl/multi.h \
  ../../inc/curl/curl.h
easy.o: easy.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  /usr/include/netinet/in.h /usr/include/bits/in.h \
  /usr/include/bits/byteswap.h /usr/include/netdb.h \
  /usr/include/rpc/netdb.h /usr/include/bits/netdb.h \
  /usr/include/arpa/inet.h /usr/include/net/if.h /usr/include/sys/ioctl.h \
  /usr/include/bits/ioctls.h /usr/include/asm/ioctls.h \
  /usr/include/asm/ioctl.h /usr/include/asm-generic/ioctl.h \
  /usr/include/bits/ioctl-types.h /usr/include/sys/ttydefaults.h \
  /usr/include/sys/param.h /usr/include/linux/param.h \
  /usr/include/asm/param.h strequal.h ../../inc/curl/curl.h \
  ../../inc/curl/curlver.h ../../inc/curl/curlbuild.h \
  ../../inc/curl/curlrules.h ../../inc/curl/easy.h ../../inc/curl/multi.h \
  ../../inc/curl/curl.h urldata.h cookie.h formdata.h timeval.h \
  /usr/include/zlib.h /usr/include/zconf.h http_chunks.h hostip.h hash.h \
  llist.h curl_addrinfo.h asyn.h /usr/include/setjmp.h \
  /usr/include/bits/setjmp.h splay.h imap.h pingpong.h pop3.h smtp.h \
  ftp.h file.h ssh.h http.h rtsp.h wildcard.h transfer.h sslgen.h url.h \
  getinfo.h share.h strdup.h curl_memory.h progress.h easyif.h select.h \
  /usr/include/sys/poll.h /usr/include/bits/poll.h sendf.h curl_ntlm.h \
  connect.h nonblock.h sockaddr.h slist.h amigaos.h curl_rand.h \
  non-ascii.h warnless.h conncache.h multiif.h ../../inc/curl/mprintf.h \
  memdebug.h
security.o: security.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h
krb4.o: krb4.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h
curl_fnmatch.o: curl_fnmatch.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h curl_fnmatch.h \
  ../../inc/curl/mprintf.h ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h curl_memory.h \
  ../../inc/curl/curl.h memdebug.h
fileinfo.o: fileinfo.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h strdup.h fileinfo.h \
  ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h ../../inc/curl/curl.h \
  ../../inc/curl/mprintf.h curl_memory.h memdebug.h
ftplistparser.o: ftplistparser.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h ../../inc/curl/curl.h \
  urldata.h cookie.h formdata.h /usr/include/netinet/in.h \
  /usr/include/bits/in.h /usr/include/bits/byteswap.h timeval.h \
  /usr/include/zlib.h /usr/include/zconf.h http_chunks.h hostip.h hash.h \
  llist.h curl_addrinfo.h /usr/include/netdb.h /usr/include/rpc/netdb.h \
  /usr/include/bits/netdb.h /usr/include/arpa/inet.h asyn.h \
  /usr/include/setjmp.h /usr/include/bits/setjmp.h splay.h imap.h \
  pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h rtsp.h wildcard.h \
  fileinfo.h strtoofft.h rawstr.h ftplistparser.h curl_fnmatch.h \
  ../../inc/curl/mprintf.h curl_memory.h memdebug.h
wildcard.o: wildcard.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h wildcard.h \
  ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h ../../inc/curl/curl.h \
  llist.h fileinfo.h ../../inc/curl/mprintf.h curl_memory.h memdebug.h
krb5.o: krb5.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h
memdebug.o: memdebug.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h
http_chunks.o: http_chunks.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h urldata.h cookie.h \
  ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h ../../inc/curl/curl.h \
  formdata.h /usr/include/netinet/in.h /usr/include/bits/in.h \
  /usr/include/bits/byteswap.h timeval.h /usr/include/zlib.h \
  /usr/include/zconf.h http_chunks.h hostip.h hash.h llist.h \
  curl_addrinfo.h /usr/include/netdb.h /usr/include/rpc/netdb.h \
  /usr/include/bits/netdb.h /usr/include/arpa/inet.h asyn.h \
  /usr/include/setjmp.h /usr/include/bits/setjmp.h splay.h imap.h \
  pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h rtsp.h wildcard.h \
  sendf.h content_encoding.h curl_memory.h non-ascii.h \
  ../../inc/curl/mprintf.h memdebug.h
strtok.o: strtok.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h
connect.o: connect.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  /usr/include/netinet/in.h /usr/include/bits/in.h \
  /usr/include/bits/byteswap.h /usr/include/sys/un.h \
  /usr/include/netinet/tcp.h /usr/include/sys/ioctl.h \
  /usr/include/bits/ioctls.h /usr/include/asm/ioctls.h \
  /usr/include/asm/ioctl.h /usr/include/asm-generic/ioctl.h \
  /usr/include/bits/ioctl-types.h /usr/include/sys/ttydefaults.h \
  /usr/include/netdb.h /usr/include/rpc/netdb.h /usr/include/bits/netdb.h \
  /usr/include/fcntl.h /usr/include/bits/fcntl.h /usr/include/arpa/inet.h \
  ../../inc/curl/mprintf.h ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h urldata.h cookie.h \
  ../../inc/curl/curl.h formdata.h timeval.h /usr/include/zlib.h \
  /usr/include/zconf.h http_chunks.h hostip.h hash.h llist.h \
  curl_addrinfo.h asyn.h /usr/include/setjmp.h /usr/include/bits/setjmp.h \
  splay.h imap.h pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h \
  rtsp.h wildcard.h sendf.h if2ip.h strerror.h connect.h nonblock.h \
  sockaddr.h curl_memory.h select.h /usr/include/sys/poll.h \
  /usr/include/bits/poll.h url.h multiif.h inet_ntop.h inet_pton.h \
  sslgen.h progress.h warnless.h conncache.h multihandle.h memdebug.h
llist.o: llist.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h llist.h \
  curl_memory.h ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h ../../inc/curl/curl.h \
  memdebug.h
hash.o: hash.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h hash.h llist.h \
  ../../inc/curl/mprintf.h ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h curl_memory.h \
  ../../inc/curl/curl.h memdebug.h
multi.o: multi.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h ../../inc/curl/curl.h \
  urldata.h cookie.h formdata.h /usr/include/netinet/in.h \
  /usr/include/bits/in.h /usr/include/bits/byteswap.h timeval.h \
  /usr/include/zlib.h /usr/include/zconf.h http_chunks.h hostip.h hash.h \
  llist.h curl_addrinfo.h /usr/include/netdb.h /usr/include/rpc/netdb.h \
  /usr/include/bits/netdb.h /usr/include/arpa/inet.h asyn.h \
  /usr/include/setjmp.h /usr/include/bits/setjmp.h splay.h imap.h \
  pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h rtsp.h wildcard.h \
  transfer.h url.h connect.h nonblock.h sockaddr.h progress.h easyif.h \
  multiif.h sendf.h select.h /usr/include/sys/poll.h \
  /usr/include/bits/poll.h warnless.h speedcheck.h conncache.h bundles.h \
  multihandle.h pipeline.h ../../inc/curl/mprintf.h curl_memory.h \
  memdebug.h
content_encoding.o: content_encoding.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h
share.o: share.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h ../../inc/curl/curl.h \
  urldata.h cookie.h formdata.h /usr/include/netinet/in.h \
  /usr/include/bits/in.h /usr/include/bits/byteswap.h timeval.h \
  /usr/include/zlib.h /usr/include/zconf.h http_chunks.h hostip.h hash.h \
  llist.h curl_addrinfo.h /usr/include/netdb.h /usr/include/rpc/netdb.h \
  /usr/include/bits/netdb.h /usr/include/arpa/inet.h asyn.h \
  /usr/include/setjmp.h /usr/include/bits/setjmp.h splay.h imap.h \
  pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h rtsp.h wildcard.h \
  share.h sslgen.h curl_memory.h memdebug.h
http_digest.o: http_digest.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h urldata.h cookie.h \
  ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h ../../inc/curl/curl.h \
  formdata.h /usr/include/netinet/in.h /usr/include/bits/in.h \
  /usr/include/bits/byteswap.h timeval.h /usr/include/zlib.h \
  /usr/include/zconf.h http_chunks.h hostip.h hash.h llist.h \
  curl_addrinfo.h /usr/include/netdb.h /usr/include/rpc/netdb.h \
  /usr/include/bits/netdb.h /usr/include/arpa/inet.h asyn.h \
  /usr/include/setjmp.h /usr/include/bits/setjmp.h splay.h imap.h \
  pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h rtsp.h wildcard.h \
  sendf.h rawstr.h curl_base64.h curl_md5.h curl_hmac.h http_digest.h \
  strtok.h url.h curl_memory.h non-ascii.h warnless.h \
  ../../inc/curl/mprintf.h memdebug.h
md4.o: md4.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h
md5.o: md5.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h curl_md5.h \
  curl_hmac.h warnless.h curl_memory.h ../../inc/curl/curl.h \
  ../../inc/curl/curlver.h ../../inc/curl/curlbuild.h \
  ../../inc/curl/curlrules.h ../../inc/curl/easy.h ../../inc/curl/multi.h \
  ../../inc/curl/curl.h memdebug.h
curl_rand.o: curl_rand.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h ../../inc/curl/curl.h \
  curl_rand.h ../../inc/curl/mprintf.h curl_memory.h memdebug.h
http_negotiate.o: http_negotiate.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h
inet_pton.o: inet_pton.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h
strtoofft.o: strtoofft.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h strtoofft.h
strerror.o: strerror.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h ../../inc/curl/curl.h \
  strerror.h urldata.h cookie.h formdata.h /usr/include/netinet/in.h \
  /usr/include/bits/in.h /usr/include/bits/byteswap.h timeval.h \
  /usr/include/zlib.h /usr/include/zconf.h http_chunks.h hostip.h hash.h \
  llist.h curl_addrinfo.h /usr/include/netdb.h /usr/include/rpc/netdb.h \
  /usr/include/bits/netdb.h /usr/include/arpa/inet.h asyn.h \
  /usr/include/setjmp.h /usr/include/bits/setjmp.h splay.h imap.h \
  pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h rtsp.h wildcard.h \
  ../../inc/curl/mprintf.h curl_memory.h memdebug.h
amigaos.o: amigaos.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h
hostasyn.o: hostasyn.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  /usr/include/netinet/in.h /usr/include/bits/in.h \
  /usr/include/bits/byteswap.h /usr/include/netdb.h \
  /usr/include/rpc/netdb.h /usr/include/bits/netdb.h \
  /usr/include/arpa/inet.h urldata.h cookie.h ../../inc/curl/curl.h \
  ../../inc/curl/curlver.h ../../inc/curl/curlbuild.h \
  ../../inc/curl/curlrules.h ../../inc/curl/easy.h ../../inc/curl/multi.h \
  ../../inc/curl/curl.h formdata.h timeval.h /usr/include/zlib.h \
  /usr/include/zconf.h http_chunks.h hostip.h hash.h llist.h \
  curl_addrinfo.h asyn.h /usr/include/setjmp.h /usr/include/bits/setjmp.h \
  splay.h imap.h pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h \
  rtsp.h wildcard.h sendf.h share.h strerror.h url.h \
  ../../inc/curl/mprintf.h curl_memory.h memdebug.h
hostip4.o: hostip4.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  /usr/include/netinet/in.h /usr/include/bits/in.h \
  /usr/include/bits/byteswap.h /usr/include/netdb.h \
  /usr/include/rpc/netdb.h /usr/include/bits/netdb.h \
  /usr/include/arpa/inet.h urldata.h cookie.h ../../inc/curl/curl.h \
  ../../inc/curl/curlver.h ../../inc/curl/curlbuild.h \
  ../../inc/curl/curlrules.h ../../inc/curl/easy.h ../../inc/curl/multi.h \
  ../../inc/curl/curl.h formdata.h timeval.h /usr/include/zlib.h \
  /usr/include/zconf.h http_chunks.h hostip.h hash.h llist.h \
  curl_addrinfo.h asyn.h /usr/include/setjmp.h /usr/include/bits/setjmp.h \
  splay.h imap.h pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h \
  rtsp.h wildcard.h sendf.h share.h strerror.h url.h inet_pton.h \
  ../../inc/curl/mprintf.h curl_memory.h memdebug.h
hostip6.o: hostip6.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  /usr/include/netinet/in.h /usr/include/bits/in.h \
  /usr/include/bits/byteswap.h /usr/include/netdb.h \
  /usr/include/rpc/netdb.h /usr/include/bits/netdb.h \
  /usr/include/arpa/inet.h urldata.h cookie.h ../../inc/curl/curl.h \
  ../../inc/curl/curlver.h ../../inc/curl/curlbuild.h \
  ../../inc/curl/curlrules.h ../../inc/curl/easy.h ../../inc/curl/multi.h \
  ../../inc/curl/curl.h formdata.h timeval.h /usr/include/zlib.h \
  /usr/include/zconf.h http_chunks.h hostip.h hash.h llist.h \
  curl_addrinfo.h asyn.h /usr/include/setjmp.h /usr/include/bits/setjmp.h \
  splay.h imap.h pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h \
  rtsp.h wildcard.h sendf.h share.h strerror.h url.h inet_pton.h \
  connect.h nonblock.h sockaddr.h ../../inc/curl/mprintf.h curl_memory.h \
  memdebug.h
hostsyn.o: hostsyn.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  /usr/include/netinet/in.h /usr/include/bits/in.h \
  /usr/include/bits/byteswap.h /usr/include/netdb.h \
  /usr/include/rpc/netdb.h /usr/include/bits/netdb.h \
  /usr/include/arpa/inet.h urldata.h cookie.h ../../inc/curl/curl.h \
  ../../inc/curl/curlver.h ../../inc/curl/curlbuild.h \
  ../../inc/curl/curlrules.h ../../inc/curl/easy.h ../../inc/curl/multi.h \
  ../../inc/curl/curl.h formdata.h timeval.h /usr/include/zlib.h \
  /usr/include/zconf.h http_chunks.h hostip.h hash.h llist.h \
  curl_addrinfo.h asyn.h /usr/include/setjmp.h /usr/include/bits/setjmp.h \
  splay.h imap.h pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h \
  rtsp.h wildcard.h sendf.h share.h strerror.h url.h \
  ../../inc/curl/mprintf.h curl_memory.h memdebug.h
inet_ntop.o: inet_ntop.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h
parsedate.o: parsedate.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h ../../inc/curl/curl.h \
  rawstr.h warnless.h parsedate.h
select.o: select.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h ../../inc/curl/curl.h \
  urldata.h cookie.h formdata.h /usr/include/netinet/in.h \
  /usr/include/bits/in.h /usr/include/bits/byteswap.h timeval.h \
  /usr/include/zlib.h /usr/include/zconf.h http_chunks.h hostip.h hash.h \
  llist.h curl_addrinfo.h /usr/include/netdb.h /usr/include/rpc/netdb.h \
  /usr/include/bits/netdb.h /usr/include/arpa/inet.h asyn.h \
  /usr/include/setjmp.h /usr/include/bits/setjmp.h splay.h imap.h \
  pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h rtsp.h wildcard.h \
  connect.h nonblock.h sockaddr.h select.h /usr/include/sys/poll.h \
  /usr/include/bits/poll.h warnless.h
gtls.o: gtls.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h
sslgen.o: sslgen.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h urldata.h cookie.h \
  ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h ../../inc/curl/curl.h \
  formdata.h /usr/include/netinet/in.h /usr/include/bits/in.h \
  /usr/include/bits/byteswap.h timeval.h /usr/include/zlib.h \
  /usr/include/zconf.h http_chunks.h hostip.h hash.h llist.h \
  curl_addrinfo.h /usr/include/netdb.h /usr/include/rpc/netdb.h \
  /usr/include/bits/netdb.h /usr/include/arpa/inet.h asyn.h \
  /usr/include/setjmp.h /usr/include/bits/setjmp.h splay.h imap.h \
  pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h rtsp.h wildcard.h \
  sslgen.h ssluse.h gtls.h nssg.h qssl.h polarssl.h axtls.h cyassl.h \
  curl_schannel.h curl_darwinssl.h sendf.h rawstr.h url.h curl_memory.h \
  progress.h share.h memdebug.h
tftp.o: tftp.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  /usr/include/netinet/in.h /usr/include/bits/in.h \
  /usr/include/bits/byteswap.h /usr/include/netdb.h \
  /usr/include/rpc/netdb.h /usr/include/bits/netdb.h \
  /usr/include/arpa/inet.h /usr/include/net/if.h /usr/include/sys/ioctl.h \
  /usr/include/bits/ioctls.h /usr/include/asm/ioctls.h \
  /usr/include/asm/ioctl.h /usr/include/asm-generic/ioctl.h \
  /usr/include/bits/ioctl-types.h /usr/include/sys/ttydefaults.h \
  /usr/include/sys/param.h /usr/include/linux/param.h \
  /usr/include/asm/param.h urldata.h cookie.h ../../inc/curl/curl.h \
  ../../inc/curl/curlver.h ../../inc/curl/curlbuild.h \
  ../../inc/curl/curlrules.h ../../inc/curl/easy.h ../../inc/curl/multi.h \
  ../../inc/curl/curl.h formdata.h timeval.h /usr/include/zlib.h \
  /usr/include/zconf.h http_chunks.h hostip.h hash.h llist.h \
  curl_addrinfo.h asyn.h /usr/include/setjmp.h /usr/include/bits/setjmp.h \
  splay.h imap.h pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h \
  rtsp.h wildcard.h transfer.h sendf.h tftp.h progress.h connect.h \
  nonblock.h sockaddr.h strerror.h multiif.h url.h rawstr.h \
  ../../inc/curl/mprintf.h curl_memory.h select.h /usr/include/sys/poll.h \
  /usr/include/bits/poll.h memdebug.h
splay.o: splay.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h splay.h
strdup.o: strdup.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h strdup.h
socks.o: socks.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  /usr/include/netinet/in.h /usr/include/bits/in.h \
  /usr/include/bits/byteswap.h /usr/include/arpa/inet.h urldata.h \
  cookie.h ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h ../../inc/curl/curl.h \
  formdata.h timeval.h /usr/include/zlib.h /usr/include/zconf.h \
  http_chunks.h hostip.h hash.h llist.h curl_addrinfo.h \
  /usr/include/netdb.h /usr/include/rpc/netdb.h /usr/include/bits/netdb.h \
  asyn.h /usr/include/setjmp.h /usr/include/bits/setjmp.h splay.h imap.h \
  pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h rtsp.h wildcard.h \
  sendf.h strequal.h select.h /usr/include/sys/poll.h \
  /usr/include/bits/poll.h connect.h nonblock.h sockaddr.h socks.h \
  memdebug.h
ssh.o: ssh.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h
nss.o: nss.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h
qssl.o: qssl.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h
rawstr.o: rawstr.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h rawstr.h \
  ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h ../../inc/curl/curl.h
curl_addrinfo.o: curl_addrinfo.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h ../../inc/curl/curl.h \
  /usr/include/netinet/in.h /usr/include/bits/in.h \
  /usr/include/bits/byteswap.h /usr/include/netdb.h \
  /usr/include/rpc/netdb.h /usr/include/bits/netdb.h \
  /usr/include/arpa/inet.h curl_addrinfo.h inet_pton.h warnless.h \
  ../../inc/curl/mprintf.h curl_memory.h memdebug.h
socks_gssapi.o: socks_gssapi.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h
socks_sspi.o: socks_sspi.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h
curl_sspi.o: curl_sspi.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h
slist.o: slist.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h curl_memory.h \
  ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h ../../inc/curl/curl.h \
  slist.h memdebug.h
nonblock.o: nonblock.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  /usr/include/sys/ioctl.h /usr/include/bits/ioctls.h \
  /usr/include/asm/ioctls.h /usr/include/asm/ioctl.h \
  /usr/include/asm-generic/ioctl.h /usr/include/bits/ioctl-types.h \
  /usr/include/sys/ttydefaults.h /usr/include/fcntl.h \
  /usr/include/bits/fcntl.h nonblock.h ../../inc/curl/curl.h \
  ../../inc/curl/curlver.h ../../inc/curl/curlbuild.h \
  ../../inc/curl/curlrules.h ../../inc/curl/easy.h ../../inc/curl/multi.h \
  ../../inc/curl/curl.h
curl_memrchr.o: curl_memrchr.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h curl_memrchr.h \
  ../../inc/curl/mprintf.h ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h curl_memory.h \
  ../../inc/curl/curl.h memdebug.h
imap.o: imap.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  /usr/include/netinet/in.h /usr/include/bits/in.h \
  /usr/include/bits/byteswap.h /usr/include/arpa/inet.h \
  /usr/include/netdb.h /usr/include/rpc/netdb.h /usr/include/bits/netdb.h \
  ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h ../../inc/curl/curl.h \
  urldata.h cookie.h formdata.h timeval.h /usr/include/zlib.h \
  /usr/include/zconf.h http_chunks.h hostip.h hash.h llist.h \
  curl_addrinfo.h asyn.h /usr/include/setjmp.h /usr/include/bits/setjmp.h \
  splay.h imap.h pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h \
  rtsp.h wildcard.h sendf.h if2ip.h progress.h transfer.h escape.h \
  socks.h strtoofft.h strequal.h sslgen.h connect.h nonblock.h sockaddr.h \
  strerror.h select.h /usr/include/sys/poll.h /usr/include/bits/poll.h \
  multiif.h url.h rawstr.h curl_sasl.h ../../inc/curl/mprintf.h \
  curl_memory.h memdebug.h
pop3.o: pop3.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  /usr/include/netinet/in.h /usr/include/bits/in.h \
  /usr/include/bits/byteswap.h /usr/include/arpa/inet.h \
  /usr/include/netdb.h /usr/include/rpc/netdb.h /usr/include/bits/netdb.h \
  ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h ../../inc/curl/curl.h \
  urldata.h cookie.h formdata.h timeval.h /usr/include/zlib.h \
  /usr/include/zconf.h http_chunks.h hostip.h hash.h llist.h \
  curl_addrinfo.h asyn.h /usr/include/setjmp.h /usr/include/bits/setjmp.h \
  splay.h imap.h pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h \
  rtsp.h wildcard.h sendf.h if2ip.h progress.h transfer.h escape.h \
  socks.h strtoofft.h strequal.h sslgen.h connect.h nonblock.h sockaddr.h \
  strerror.h select.h /usr/include/sys/poll.h /usr/include/bits/poll.h \
  multiif.h url.h rawstr.h curl_sasl.h curl_md5.h curl_hmac.h warnless.h \
  ../../inc/curl/mprintf.h curl_memory.h memdebug.h
smtp.o: smtp.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  /usr/include/netinet/in.h /usr/include/bits/in.h \
  /usr/include/bits/byteswap.h /usr/include/arpa/inet.h \
  /usr/include/netdb.h /usr/include/rpc/netdb.h /usr/include/bits/netdb.h \
  ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h ../../inc/curl/curl.h \
  urldata.h cookie.h formdata.h timeval.h /usr/include/zlib.h \
  /usr/include/zconf.h http_chunks.h hostip.h hash.h llist.h \
  curl_addrinfo.h asyn.h /usr/include/setjmp.h /usr/include/bits/setjmp.h \
  splay.h imap.h pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h \
  rtsp.h wildcard.h sendf.h if2ip.h progress.h transfer.h escape.h \
  socks.h strtoofft.h strequal.h sslgen.h connect.h nonblock.h sockaddr.h \
  strerror.h select.h /usr/include/sys/poll.h /usr/include/bits/poll.h \
  multiif.h url.h rawstr.h curl_gethostname.h curl_sasl.h warnless.h \
  ../../inc/curl/mprintf.h curl_memory.h memdebug.h
pingpong.o: pingpong.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h urldata.h cookie.h \
  ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h ../../inc/curl/curl.h \
  formdata.h /usr/include/netinet/in.h /usr/include/bits/in.h \
  /usr/include/bits/byteswap.h timeval.h /usr/include/zlib.h \
  /usr/include/zconf.h http_chunks.h hostip.h hash.h llist.h \
  curl_addrinfo.h /usr/include/netdb.h /usr/include/rpc/netdb.h \
  /usr/include/bits/netdb.h /usr/include/arpa/inet.h asyn.h \
  /usr/include/setjmp.h /usr/include/bits/setjmp.h splay.h imap.h \
  pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h rtsp.h wildcard.h \
  sendf.h select.h /usr/include/sys/poll.h /usr/include/bits/poll.h \
  progress.h speedcheck.h multiif.h non-ascii.h ../../inc/curl/mprintf.h \
  curl_memory.h memdebug.h
rtsp.o: rtsp.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h urldata.h cookie.h \
  ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h ../../inc/curl/curl.h \
  formdata.h /usr/include/netinet/in.h /usr/include/bits/in.h \
  /usr/include/bits/byteswap.h timeval.h /usr/include/zlib.h \
  /usr/include/zconf.h http_chunks.h hostip.h hash.h llist.h \
  curl_addrinfo.h /usr/include/netdb.h /usr/include/rpc/netdb.h \
  /usr/include/bits/netdb.h /usr/include/arpa/inet.h asyn.h \
  /usr/include/setjmp.h /usr/include/bits/setjmp.h splay.h imap.h \
  pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h rtsp.h wildcard.h \
  transfer.h sendf.h multiif.h url.h progress.h rawstr.h curl_memory.h \
  select.h /usr/include/sys/poll.h /usr/include/bits/poll.h connect.h \
  nonblock.h sockaddr.h ../../inc/curl/mprintf.h memdebug.h
curl_threads.o: curl_threads.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h curl_threads.h \
  ../../inc/curl/mprintf.h ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h curl_memory.h \
  ../../inc/curl/curl.h memdebug.h
warnless.o: warnless.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h warnless.h
hmac.o: hmac.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h curl_hmac.h \
  ../../inc/curl/mprintf.h ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h curl_memory.h \
  ../../inc/curl/curl.h memdebug.h
polarssl.o: polarssl.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h
polarssl_threadlock.o: polarssl_threadlock.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h
curl_rtmp.o: curl_rtmp.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h
openldap.o: openldap.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h
curl_gethostname.o: curl_gethostname.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h curl_gethostname.h
gopher.o: gopher.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h urldata.h cookie.h \
  ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h ../../inc/curl/curl.h \
  formdata.h /usr/include/netinet/in.h /usr/include/bits/in.h \
  /usr/include/bits/byteswap.h timeval.h /usr/include/zlib.h \
  /usr/include/zconf.h http_chunks.h hostip.h hash.h llist.h \
  curl_addrinfo.h /usr/include/netdb.h /usr/include/rpc/netdb.h \
  /usr/include/bits/netdb.h /usr/include/arpa/inet.h asyn.h \
  /usr/include/setjmp.h /usr/include/bits/setjmp.h splay.h imap.h \
  pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h rtsp.h wildcard.h \
  transfer.h sendf.h progress.h strequal.h gopher.h rawstr.h select.h \
  /usr/include/sys/poll.h /usr/include/bits/poll.h url.h warnless.h \
  ../../inc/curl/mprintf.h curl_memory.h memdebug.h
axtls.o: axtls.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h
idn_win32.o: idn_win32.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h
http_negotiate_sspi.o: http_negotiate_sspi.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h
cyassl.o: cyassl.c curl_setup.h curl_config.h ../../inc/curl/curlbuild.h \
  /usr/include/sys/types.h /usr/include/features.h \
  /usr/include/sys/cdefs.h /usr/include/bits/wordsize.h \
  /usr/include/gnu/stubs.h /usr/include/gnu/stubs-32.h \
  /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h
http_proxy.o: http_proxy.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h urldata.h cookie.h \
  ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h ../../inc/curl/curl.h \
  formdata.h /usr/include/netinet/in.h /usr/include/bits/in.h \
  /usr/include/bits/byteswap.h timeval.h /usr/include/zlib.h \
  /usr/include/zconf.h http_chunks.h hostip.h hash.h llist.h \
  curl_addrinfo.h /usr/include/netdb.h /usr/include/rpc/netdb.h \
  /usr/include/bits/netdb.h /usr/include/arpa/inet.h asyn.h \
  /usr/include/setjmp.h /usr/include/bits/setjmp.h splay.h imap.h \
  pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h rtsp.h wildcard.h \
  http_proxy.h sendf.h url.h select.h /usr/include/sys/poll.h \
  /usr/include/bits/poll.h rawstr.h progress.h non-ascii.h connect.h \
  nonblock.h sockaddr.h ../../inc/curl/mprintf.h curlx.h strequal.h \
  strtoofft.h warnless.h curl_memory.h memdebug.h
non-ascii.o: non-ascii.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h
asyn-ares.o: asyn-ares.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  /usr/include/netinet/in.h /usr/include/bits/in.h \
  /usr/include/bits/byteswap.h /usr/include/netdb.h \
  /usr/include/rpc/netdb.h /usr/include/bits/netdb.h \
  /usr/include/arpa/inet.h
asyn-thread.o: asyn-thread.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  /usr/include/netinet/in.h /usr/include/bits/in.h \
  /usr/include/bits/byteswap.h /usr/include/netdb.h \
  /usr/include/rpc/netdb.h /usr/include/bits/netdb.h \
  /usr/include/arpa/inet.h urldata.h cookie.h ../../inc/curl/curl.h \
  ../../inc/curl/curlver.h ../../inc/curl/curlbuild.h \
  ../../inc/curl/curlrules.h ../../inc/curl/easy.h ../../inc/curl/multi.h \
  ../../inc/curl/curl.h formdata.h timeval.h /usr/include/zlib.h \
  /usr/include/zconf.h http_chunks.h hostip.h hash.h llist.h \
  curl_addrinfo.h asyn.h /usr/include/setjmp.h /usr/include/bits/setjmp.h \
  splay.h imap.h pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h \
  rtsp.h wildcard.h sendf.h share.h strerror.h url.h multiif.h \
  inet_pton.h inet_ntop.h curl_threads.h ../../inc/curl/mprintf.h \
  curl_memory.h memdebug.h
curl_gssapi.o: curl_gssapi.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h
curl_ntlm.o: curl_ntlm.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h
curl_ntlm_wb.o: curl_ntlm_wb.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h
curl_ntlm_core.o: curl_ntlm_core.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h
curl_ntlm_msgs.o: curl_ntlm_msgs.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h
curl_sasl.o: curl_sasl.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h ../../inc/curl/curl.h \
  urldata.h cookie.h formdata.h /usr/include/netinet/in.h \
  /usr/include/bits/in.h /usr/include/bits/byteswap.h timeval.h \
  /usr/include/zlib.h /usr/include/zconf.h http_chunks.h hostip.h hash.h \
  llist.h curl_addrinfo.h /usr/include/netdb.h /usr/include/rpc/netdb.h \
  /usr/include/bits/netdb.h /usr/include/arpa/inet.h asyn.h \
  /usr/include/setjmp.h /usr/include/bits/setjmp.h splay.h imap.h \
  pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h rtsp.h wildcard.h \
  curl_base64.h curl_md5.h curl_hmac.h curl_rand.h curl_ntlm_msgs.h \
  curl_sasl.h warnless.h curl_memory.h ../../inc/curl/mprintf.h \
  memdebug.h
curl_schannel.o: curl_schannel.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h
curl_multibyte.o: curl_multibyte.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h
curl_darwinssl.o: curl_darwinssl.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h
hostcheck.o: hostcheck.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h
bundles.o: bundles.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h ../../inc/curl/curl.h \
  urldata.h cookie.h formdata.h /usr/include/netinet/in.h \
  /usr/include/bits/in.h /usr/include/bits/byteswap.h timeval.h \
  /usr/include/zlib.h /usr/include/zconf.h http_chunks.h hostip.h hash.h \
  llist.h curl_addrinfo.h /usr/include/netdb.h /usr/include/rpc/netdb.h \
  /usr/include/bits/netdb.h /usr/include/arpa/inet.h asyn.h \
  /usr/include/setjmp.h /usr/include/bits/setjmp.h splay.h imap.h \
  pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h rtsp.h wildcard.h \
  url.h progress.h multiif.h bundles.h sendf.h rawstr.h curl_memory.h \
  memdebug.h
conncache.o: conncache.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h ../../inc/curl/curl.h \
  urldata.h cookie.h formdata.h /usr/include/netinet/in.h \
  /usr/include/bits/in.h /usr/include/bits/byteswap.h timeval.h \
  /usr/include/zlib.h /usr/include/zconf.h http_chunks.h hostip.h hash.h \
  llist.h curl_addrinfo.h /usr/include/netdb.h /usr/include/rpc/netdb.h \
  /usr/include/bits/netdb.h /usr/include/arpa/inet.h asyn.h \
  /usr/include/setjmp.h /usr/include/bits/setjmp.h splay.h imap.h \
  pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h rtsp.h wildcard.h \
  url.h progress.h multiif.h sendf.h rawstr.h bundles.h conncache.h \
  curl_memory.h memdebug.h
pipeline.o: pipeline.c curl_setup.h curl_config.h \
  ../../inc/curl/curlbuild.h /usr/include/sys/types.h \
  /usr/include/features.h /usr/include/sys/cdefs.h \
  /usr/include/bits/wordsize.h /usr/include/gnu/stubs.h \
  /usr/include/gnu/stubs-32.h /usr/include/bits/types.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stddef.h \
  /usr/include/bits/typesizes.h /usr/include/time.h /usr/include/endian.h \
  /usr/include/bits/endian.h /usr/include/sys/select.h \
  /usr/include/bits/select.h /usr/include/bits/sigset.h \
  /usr/include/bits/time.h /usr/include/sys/sysmacros.h \
  /usr/include/bits/pthreadtypes.h /usr/include/stdint.h \
  /usr/include/bits/wchar.h /usr/include/inttypes.h \
  /usr/include/sys/socket.h /usr/include/sys/uio.h \
  /usr/include/bits/uio.h /usr/include/bits/socket.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/limits.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/syslimits.h \
  /usr/include/limits.h /usr/include/bits/posix1_lim.h \
  /usr/include/bits/local_lim.h /usr/include/linux/limits.h \
  /usr/include/bits/posix2_lim.h /usr/include/bits/sockaddr.h \
  /usr/include/asm/socket.h /usr/include/asm/sockios.h \
  ../../inc/curl/curlrules.h /usr/include/stdio.h /usr/include/libio.h \
  /usr/include/_G_config.h /usr/include/wchar.h /usr/include/gconv.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdarg.h \
  /usr/include/bits/stdio_lim.h /usr/include/bits/sys_errlist.h \
  /usr/include/assert.h curl_setup_once.h /usr/include/stdlib.h \
  /usr/include/alloca.h /usr/include/string.h /usr/include/ctype.h \
  /usr/include/errno.h /usr/include/bits/errno.h \
  /usr/include/linux/errno.h /usr/include/asm/errno.h \
  /usr/include/asm-generic/errno.h /usr/include/asm-generic/errno-base.h \
  /usr/include/sys/stat.h /usr/include/bits/stat.h \
  /usr/include/sys/time.h \
  /usr/lib/gcc/i386-redhat-linux/4.1.2/include/stdbool.h \
  /usr/include/unistd.h /usr/include/bits/posix_opt.h \
  /usr/include/bits/confname.h /usr/include/getopt.h \
  ../../inc/curl/curl.h ../../inc/curl/curlver.h \
  ../../inc/curl/curlbuild.h ../../inc/curl/curlrules.h \
  ../../inc/curl/easy.h ../../inc/curl/multi.h ../../inc/curl/curl.h \
  urldata.h cookie.h formdata.h /usr/include/netinet/in.h \
  /usr/include/bits/in.h /usr/include/bits/byteswap.h timeval.h \
  /usr/include/zlib.h /usr/include/zconf.h http_chunks.h hostip.h hash.h \
  llist.h curl_addrinfo.h /usr/include/netdb.h /usr/include/rpc/netdb.h \
  /usr/include/bits/netdb.h /usr/include/arpa/inet.h asyn.h \
  /usr/include/setjmp.h /usr/include/bits/setjmp.h splay.h imap.h \
  pingpong.h pop3.h smtp.h ftp.h file.h ssh.h http.h rtsp.h wildcard.h \
  url.h progress.h multiif.h pipeline.h sendf.h rawstr.h bundles.h \
  curl_memory.h memdebug.h
