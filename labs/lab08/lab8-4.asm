%include 'in_out.asm'
SECTION .data
msg_func db "Функция: f(x)=15x-9",0
msg_result db "Результат: ",0
SECTION .text
global _start
_start:
pop ecx        ; Извлекаем количество аргументов
pop edx        ; Извлекаем имя программы
sub ecx,1      ; Количество аргументов без названия программы

; Вывод информации о функции
mov eax, msg_func
call sprintLF

mov esi, 0     ; Сумма f(x)

next:
cmp ecx,0h     ; Проверяем, есть ли еще аргументы
jz _end        
pop eax        ; Извлекаем аргумент
call atoi      ; Преобразуем в число

; Вычисление f(x) = 15x - 9
mov ebx, eax   ; сохраняем x
add eax, eax   ; 2x
add eax, eax   ; 4x  
add eax, eax   ; 8x
add eax, eax   ; 16x
sub eax, ebx   ; 15x (16x - x)
sub eax, 9     ; -9

add esi,eax    ; Добавляем к сумме
loop next      ; Следующий аргумент

_end:
mov eax, msg_result ; Вывод "Результат: "
call sprint
mov eax, esi   ; Записываем сумму
call iprintLF  ; Печать результата
call quit      ; Завершение
