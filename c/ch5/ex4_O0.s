	.file	"ex4.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	DWORD PTR -16[rbp], 0
	mov	DWORD PTR -12[rbp], 0
	mov	DWORD PTR -8[rbp], 0
	mov	DWORD PTR -4[rbp], 0
	mov	DWORD PTR -20[rbp], 1
	jmp	.L2
.L3:
	mov	eax, DWORD PTR -20[rbp]
	imul	eax, eax
	imul	eax, DWORD PTR -20[rbp]
	imul	eax, DWORD PTR -20[rbp]
	add	DWORD PTR -16[rbp], eax
	mov	eax, DWORD PTR -16[rbp]
	imul	eax, eax
	imul	eax, DWORD PTR -16[rbp]
	imul	eax, DWORD PTR -16[rbp]
	add	DWORD PTR -12[rbp], eax
	mov	eax, DWORD PTR -16[rbp]
	imul	eax, eax
	imul	eax, DWORD PTR -12[rbp]
	imul	eax, DWORD PTR -12[rbp]
	add	DWORD PTR -8[rbp], eax
	mov	eax, DWORD PTR -16[rbp]
	cdq
	idiv	DWORD PTR -12[rbp]
	add	DWORD PTR -4[rbp], eax
	mov	eax, DWORD PTR -8[rbp]
	add	DWORD PTR -4[rbp], eax
	add	DWORD PTR -20[rbp], 1
.L2:
	cmp	DWORD PTR -20[rbp], 9
	jle	.L3
	mov	eax, DWORD PTR -4[rbp]
	mov	esi, eax
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
