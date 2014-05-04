ROOT = ../..

include $(ROOT)/common/Makefile.common

BINS = $(BINDIR)/lb-ll
PROF = $(ROOT)/src

.PHONY:	all clean

all:	main

linkedlist.o: 
	$(CC) $(CFLAGS) -c -o $(BUILDIR)/linkedlist.o linkedlist.c

main.o: linkedlist.h
	$(CC) $(CFLAGS) -c -o $(BUILDIR)/main.o main.c

main: linkedlist.o main.o
	$(CC) $(CFLAGS) $(BUILDIR)/linkedlist.o  $(BUILDIR)/main.o -o $(BINS) $(LDFLAGS) 

clean:
	rm -f $(BINS)
