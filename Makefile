
all: game

game: game.asm
	nasm -f elf64 -F dwarf -g game.asm -o game.o 
	#gcc -g game.o -lraylib -lGL -lm -lpthread -ldl -lrt -lX11 -o game
	gcc -no-pie -g game.o -nostdlib -lraylib -lGL -lm -lpthread -ldl -lrt -lX11 -o game

clean:
	rm -fv game.o game

