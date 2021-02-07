EMBEDDED_DIR = embedded
SOUNDBOX_DIR = soundbox

EMBEDDED = main.bin
SOUNDBOX = soundbox.elf

.PHONY: all flash clean

all:
	make all -C ${EMBEDDED_DIR}
	make all -C ${SOUNDBOX_DIR}
	cp ${SOUNDBOX_DIR}/${SOUNDBOX} .

flash:
	make flash -C ${EMBEDDED_DIR}

clean:
	make clean -C ${EMBEDDED_DIR}
	make clean -C ${SOUNDBOX_DIR}
	${RM} ${SOUNDBOX}
