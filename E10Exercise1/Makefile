# Makefile for ISU (OSApi Edition)
# by TeamISU
# with automatic source detection
EXENAME   := main
SOURCES   := 

LD_FLAGS  :=
CXX_FLAGS := -Wall -I.

### OSApi #################################
ifeq ($(ARCH),target)
	TARGET := target
else
	TARGET := host
endif

BASEPATH=./OSApi
LIBPATH=$(BASEPATH)/lib/$(TARGET)/release/

LD_FLAGS  += -L$(LIBPATH) -lOSApi -pthread -lrt
CXX_FLAGS += -D_REENTRANT -DOS_LINUX -I$(BASEPATH)/inc
###########################################

# Auto add sources if none
ifeq ($(SOURCES),)
	CPP_FILES := $(wildcard *.cpp)
else
	CPP_FILES := $(SOURCES)
endif

# Crosscompiling support
ifneq ($(ARCH),target)
	CXX=g++
	DIR=host
	EXE=$(EXENAME)
else
	CXX=arm-angstrom-linux-gnueabi-g++
	DIR=target
	EXE=$(addsuffix .target,$(EXENAME))
endif
OBJ_FILES := $(addprefix $(DIR)/,$(notdir $(CPP_FILES:.cpp=.o)))

$(EXE): $(OBJ_FILES)
	$(CXX) -o $@ $^ $(LD_FLAGS)

$(DIR)/%.o: %.cpp | $(DIR)
	$(CXX) $(CXX_FLAGS) -c -o $@ $<

$(DIR):
	@mkdir $(DIR)

clean: 
	@-rm $(OBJ_FILES) $(OBJ_FILES:.o=.d) $(EXE)
	@-rmdir $(DIR)
	
help:
	@echo "Instructions for makefile (OSApi):"
	@echo "make [OPTIONS]                 make for host"
	@echo "make ARCH=target [OPTIONS]     make for target"
	@echo "OPTIONS:"
	@echo "clean          removes objects directory and executable"

# Section for dependency files:
CXX_FLAGS += -MMD
-include $(OBJ_FILES:.o=.d)
# end of file
