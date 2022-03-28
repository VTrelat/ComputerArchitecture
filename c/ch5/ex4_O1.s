main:
	sub	rsp, 8
	mov	r9d, 0
	mov	r8d, 0
	mov	esi, 0
	mov	ecx, 0
	mov	edi, 1
.L2:
	mov	eax, edi
	imul	eax, edi
	imul	eax, eax
	add	ecx, eax
	mov	eax, ecx
	imul	eax, ecx
	mov	edx, eax
	imul	edx, ecx
	imul	edx, ecx
	add	esi, edx
	imul	eax, esi
	imul	eax, esi
	add	r8d, eax
	mov	eax, ecx
	cdq
	idiv	esi
	add	eax, r9d
	lea	r9d, [r8+rax]
	add	edi, 1
	cmp	edi, 10
	jne	.L2
	mov	edx, r9d
	lea	rsi, .LC0[rip]
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	mov	eax, 0
	add	rsp, 8
	ret