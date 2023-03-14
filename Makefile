dev := "Ronald Teijeira Fernandez"
DEBUG ?= true # set it if not set before
nullstr = 

# Used for javac
SRC_DIR := ./src
SRCS := $(shell find $(SRC_DIR) -name '*.java')
TARGET_DIR := ./target

all: info clean build

clean:
	@echo "\n\033[92m[INFO] Cleaning targets...\033[0m"
	mvn clean
build: clean
	@echo "\n\033[92m[INFO] Compiling sources...\033[0m"
	mvn compile
exec: build
	@echo "\n\033[92m[INFO] Executing application\033[0m"
	mvn exec:java
info:
	@echo "\n--------------------------------------"
	@echo "Developer: " $(dev)
	@echo "User: " $(USER)
	@echo "--------------------------------------\n"

javac:
	javac $(SRCS) -d $(TARGET_DIR)
java:
	cd $(TARGET_DIR) && java main.java.hello.HelloWorld
test:
ifeq ($(strip $(DEBUG)), true)
	echo "DEBUG mode"
else
	echo "NO DEBUG mode"
endif
ifeq ($(strip $(nullstr)),)
	@echo "there is an empty variable"
else
	@echo "everything ok"
endif
# Pass i to make: e.g. make -i -f Makefile debug
# -i: ignore errors
# -s: silent mode
ifneq (,$(findstring i, $(MAKEFLAGS)))
	echo "Makeflags: " $(MAKEFLAGS)
	echo "i was passed to MAKEFLAGS"
endif
	# Shell variables
	echo "SHELL: " $(SHELL)
	@echo $(shell ls -la) # call the shell, but replaces newlines with spaces

# Test recursive/circular