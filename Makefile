CC := g++
CXX := g++

TARGET := ./bin/node2vec

OBJ_DIR := ./obj
SRC_DIR := ./src
INC_DIR := ./include

SRCS := $(shell find $(SRC_DIR) -name '*.cpp' -or -name '*.c' -or -name '*.s')

# Prepends BUILD_DIR and appends .o to every src file
# As an example, ./your_dir/hello.cpp turns into ./build/./your_dir/hello.cpp.o
OBJS := $(addprefix $(OBJ_DIR)/,$(SRCS:$(SRC_DIR)/%=%.o))

# String substitution (suffix version without %).
# As an example, ./build/hello.cpp.o turns into ./build/hello.cpp.d
DEPS := $(OBJS:.o=.d)

# Every folder in ./src will need to be passed to GCC so that it can find header files

# Add a prefix to INC_DIRS. So moduleA would become -ImoduleA. GCC understands this -I flag

# These files will have .d instead of .o as the output.
CPPFLAGS := -I$(INC_DIR) -g

# The final build step.
$(TARGET): $(OBJS)
	$(CXX) $(OBJS) -o $@ $(LDFLAGS)

# Build step for C++ source
$(OBJ_DIR)/%.cpp.o: $(SRC_DIR)/%.cpp
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $< -o $@

.PHONY: run
run: $(TARGET)
	./$(TARGET_EXEC)

.PHONY: clean
clean:
	rm -r $(OBJS) $(TARGET)

-include $(DEPS)
