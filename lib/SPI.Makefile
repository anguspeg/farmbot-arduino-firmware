DEP_SPI_BUILD_DIR := $(FBARDUINO_FIRMWARE_LIB_BUILD_DIR)/SPI
DEP_SPI := $(DEP_SPI_BUILD_DIR)/SPI.a

DEP_SPI_CFLAGS := \
	-I$(ARDUINO_INSTALL_DIR)/hardware/arduino/avr/libraries/SPI/src

DEP_SPI_LDFLAGS :=

DEP_SPI_CXX_SRC := $(ARDUINO_INSTALL_DIR)/hardware/arduino/avr/libraries/SPI/src/SPI.cpp
DEP_SPI_OBJ := $(DEP_SPI_BUILD_DIR)/SPI.cpp.o

ARDUINO_DEP_SPI_CXX_FLAGS_P := $(DEP_CORE_CFLAGS_P) $(DEP_SPI_CFLAGS)

$(DEP_SPI): $(DEP_SPI_BUILD_DIR) $(DEP_SPI_OBJ)
	$(AR) rcs $(DEP_SPI) $(DEP_SPI_OBJ)

$(DEP_SPI_BUILD_DIR)/%.cpp.o: $(ARDUINO_INSTALL_DIR)/hardware/arduino/avr/libraries/SPI/src/%.cpp
	$(CXX) $(ARDUINO_DEP_SPI_CXX_FLAGS_P) $< -o $@

$(DEP_SPI_BUILD_DIR):
	$(MKDIR_P) $(DEP_SPI_BUILD_DIR)
