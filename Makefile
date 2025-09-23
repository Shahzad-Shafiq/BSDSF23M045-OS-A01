# Macros
SUBDIRS = src
LIBDIR = lib
OBJDIR = obj
BINDIR = bin
LIBNAME = libmyutils.a
TARGET = $(BINDIR)/client_static

.PHONY: all clean $(SUBDIRS)

all: $(SUBDIRS) $(LIBDIR)/$(LIBNAME)
	@echo "Linking with static library..."
	$(CC) $(OBJDIR)/main.o -L$(LIBDIR) -lmyutils -o $(TARGET)

$(SUBDIRS):
	$(MAKE) -C $@

# Rule to create the static library
$(LIBDIR)/$(LIBNAME): $(OBJDIR)/mystrfunctions.o $(OBJDIR)/myfilefunctions.o
	ar rcs $@ $^

clean:
	@for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir clean; \
	done
	rm -f $(LIBDIR)/$(LIBNAME) $(TARGET)
