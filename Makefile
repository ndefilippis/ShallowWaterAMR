include ../etc/Makefile.p4est.mk

CC = $(P4EST_CC)
CFLAGS = $(P4EST_CFLAGS)
CPPFLAGS = $(P4EST_CPPFLAGS)
LDFLAGS = $(P4EST_LDFLAGS)
LOADLIBES = $(P4EST_LIBS)

TARGETS = $(basename $(wildcard *.c))

all : $(TARGETS)

.PHONY: clean

clean: 
	rm -f p4est_step3 p4est_step3.o
	rm step3_result/*.vtu step3_result/*.pvtu step3_result/*.visit
