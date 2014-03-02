BUILDDIR=./bin
SHELL = /bin/sh
CC    = gcc
FLAGS        = -std=gnu99 -Iinclude
CFLAGS       = -fPIC -pedantic -fprofile-arcs -ftest-coverage -march=native -ggdb3
DEBUGFLAGS   = -O0 -D _DEBUG
RELEASEFLAGS = -O2 -D NDEBUG -combine -fwhole-program

TARGET  = latencytop
SOURCES = $(shell echo *.c)
OBJECTS = $(SOURCES:.c=.o)

all: dir $(BUILDDIR)/$(TARGET)

dir:
	mkdir -p $(BUILDDIR)

$(BUILDDIR)/$(TARGET): $(OBJECTS)
	$(CC) $(FLAGS) $(CFLAGS) $(DEBUGFLAGS) -o $(BUILDDIR)/$(TARGET) $(OBJECTS)

clean:
	$(RM) *.o
	$(RM) $(BUILDDIR)/$(TARGET)
