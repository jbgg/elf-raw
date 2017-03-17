


#define ELFMAG0 0x7f
#define ELFMAG1 'E'
#define ELFMAG2 'L'
#define ELFMAG3 'F'

#define ELFCLASS32 0x01
#define ELFCLASS64 0x02	

#define ELFDATA2LSB 0X01
#define ELFDATA2MSB 0X02

#define ET_EXEC 0x02
#define EM_386 0x03
#define EV_CURRENT 0x01
	
#define shentsize 0x28

#define PT_LOAD 0x1
#define PT_R 0x1
#define PT_W 0x2
#define PT_X 0x4


	.equ sizeoffile, _end_elf-_begin_elf

	.section .text
_begin_elf:
	
	// elf header
ehb:	
	.byte ELFMAG0, ELFMAG1, ELFMAG2, ELFMAG3, ELFCLASS32, ELFDATA2LSB, EV_CURRENT, 0, 0, 0, 0, 0, 0, 0, 0, 0

	.word ET_EXEC, EM_386
	.long EV_CURRENT
	.long entry		// entry
	.long phoff		// phoff
	.long 0 		// shoff
	.long 0			// flags
	.word ehsize		// ehsize
	.word phentsize		// phentsize
	.word phnum		// phnum
	.word shentsize		// shentsize
	.word 0			// shnum
	.word 0			// shstrndx

	.equ ehsize, .-ehb

	// program header
phb:
	.equ phoff, .-_begin_elf
	.equ phnum, 1

	.long PT_LOAD		// type
	.long 0			// offset
	.long _begin_elf	// vaddr
	.long _begin_elf	// paddr
	.long sizeoffile	// filesz
	.long sizeoffile	// memsz
	.Long PT_R | PT_X	// Flags
	.Long 0x00001000	// Align
	
	.equ phentsize, .-phb
	

	// Code section
	
entry:
	// exit(42)
	xorl %eax, %eax
	incl %eax
	movl $42, %ebx
	int $0x80
	

_end_elf:	
