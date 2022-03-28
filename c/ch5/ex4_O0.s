main:
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