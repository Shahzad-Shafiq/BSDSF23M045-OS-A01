# Macros
SUBDIRS = src
LIBDIR = lib
OBJDIR = obj
BINDIR = bin
STATICLIB = libmyutils.a
DYNAMICLIB = libmyutils.so
STATIC_TARGET = $(BINDIR)/client_static
DYNAMIC_TARGET = $(BINDIR)/client_dynamic

.PHONY: all clean $(SUBDIRS) static dynamic

all: static dynamic

$(SUBDIRS):
	$(MAKE) -C $@

# Static library
$(LIBDIR)/$(STATICLIB): $(OBJDIR)/mystrfunctions.o $(OBJDIR)/myfilefunctions.o
	ar rcs $@ $^

static: $(SUBDIRS) $(LIBDIR)/$(STATICLIB)
	$(CC) $(OBJDIR)/main.o -L$(LIBDIR) -lmyutils -o $(STATIC_TARGET)

# Dynamic library
$(LIBDIR)/$(DYNAMICLIB): $(OBJDIR)/mystrfunctions.o $(OBJDIR)/myfilefunctions.o
	$(CC) -shared -o $@ $^

dynamic: $(SUBDIRS) $(LIBDIR)/$(DYNAMICLIB)
	$(CC) $(OBJDIR)/main.o -L$(LIBDIR) -lmyutils -o $(DYNAMIC_TARGET)

clean:
	@for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir clean; \
	done
	rm -f $(LIBDIR)/* $(BINDIR)/*
