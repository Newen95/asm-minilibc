##
## EPITECH PROJECT, 2024
## Makefile
## File description:
## Newen Calle
##

SRC = ./strlen.asm \
	./strchr.asm \
	./strrchr.asm \
	./strcmp.asm \
	./memset.asm \
	./memcpy.asm \
	./memmove.asm

OBJ = $(SRC:.asm=.o)

TARGET = libasm.so

all: $(TARGET)

$(TARGET): $(OBJ)
	ld -shared -o $(TARGET) $(OBJ)

%.o: %.asm
	nasm -f elf64 $< -o $@

clean:
	@rm -f $(OBJ)

fclean: clean
	@rm -f $(TARGET)

re: fclean all

.PHONY: all clean fclean re
