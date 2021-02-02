PROJ=main

BUILD=Debug # Possible values are Debug and Production

GPRBUILD=gprbuild
GPRCLEAN=gprclean
BUILDDIR=obj/stm32f429/$(PROJ)
CROSS=arm-none-eabi

OBJCOPY=$(CROSS)-objcopy

STFLASH ?= st-flash

ELF	= $(PROJ).elf
HEX	= $(PROJ).hex
BIN	= $(PROJ).bin

GPR = guitar_zero.gpr

all:: $(BIN)

$(HEX): $(ELF)
	$(OBJCOPY) -O ihex $(ELF) $(HEX)

$(BIN): $(ELF)
	$(OBJCOPY) -O binary $(ELF) $(BIN)

$(ELF):: FORCE
	$(GPRBUILD) -XBUILD=$(BUILD) $(GPR)
	cp $(BUILDDIR)/$(PROJ) $(ELF)

flash:: $(BIN)
	$(STFLASH) write $(BIN) 0x8000000

clean::
	$(GPRCLEAN)
	$(RM) $(ELF) $(HEX) $(OBJ) $(BIN)

FORCE:

.PHONY: all clean flash FORCE
