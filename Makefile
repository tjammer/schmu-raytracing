##
# schmu-raytracing
#
# @file
# @version 0.1

.PHONY: all clean run time check-syntax

all: raytrace

raytrace: raytrace.o stub.o v3.o
	cc raytrace.o v3.o stub.o -lm -o raytrace

raytrace.o: raytrace.smu v3.smi
	$(SCHMU) --release raytrace.smu

v3.o v3.smi: v3.smu
	$(SCHMU) --release -m v3.smu

stub.o: stub.c
	cc -c stub.c

run: all
	./raytrace | tee image.ppm

clean:
	rm raytrace.o stub.o raytrace v3.o v3.smi

time: all
	time ./raytrace

check-syntax: raytrace.o

# end
