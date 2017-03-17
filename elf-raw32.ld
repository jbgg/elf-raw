OUTPUT_FORMAT("binary")


SECTIONS{
	.elf 0x08048000 : AT(0) {
	      *(.text)
	}
}
