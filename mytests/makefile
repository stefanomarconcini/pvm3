PVM_ROOT ?= /home/smarconcini/linux/pvm_study/pvm3
PVM_ARCH ?= $(shell $(PVM_ROOT)/lib/pvmgetarch)

CC ?= gcc

CFLAGS += -I$(PVM_ROOT)/include
LDFLAGS += -L$(PVM_ROOT)/lib/$(PVM_ARCH)
LDLIBS += -lpvm3 -ltirpc -ldl -lm

TARGET = selfhello
SRC = selfhello.c

all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) -o $(TARGET) $(SRC) $(LDFLAGS) $(LDLIBS)
	mkdir -p $(PVM_ROOT)/bin/$(PVM_ARCH)
	cp $(TARGET) $(PVM_ROOT)/bin/$(PVM_ARCH)/$(TARGET)

clean:
	rm -f $(TARGET) *.o