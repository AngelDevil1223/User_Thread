DEBUG   := n
CC      := gcc
OS      := $(shell uname)
CFLAGS  := -std=gnu99 
LDFLAGS :=

ifeq ($(DEBUG), y	)
	CFLAGS += -DDEBUG -g
endif

ifeq ($(OS), Linux)
	XCFLAGS := -pthread
	XLDLIBS := -lrt
endif

$(UCONTEXT_TARGETS): CFLAGS += -Wno-deprecated-declarations

.PHONY: all clean

all:  sthreads_test

sthreads_test: sthreads_test.o sthreads.o sthreads.h queue.o queue.h
	$(CC) $(CFLAGS) $(LDLIBS) $(filter-out sthreads.h, $^) -o $@

sthreads.o: sthreads.c sthreads.h
	$(CC) $(CFLAGS) -c  $(filter-out sthreads.h, $^) -o $@


%.o: %.c
	$(CC) $(CFLAGS) -c  $< -o $@

clean:
	$(RM) *~ *.o contexts timer sthreads_test
	$(RM) -rf *.dSYM

