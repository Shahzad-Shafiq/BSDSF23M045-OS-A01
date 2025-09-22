# Macros
CC = gcc
CFLAGS = -Wall -I../include
OBJDIR = ../obj

SRCS = mystrfunctions.c myfilefunctions.c main.c
OBJS = $(SRCS:%.c=$(OBJDIR)/%.o)

.PHONY: all clean

all: $(OBJS)

$(OBJDIR)/%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJDIR)/*.o
