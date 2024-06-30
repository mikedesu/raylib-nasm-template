
all: game

game: game.asm
	nasm -f elf64 game.asm -o game.o 
	gcc -no-pie game.o -nostdlib -lraylib -o game

clean:
	rm -fv game.o game

