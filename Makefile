# ===========================
# General settings
# ===========================

# Metadata
MKFILEPATH = Makefile
BUILDLOGFILE = Makefile.log

# Compiler setup
CC = gcc
CFLAGS = -Os -Wall -Wextra
LDFLAGS = -s

# Define dirs
SRC_DIR = src/
OBJ_DIR = .obj/
INC_DIR = inc/

# Required libraries
LIB_NAMES = foo
LIB_TARGETS = lib/libfoo/libfoo.a
LIB_INCS = lib/libfoo/libfoo.h

# Define / get files
SRC_FILES = $(wildcard $(SRC_DIR)*.c)
OBJ_FILES = $(patsubst $(SRC_DIR)%.c,$(OBJ_DIR)%.o,$(SRC_FILES))
DEP_FILES = $(OBJ_FILES:%.o=%.d)
TARGET_FILE = my_program

# ===========================
# Extended settings
# ===========================

# Append include dirs to CFLAGS
INC_DIR += $(dir $(LIB_INCS))
CFLAGS += $(addprefix -I,$(INC_DIR))

# Append directoris of libraries to LDFLAGS
LDFLAGS += $(addprefix -L,$(dir $(LIB_TARGETS)))

# Set libraries to use then linking
LDLIBS = $(addprefix -l,$(LIB_NAMES))

# ===========================
# Compile executable
# ===========================

# Default target
all: $(TARGET_FILE)

# Link objects
$(TARGET_FILE): $(LIB_TARGETS) $(OBJ_FILES)
	$(CC) $(LDFLAGS) $(OBJ_FILES) $(LDLIBS) -o $@

# Include deps
-include $(DEP_FILES)

# Compile objects
$(OBJ_DIR)%.o: $(SRC_DIR)%.c $(MKFILEPATH) | $(OBJ_DIR)
	$(CC) $(CFLAGS) -MMD -MP -c $< -o $@

# ===========================
# Compile libraries
# ===========================

$(LIB_TARGETS): FORCE
	make -C $(dir $@)

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
	for libdir in $(dir $(LIB_TARGETS)); do make -C $$libdir clean; done

clean-logs:
	rm -f $(BUILDLOGFILE)

# Forces executing a target
FORCE:

# Phony target
.PHONY: run clean FORCE