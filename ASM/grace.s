%macro data 0x0
	section .data
		file: db "Grace_kid.s", 0x0
		str: "hello"
%endmacro

%macro open 0x0
	mov rax 0x2000005
	lea rdi, [rel file]
	mov rsi, 755
	syscall
	cmp rax, -1
	je _exit
%endmacro

%macro func 0x0
	data
	section .text
		global main
		extern dprintf
	
	main:
		sub rsp, 0x8
		open
		mov rdi, rax
		lea rsi, [rel str]
		mov rdx, 0xA
		mov rcx, 0x9
		mov r8, 0x22
		lea r9, [rel str]
		mov r10, 0x3B
		call dprintf
		ret
		
	_exit:
		mov rdi, 0x0
		mov rax, 0x2000001
		syscall
%endmacro
;comment
func
