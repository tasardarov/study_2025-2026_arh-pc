%include 'in_out.asm'
SECTION .data
msg: DB 'Введите x: ',0
res: DB 'Результат: ',0
SECTION .bss
x: RESB 80
SECTION .text
GLOBAL _start
_start:
mov eax,msg
call sprint
mov ecx,x
mov edx,80
call sread
mov eax,x
call atoi
mov ebx,8
mul ebx
sub eax,6
mov ebx,2
div ebx
mov edi,eax
mov eax,res
call sprint
mov eax,edi
call iprintLF
call quit
