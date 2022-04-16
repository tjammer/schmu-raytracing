##
# schmu-raytracing
#
# @file
# @version 0.1

.PHONY: all clean run time

all: out.o stub.o
	cc out.o stub.o -lm

out.o: raycast.smu
	$(SCHMU) raycast.smu

stub.o: stub.c
	cc -c stub.c

run: all
	./a.out | tee image.ppm

clean:
	rm out.o stub.o a.out

time: all
	time ./a.out

# end
