
all: game

game: game.nasm
	nasm -f elf64 game.nasm -o game.o 
	gcc -no-pie game.o -nostdlib -lraylib -o game

clean:
	rm -fv game.o game

