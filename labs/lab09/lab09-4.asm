%include 'in_out.asm'
SECTION .data
msg_x db 'Введите x: ',0h
msg_a db 'Введите a: ',0h  
msg_res db 'Результат: ',0h
SECTION .bss
x resb 10
a resb 10
SECTION .text
GLOBAL _start
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

; Вызов подпрограммы вычисления функции
call _calculate_function

; Вывод результата
mov eax, msg_res
call sprint
mov eax, [x]  ; результат сохраняется в [x]
call iprintLF
call quit

;------------------------------------------
; Подпрограмма вычисления функции
; f(x) = ax при x < 5
; f(x) = x-5 при x ≥ 5
; Вход: [x] - значение x, [a] - значение a
; Выход: [x] - результат вычислений
;------------------------------------------
_calculate_function:
mov ebx, [x]
cmp ebx, 5
jl less_than_5

; x ≥ 5: f(x) = x - 5
mov eax, [x]
sub eax, 5
mov [x], eax
ret

; x < 5: f(x) = a*x
less_than_5:
mov eax, [a]
mov ebx, [x]
mul ebx
mov [x], eax
ret
