# Compiler
CC := gcc

# Paths (must have PVM_ROOT set in environment)
INCLUDES := -I$(PVM_ROOT)/include
LDFLAGS  := -L$(PVM_ROOT)/lib/LINUX64
LIBS     := -lpvm3 -ltirpc -ldl -lm

# Target and source
TARGET := $(PVM_ROOT)/mytests/selfhello
SRC    := $(PVM_ROOT)/mytests/selfhello.c

# Default target
all: $(TARGET)

# Build rule
$(TARGET): $(SRC)
	$(CC) $(INCLUDES) -o $@ $< $(LDFLAGS) $(LIBS)
	cp $(TARGET) ../bin/LINUX64

# Clean target
clean:
	rm -f $(TARGET)

.PHONY: all clean
