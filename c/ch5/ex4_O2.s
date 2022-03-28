main:
	endbr64
	sub	rsp, 8
	xor	r9d, r9d
	xor	r8d, r8d
	xor	esi, esi
	xor	ecx, ecx
	mov	edi, 1
.L2:
	mov	eax, edi
	imul	eax, edi
	add	edi, 1
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
	cmp	edi, 10
	jne	.L2
	mov	edx, r9d
	lea	rsi, .LC0[rip]
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
	xor	eax, eax
	add	rsp, 8
	ret