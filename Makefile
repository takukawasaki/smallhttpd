CC?=cc
CFLAGS?=-O
LIBS=`[ \`uname\` = "SunOS" ] && echo -lsocket -lnsl`

all: smallhttpd

smallhttpd: smallhttpd.c
	$(CC) $(CFLAGS) $(LIBS) smallhttpd.c -o $@

clean:
	rm -f smallhttpd core smallhttpd.core

.PHONY: all clean
