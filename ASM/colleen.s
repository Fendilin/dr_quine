section .text
	global _start
	extern printf

_func:
	ret

;comment

_start:
	mov rdi, str
	mov rsi, 0xA
	mov rdx, 0x09
	mov rcx, 0x22
	mov r10, str
	;comment
	call _func
	call printf
	ret

section .data
	str: db "hello"
