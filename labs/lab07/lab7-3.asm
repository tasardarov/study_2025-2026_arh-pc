%include 'in_out.asm'
section .data
msg db 'Наименьшее число: ',0h
A dd 99
B dd 29 
C dd 26
section .bss
min resb 10
section .text
global _start
_start:
; Загружаем A в регистр и в min
mov eax, [A]
mov [min], eax

; Сравниваем A и B
mov ebx, [B]
cmp eax, ebx
jl check_C    ; если A < B, переходим к C
mov [min], ebx ; иначе min = B

check_C:
; Сравниваем текущий min с C
mov eax, [min]
mov ecx, [C]
cmp eax, ecx
jl output     ; если min < C, выводим
mov [min], ecx ; иначе min = C

output:
mov eax, msg
call sprint
mov eax, [min]
call iprintLF
call quit
