CC = gcc
CFLAGS = -Wall -m64

all: main.o lissajous_curve.o
	$(CC) $(CFLAGS) -o output main.o lissajous_curve.o `allegro-config --shared`

lissajous_curve.o: lissajous_curve.s
	nasm -f elf64 -o lissajous_curve.o lissajous_curve.s

main.o: main.c lissajous_curve.h
	$(CC) $(CFLAGS) -c -o main.o main.c

clean:
	rm -f *.o

