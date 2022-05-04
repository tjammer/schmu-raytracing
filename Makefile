##
# schmu-raytracing
#
# @file
# @version 0.1

.PHONY: all clean run time

all: raytrace

raytrace: raytrace.o stub.o
	cc raytrace.o stub.o -lm -o raytrace

raytrace.o: raytrace.smu
	$(SCHMU) --release raytrace.smu

stub.o: stub.c
	cc -c stub.c

run: all
	./raytrace | tee image.ppm

clean:
	rm raytrace.o stub.o raytrace

time: all
	time ./raytrace

# end
