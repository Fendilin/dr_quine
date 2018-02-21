CC = nasm
FLAGS = -f elf64

all: colleen

colleen:
	$(CC) $(FLAGS) colleen.s -o colleen.o
	ld -o Colleen colleen.o -lc

clean:
	rm -f colleen.o

fclean: clean
	rm -f Colleen
	
re: fclean all
