# Makefile for building the NIF
#
# Makefile targets:
#
# all/install   build and install the NIF
# clean         clean build products and intermediates
#
# Variables to override:
#
# MIX_APP_PATH  path to the build directory
#
# CC            C compiler
# CROSSCOMPILE	crosscompiler prefix, if any
# CFLAGS	compiler flags for compiling all C files
# ERL_CFLAGS	additional compiler flags for files using Erlang header files
# ERL_EI_INCLUDE_DIR include path to ei.h (Required for crosscompile)
# ERL_EI_LIBDIR path to libei.a (Required for crosscompile)
# LDFLAGS	linker flags for linking all binaries
# ERL_LDFLAGS	additional linker flags for projects referencing Erlang libraries

ifdef MIX_APP_PATH
APP_PATH := $(MIX_APP_PATH)
else
APP_PATH := ./
endif

ifndef ERL_EI_LIBDIR
ERL_EI := $(shell elixir test/erl_bases.exs)
ERL_EI_INCLUDE_DIR := $(ERL_EI)/include
ERL_EI_LIBDIR := $(ERL_EI)/lib/
endif

PREFIX = $(APP_PATH)/priv
BUILD  = $(APP_PATH)/obj

NIF = $(PREFIX)/widgetlords_nifs.so

CFLAGS ?= -O2 -Wall 

# Check that we're on a supported build platform
ifeq ($(CROSSCOMPILE),)
    # Not crosscompiling, so check that we're on Linux.
    ifneq ($(shell uname -s),Linux)
        $(warning `widgetlords_nifs` only works on Nerves and Linux platforms.)
	# HAL_SRC = src/hal_stub.c
        # LDFLAGS += -undefined dynamic_lookup -dynamiclib
    else
        LDFLAGS += -fPIC -shared
        CFLAGS += -fPIC
    endif
else
	# Crosscompiled build
	LDFLAGS += -fPIC -shared
	CFLAGS += -fPIC
endif

# Set Erlang-specific compile and linker flags
ERL_CFLAGS  = -I$(ERL_EI_INCLUDE_DIR)
ERL_LDFLAGS ?= -L$(ERL_EI_LIBDIR) -lei

NIM_SRC := $(wildcard src/_nimcache/*.c)
NIM_HDRS := $(wildcard src/_nimcache/*.h)
OBJ = $(NIM_SRC:src/_nimcache/%.c=$(BUILD)/%.o)


calling_from_make:
	mix compile

all: install

install: $(PREFIX) $(BUILD) $(NIF)

$(OBJ): $(HEADERS) Makefile

$(BUILD)/%.o: src/_nimcache/%.c
	$(CC) -c $(ERL_CFLAGS) $(CFLAGS) -o $@ $<

$(BUILD)/%.o: src/%.c
	$(CC) -c $(ERL_CFLAGS) $(CFLAGS) -o $@ $<

$(NIF): $(OBJ)
	$(CC) -o $@ $(ERL_LDFLAGS) $(LDFLAGS) $^

$(PREFIX) $(BUILD):
	mkdir -p $@

clean:
	@echo ERL_EI_INCLUDE_DIR: $(ERL_EI_INCLUDE_DIR)
	@echo ERL_EI_LIBDIR: $(ERL_EI_LIBDIR)
	@echo ERL_CFLAGS: $(ERL_CFLAGS)
	@echo ERL_LDFLAGS: $(ERL_LDFLAGS)
	@echo OBJ: $(OBJ)
	$(RM) $(NIF) $(OBJ)

.PHONY: all clean calling_from_make install
