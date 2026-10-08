# Makefile para compilar o projeto com raylib (baseado no Raylib-CPP-Starter-Template)
# Uso: mingw32-make            -> build release
#      mingw32-make BUILD_MODE=DEBUG
#      mingw32-make run
#      mingw32-make clean

.PHONY: all run clean

PROJECT_NAME  ?= expedicao
RAYLIB_PATH   ?= C:/raylib/raylib
COMPILER_PATH ?= C:/raylib/w64devkit/bin
BUILD_MODE    ?= RELEASE

export PATH := $(COMPILER_PATH):$(PATH)

CC = gcc

SRC = $(wildcard *.c)

CFLAGS = -Wall -std=c99 -D_DEFAULT_SOURCE -Wno-missing-braces -DPLATFORM_DESKTOP
ifeq ($(BUILD_MODE),DEBUG)
    CFLAGS += -g -O0
else
    CFLAGS += -s -O1
endif

INCLUDE_PATHS = -I. -I$(RAYLIB_PATH)/src -I$(RAYLIB_PATH)/src/external
LDFLAGS       = -L. -L$(RAYLIB_PATH)/src
LDLIBS        = -lraylib -lopengl32 -lgdi32 -lwinmm

# Arquivo de recurso com ícone/propriedades do executável no Windows
RESOURCES = $(RAYLIB_PATH)/src/raylib.rc.data

all: $(PROJECT_NAME).exe

$(PROJECT_NAME).exe: $(SRC) $(wildcard *.h)
	$(CC) -o $@ $(SRC) $(RESOURCES) $(CFLAGS) $(INCLUDE_PATHS) $(LDFLAGS) $(LDLIBS)

run: all
	./$(PROJECT_NAME).exe

clean:
	rm -f *.o *.exe
