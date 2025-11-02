%include 'in_out.asm'
SECTION .data
msg: DB 'Введите строку: ',0h
SECTION .bss
buf1: RESB 80
SECTION .text
GLOBAL _start
_start:
mov eax, msg
call sprintLF    ; Вывод приглашения
mov ecx, buf1
mov edx, 80
call sread       ; Ввод строки
; ВЫВОД ВВЕДЕННОЙ СТРОКИ (НОВОЕ!)
mov eax, buf1
call sprintLF    ; Вывод введенной строки
call quit