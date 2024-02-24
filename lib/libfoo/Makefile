# ===========================
# General settings
# ===========================

# Metadata
MKFILEPATH = Makefile

# Compiler setup
CC = gcc
CFLAGS = -Os -Wall -Wextra

# Archiver setup
AR = ar
ARFLAGS = -r -c -s

# Define dirs
SRC_DIR = src/
OBJ_DIR = .obj/
INC_DIR = inc/

# Define / get files
SRC_FILES = $(wildcard $(SRC_DIR)*.c)
OBJ_FILES = $(patsubst $(SRC_DIR)%.c,$(OBJ_DIR)%.o,$(SRC_FILES))
DEP_FILES = $(OBJ_FILES:%.o=%.d)

# Define target files
TARGET_FILE = libfoo.a
TARGET_HEADER = $(TARGET_FILE:%.a=%.h)

# ===========================
# Extended settings
# ===========================

# Update compiler setup
CFLAGS += $(addprefix -I,$(INC_DIR))

# ===========================
# Build static library
# ===========================

# Default target
all: $(TARGET_FILE) $(TARGET_HEADER)

# Link objects
$(TARGET_FILE): $(OBJ_FILES)
	if [ -f "$@" ]; then rm -r "$@"; fi
	$(AR) $(ARFLAGS) $@ $^

# Include deps
-include $(DEP_FILES)

# Compile objects
$(OBJ_DIR)%.o: $(SRC_DIR)%.c $(MKFILEPATH) | $(OBJ_DIR)
	$(CC) $(CFLAGS) -MMD -MP -c $< -o $@

# Generate header file
$(TARGET_HEADER): $(wildcard $(INC_DIR)*.h)
	cat $(INC_DIR)*.h > $@

# ===========================
# Create dirs
# ===========================

$(SRC_DIR) $(OBJ_DIR) $(INC_DIR):
	mkdir -p $@

# ===========================
# Non-file targets
# ===========================

# Remove artifacts
clean:
	rm -rf $(OBJ_DIR)
	rm -f $(TARGET_FILE)
	rm -f $(TARGET_HEADER)

# Phony target
.PHONY: clean