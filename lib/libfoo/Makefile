# ===========================
# General settings
# ===========================

# Metadata
MKFILEPATH = Makefile

# Compiler setup
CC = gcc
CFLAGS = -Os -Wall -Wextra
LDFLAGS = -s

# Define dirs
SRC_DIR = src/
OBJ_DIR = .obj/
INC_DIR = inc/

# Define / get files
SRC_FILES = $(wildcard $(SRC_DIR)*.c)
OBJ_FILES = $(patsubst $(SRC_DIR)%.c,$(OBJ_DIR)%.o,$(SRC_FILES))
DEP_FILES = $(OBJ_FILES:%.o=%.d)
TARGET_FILE = my_program

# ===========================
# Extended settings
# ===========================

# Update compiler setup
CFLAGS += $(addprefix -I,$(INC_DIR))

# ===========================
# Compile executable
# ===========================

# Default target
all: $(TARGET_FILE)

# Link objects
$(TARGET_FILE): $(OBJ_FILES)
	$(CC) $(LDFLAGS) $^ -o $@

# Include deps
-include $(DEP_FILES)

# Compile objects
$(OBJ_DIR)%.o: $(SRC_DIR)%.c $(MKFILEPATH) | $(OBJ_DIR)
	$(CC) $(CFLAGS) -MMD -MP -c $< -o $@

# ===========================
# Create dirs
# ===========================

$(SRC_DIR) $(OBJ_DIR) $(INC_DIR):
	mkdir -p $@

# ===========================
# Non-file targets
# ===========================

run: $(TARGET_FILE)
	@./$<

# Remove artifacts
clean:
	rm -rf $(OBJ_DIR)
	rm -f $(TARGET_FILE)

# Phony target
.PHONY: run clean