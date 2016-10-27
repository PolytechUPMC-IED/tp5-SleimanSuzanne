CC=gcc
CFLAGS= -O3 -Wall -funroll-loops
LDLIBS= -lpng
OBJS= pbm2png.o pbm2eps9.o

all: pbm2png pbm2eps9

pbm2png: 
	$(CC) $(CFLAGS) -s -o pbm2png pbm2png.c $(LDLIBS)

pbm2eps9: printer.o pbm2eps9.o
	$(CC) -s -o pbm2eps9 pbm2eps9.o printer.o

clean:
	-rm -f $(OBJS) pbm2png pbm2eps9

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<
