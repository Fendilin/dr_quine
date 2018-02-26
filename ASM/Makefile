CC = nasm
LINKER = gcc
FLAGS = -f macho64

all: colleen

colleen:
	$(CC) $(FLAGS) colleen.s
	$(LINKER) colleen.o -o Colleen

grace:
	$(CC) $(FLAGS) grace.s
	$(LINKER) grace.o -o Grace
	
clean:
	rm -f colleen.o grace.o

fclean: clean
	rm -f Colleen Grace
	rm -f Grace_kid.s
	
re: fclean all
