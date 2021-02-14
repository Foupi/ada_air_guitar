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
	$(RM) -r obj

FORCE:

$(ELF): FORCE
	$(GPRBUILD) -XBUILD=$(BUILD) -j`nproc` $(GPR)
	cp $(BUILDDIR)/$(PROJ) $(ELF)
