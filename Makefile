# Macros
SUBDIRS = src
TARGET = bin/client

.PHONY: all clean $(SUBDIRS)

all: $(SUBDIRS)
	@echo "Linking object files..."
	$(CC) obj/*.o -o $(TARGET)

$(SUBDIRS):
	$(MAKE) -C $@

clean:
	@for dir in $(SUBDIRS); do \
		$(MAKE) -C $$dir clean; \
	done
	rm -f $(TARGET)
