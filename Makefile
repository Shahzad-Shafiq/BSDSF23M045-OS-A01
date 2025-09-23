# Macros
SUBDIRS = src
LIBDIR = lib
OBJDIR = obj
BINDIR = bin
LIBNAME = libmyutils.a
TARGET = $(BINDIR)/client_static

# Install locations (default to /usr/local)
PREFIX ?= /usr/local
INSTALL_BIN = $(PREFIX)/bin
INSTALL_MAN = $(PREFIX)/share/man/man1

.PHONY: all clean $(SUBDIRS) install uninstall

all: $(SUBDIRS) $(LIBDIR)/$(LIBNAME)
	@echo "Linking with static library..."
	$(CC) $(OBJDIR)/main.o -L$(LIBDIR) -lmyutils -o $(TARGET)

$(SUBDIRS):
	$(MAKE) -C $@

# Rule to create the static library
$(LIBDIR)/$(LIBNAME): $(OBJDIR)/mystrfunctions.o $(OBJDIR)/myfilefunctions.o
	ar rcs $@ $^

install: all
	@echo "Installing program and man page..."
	mkdir -p $(INSTALL_BIN)
	mkdir -p $(INSTALL_MAN)
	cp $(TARGET) $(INSTALL_BIN)/client
	cp man/man1/client.1 $(INSTALL_MAN)/

uninstall:
	@echo "Removing installed files..."
	rm -f $(INSTALL_BIN)/client
	rm -f $(INSTALL_MAN)/client.1

clean:
	@for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir clean; \
	done
	rm -f $(LIBDIR)/$(LIBNAME) $(TARGET)
