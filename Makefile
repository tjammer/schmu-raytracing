##
# schmu-raytracing
#
# @file
# @version 0.1

.PHONY: all clean run time

all: raytrace

raytrace: out.o stub.o
	cc out.o stub.o -lm -o raytrace

out.o: raytrace.smu
	$(SCHMU) raytrace.smu

stub.o: stub.c
	cc -c stub.c

run: all
	./raytrace | tee image.ppm

clean:
	rm out.o stub.o raytrace

time: all
	time ./raytrace

# end
