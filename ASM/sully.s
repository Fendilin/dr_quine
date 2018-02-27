section .data
str: db "section .data%1$cstr: db %2$c%4$s%2$c, 0x0%1$cbuff: times 1024 db 0x0%1$ctmp: times 1024 db 0x0%1$cfile: db %2$cSully_%%d.s%2$c, 0x0%1$cnasm: db %2$cnasm -f macho64 %%s%2$c, 0x0%1$cgcc: db %2$cgcc Sully_%%1$d.o -o Sully_%%1$d%2$c, 0x0%1$cexec: db %2$c./Sully_%%d%2$c, 0x0%1$csection .text%1$cglobal _main%1$cextern _sprintf%1$cextern _dprintf%1$cextern _system%1$c_main:%1$csub rsp, 16%1$cmov rdx, %3$d%1$cpush rdx%1$ccmp rdx, -1%1$cje _exit%1$clea rdi, [rel buff]%1$clea rsi, [rel file]%1$ccall _sprintf%1$cmov rax, 0x2000005%1$clea rdi, [rel buff]%1$cmov rsi, 514%1$cmov rdx, 0o644%1$csyscall%1$cmov rdi, rax%1$clea rsi, [rel str]%1$cmov rdx, 0xA%1$cmov rcx, 0x22%1$cpop r8%1$cpush r8%1$csub r8, 1%1$clea r9, [rel str]%1$ccall _dprintf%1$clea rdi, [rel tmp]%1$clea rsi, [rel nasm]%1$clea rdx, [rel buff]%1$ccall _sprintf%1$clea rdi, [rel tmp]%1$ccall _system%1$clea rdi, [rel buff]%1$clea rsi, [rel gcc]%1$cpop rdx%1$cpush rdx%1$ccall _sprintf%1$clea rdi, [rel buff]%1$ccall _system%1$clea rdi, [rel buff]%1$clea rsi, [rel exec]%1$cpop rdx%1$ccall _sprintf%1$cadd rsp, 0x8%1$clea rdi, [rel buff]%1$ccall _system%1$c_exit:%1$cmov rax, 0x2000001%1$cmov rdi, 0x0%1$csyscall%1$c", 0x0
buff: times 1024 db 0x0
tmp: times 1024 db 0x0
file: db "Sully_%d.s", 0x0
nasm: db "nasm -f macho64 %s", 0x0
gcc: db "gcc Sully_%1$d.o -o Sully_%1$d", 0x0
exec: db "./Sully_%d", 0x0
section .text
global _main
extern _sprintf
extern _dprintf
extern _system
_main:
sub rsp, 16
mov rdx, 5
push rdx
cmp rdx, -1
je _exit
lea rdi, [rel buff]
lea rsi, [rel file]
call _sprintf
mov rax, 0x2000005
lea rdi, [rel buff]
mov rsi, 514
mov rdx, 0o644
syscall
mov rdi, rax
lea rsi, [rel str]
mov rdx, 0xA
mov rcx, 0x22
pop r8
push r8
sub r8, 1
lea r9, [rel str]
call _dprintf
lea rdi, [rel tmp]
lea rsi, [rel nasm]
lea rdx, [rel buff]
call _sprintf
lea rdi, [rel tmp]
call _system
lea rdi, [rel buff]
lea rsi, [rel gcc]
pop rdx
push rdx
call _sprintf
lea rdi, [rel buff]
call _system
lea rdi, [rel buff]
lea rsi, [rel exec]
pop rdx
call _sprintf
add rsp, 0x8
lea rdi, [rel buff]
call _system
_exit:
mov rax, 0x2000001
mov rdi, 0x0
syscall
