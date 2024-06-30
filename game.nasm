extern InitWindow
extern CloseWindow
extern WindowShouldClose
extern BeginDrawing
extern EndDrawing
extern SetTargetFPS
extern SetExitKey
extern ClearBackground

section .text

_start:
	mov rdx, msg
	mov rsi, 450
	mov rdi, 800
	call	InitWindow

  mov rdi, 60
  call SetTargetFPS

; set exit key to Q
; https://docs.rs/raylib/latest/raylib/consts/enum.KeyboardKey.html
  mov rdi, 81
  call SetExitKey

GameLoop:
  ; do stuff here
  call BeginDrawing

  mov rax, 0xFFFFFFFF
  mov rdi, 0xFFFFFFFF
  mov rsi, 0xFFFFFFFF
  mov rdx, 0xFFFFFFFF
  call ClearBackground

  call EndDrawing

  call	WindowShouldClose
  cmp rax, 0
  je GameLoop

EndGameLoop:
	call	CloseWindow

; call exit
  mov rax, 60
  mov rdi, 0
  syscall

section .data
  msg db 'H', 0x0a
