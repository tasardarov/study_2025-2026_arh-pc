%include 'in_out.asm'
section .data
msg_x db 'Введите x: ',0h
msg_a db 'Введите a: ',0h  
msg_res db 'Результат: ',0h
section .bss
x resb 10
a resb 10
section .text
global _start
_start:
; Ввод x
mov eax, msg_x
call sprint
mov ecx, x
mov edx, 10
call sread
mov eax, x
call atoi
mov [x], eax

; Ввод a
mov eax, msg_a
call sprint
mov ecx, a
mov edx, 10
call sread
mov eax, a
call atoi
mov [a], eax

; Проверка условия x < 5
mov ebx, [x]
cmp ebx, 5
jl less_than_5

; x ≥ 5: f(x) = x - 5
mov eax, [x]
sub eax, 5
jmp output

; x < 5: f(x) = a*x
less_than_5:
mov eax, [a]
mov ebx, [x]
mul ebx

; Вывод результата
output:
mov edi, eax
mov eax, msg_res
call sprint
mov eax, edi
call iprintLF
call quit
