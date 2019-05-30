CC = gcc
CFLAGS = -O3 -g -fopenmp

objects = seq base critical reduction false_sharing
all: $(objects) 

$(objects): %: %.c Makefile
	$(CC) $(CFLAGS) -o ../bin/$@ $<


clean:
	rm -f *.o
