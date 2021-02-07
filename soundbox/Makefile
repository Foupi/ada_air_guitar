PROJ = soundbox

BUILD = Debug # Possible values are Debug and Production

GPRBUILD = gprbuild
GPRCLEAN = gprclean
BUILDDIR = obj

ELF = $(PROJ).elf

GPR = $(PROJ).gpr

.PHONY: all prove clean FORCE

all: $(ELF)

prove:

clean:
	$(GPRCLEAN) -r
	$(RM) $(ELF)

FORCE:

$(ELF): FORCE
	$(GPRBUILD) -XBUILD=$(BUILD) $(GPR)
	cp $(BUILDDIR)/$(PROJ) $(ELF)
