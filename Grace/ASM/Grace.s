section.text:
	global _start
	extern dprintf

%define FILENAME		`Grace_kid.s`
%define FILE_RIGHTS		420
%define FLAGS			577

; This is a _start. No shit ?
_start:
	lea rdi, [rel filename]
	mov rsi, FILE_RIGHTS
	mov rax, 90
	syscall

	push rsi
	pop rdx
	mov rsi, FLAGS
	mov rax, 2
	syscall

	push rax
	pop rdi
	lea rsi, [rel code]
	mov rdx, 10
	mov rcx, 37
	mov r8, 96
	mov r9, rsi
	call dprintf

	mov rax, 3
	syscall

	xor rdi, rdi
	mov rax, 60
	syscall

code db `section.text:%1$c	global _start%1$c	extern dprintf%1$c%1$c%2$cdefine FILENAME		%3$cGrace_kid.s%3$c%1$c%2$cdefine FILE_RIGHTS		420%1$c%2$cdefine FLAGS			577%1$c%1$c; This is a _start. No shit ?%1$c_start:%1$c	lea rdi, [rel filename]%1$c	mov rsi, FILE_RIGHTS%1$c	mov rax, 90%1$c	syscall%1$c%1$c	push rsi%1$c	pop rdx%1$c	mov rsi, FLAGS%1$c	mov rax, 2%1$c	syscall%1$c%1$c	push rax%1$c	pop rdi%1$c	lea rsi, [rel code]%1$c	mov rdx, 10%1$c	mov rcx, 37%1$c	mov r8, 96%1$c	mov r9, rsi%1$c	call dprintf%1$c%1$c	mov rax, 3%1$c	syscall%1$c%1$c	xor rdi, rdi%1$c	mov rax, 60%1$c	syscall%1$c%1$ccode db %3$c%4$s%3$c, 0x0%1$cfilename db FILENAME, 0x0%1$c`, 0x0
filename db FILENAME, 0x0
