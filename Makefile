#
# Makefile for PWMEval project
#
CC = gcc
LDFLAGS = -fPIC -lm

CFLAGS = -O3 -std=gnu99 -W -Wall -pedantic

ifeq ($(prefix),)
    prefix := $(DESTDIR).
endif

binDir = $(prefix)/bin

PROGS = pwm_scoring seqshuffle

all :  $(PROGS)

PWM_SCORING_SRC = pwm_scoring.c
SEQSHUFFLE_SRC = seqshuffle.c

pwm_scoring : $(PWM_SCORING_SRC)
	$(CC) $(CFLAGS) -o pwm_scoring $^

seqshuffle : $(SEQSHUFFLE_SRC)
	$(CC) $(CFLAGS) -o seqshuffle $^

install : $(PROGS)
	mkdir -p $(binDir)
	cp -p $(PROGS) $(binDir)

clean :
	rm -rf $(OBJS) $(PROGS)

uninstall:
	rm -f $(binDir)/pwm_scoring $(binDir)/seqshuffle
