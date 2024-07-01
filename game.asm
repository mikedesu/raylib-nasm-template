extern InitWindow
extern CloseWindow
extern WindowShouldClose
extern BeginDrawing
extern EndDrawing
extern SetTargetFPS
extern SetExitKey
extern ClearBackground
extern BeginMode2D
extern EndMode2D
extern DrawRectangle
extern DrawFPS
extern IsKeyDown

section .text

_start:
  ;pushq rbp

	mov rdi, 800
	mov rsi, 450
	mov rdx, msg
	call	InitWindow
  mov rdi, 60
  call SetTargetFPS
; set exit key to Q
; https://docs.rs/raylib/latest/raylib/consts/enum.KeyboardKey.html
  mov rdi, 81
  call SetExitKey

GameLoop:
  ; do stuff here
CheckLeft:
  ; check if LEFT key is pressed
  mov rdi, 263
  call IsKeyDown
  cmp rax, 1
  jne CheckRight
  ; print msg
  ;mov rax, 1
  ;mov rdi, 1
  ;mov rsi, msg
  ;mov rdx, 1
  ;syscall
  ;mov rdi, [cam2d]
  ;sub rdi, 4
  ;mov [cam2d], rdi
CheckRight:
  ; check if RIGHT key is pressed
  mov rdi, 262
  call IsKeyDown
  cmp rax, 1
  jne CheckUp
  ; handle RIGHT key
  ; move cam3dera right
  ; load cam3dera.position.x into rdi
  ;mov rdi, [cam2d]
  ;add rdi, 4
  ;mov [cam2d], rdi
; check if UP key is pressed
CheckUp:
  mov rdi, 265
  call IsKeyDown
  cmp rax, 1
  jne CheckDown
  ; handle UP key
  ; move cam3dera up
  ; load cam3dera.position.y into rdi
  ;mov rdi, [cam2d+4]
  ;sub rdi, 4
  ;mov [cam2d+4], rdi
CheckDown:
; check if DOWN key is pressed
  mov rdi, 264
  call IsKeyDown
  cmp rax, 1
  jne CheckZ
  ; handle DOWN key
  ; move cam3dera down
  ; load cam3dera.position.y into rdi
  ;mov rdi, [cam2d+4]
  ;add rdi, 4
  ;mov [cam2d+4], rdi
CheckZ:
  mov rdi, 90
  call IsKeyDown
  cmp rax, 1
  jne CheckX
CheckX:
  mov rdi, 88
  call IsKeyDown
  cmp rax, 1
  jne ChecksDone
  ; handle X key
ChecksDone:
  call BeginDrawing
  
  ;sub rsp, 24
  ;sub rsp, 8
  ;mov rsp, rcx
  ;mov rax, [rbp-32]
  ;mov rdi, [rbp-24]

  ; for some reason, the below 2 lines arent working as expected...
  
  ;call BeginMode2D

  mov rdi, 0xFFFF0000
  call ClearBackground
  mov rdi, 0
  mov rsi, 0
  mov rdx, 100
  mov rcx, 100
  mov r8, 0xFF0000FF
  call DrawRectangle
  
  ;call EndMode2D
  
  mov rdi, 10
  mov rsi, 10
  call DrawFPS  
  call EndDrawing
  call	WindowShouldClose
  cmp rax, 0
  je GameLoop
EndGameLoop:
	call	CloseWindow

  ;mov rsp, rbp
  ;pop rbp
  ; call exit
  ;leave
  ;ret

  mov rax, 0x3c
  mov rdi, 0
  syscall

section .data
  msg db 'H', 0
; camera2d struct is position x y, target x y, rotation, zoom
  cam2d dd 0, 0, 0, 0, 0, 1.0
  ;bgcolor db 0, 0, 0, 0
  ;color1 dd 0, 255, 0, 255
;cam2d:
;  offset dd 0, 0
;  target dd 0, 0
;  rotation dd 0
;  zoom dd 1

