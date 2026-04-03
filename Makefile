# Compiler
CC = clang

SRC_DIR = src

BUILD_DIR = build

# Object dir
OBJ_DIR = $(BUILD_DIR)/obj

# Binary name
TARGET = $(BUILD_DIR)/pigeon-db

# Source files
SRC = $(wildcard $(SRC_DIR)/*.c)

# Objects
OBJ = $(SRC:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)

# Debug flags
CFLAGS = -Wall -Wextra -Werror -pedantic\
		 -g3 -O0 \
		 -fsanitize=address,undefined\
		 -fno-omit-frame-pointer

LDFLAGS = -fsanitize=address,undefined

INCLUDES = -Iinclude

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(OBJ) -o $(TARGET) $(LDFLAGS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

clean:
	rm -f src/*.o $(TARGET)
re: clean all
