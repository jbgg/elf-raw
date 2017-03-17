

CC=gcc
CF=-m32 

LD=ld
LF=-melf_i386



all : elf-raw32



%.o : %.S
	$(CC) $(CF) -c $< -o $@



elf-raw32 : elf-raw32.ld elf-raw32.o
	$(LD) $(LF) -T $^ -o $@





clean :
	rm elf-raw32 elf-raw32.o

