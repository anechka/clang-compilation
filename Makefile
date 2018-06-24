BUILDDIR=build

CC=/usr/bin/clang
ARCH=-arch x86_64
CFLAGS=$(ARCH) -Os -Wall -std=c11
LIBRARY = main.so
MODULES = $(BUILDDIR)/$(LIBRARY)

define print_compile_message
    @echo "Compiling sources"
endef

default:
	$(call print_compile_message)

build: dir $(MODULES)

dir:
	mkdir -p $(BUILDDIR)

build/%.so: %.o
	$(CC) -bundle -undefined dynamic_lookup $(arch) -g $^ -o $@

build/%.o: %.c
	$(CC) -dynamic $(CFLAGS) -I/. -c $^ -o $@

clean:
	rm -r $(BUILDDIR)