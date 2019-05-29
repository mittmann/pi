CC = gcc
CFLAGS = -O0 -g -fopenmp

objects = seq base critical reduction false_sharing
all: $(objects) 

$(objects): %: %.c Makefile
	$(CC) $(CFLAGS) -o $@ $<


clean:
	rm -f *.o
