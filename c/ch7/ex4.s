	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 11, 0	sdk_version 12, 1
	.intel_syntax noprefix
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4                               ## -- Begin function flatten
LCPI0_0:
	.long	1431655766                      ## 0x55555556
	.long	1431655766                      ## 0x55555556
	.long	1431655766                      ## 0x55555556
	.long	1431655766                      ## 0x55555556
LCPI0_1:
	.byte	255                             ## 0xff
	.byte	0                               ## 0x0
	.byte	0                               ## 0x0
	.byte	0                               ## 0x0
	.byte	255                             ## 0xff
	.byte	0                               ## 0x0
	.byte	0                               ## 0x0
	.byte	0                               ## 0x0
	.byte	255                             ## 0xff
	.byte	0                               ## 0x0
	.byte	0                               ## 0x0
	.byte	0                               ## 0x0
	.byte	255                             ## 0xff
	.byte	0                               ## 0x0
	.byte	0                               ## 0x0
	.byte	0                               ## 0x0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_flatten
	.p2align	4, 0x90
_flatten:                               ## @flatten
## %bb.0:
	push	rbp
	mov	rbp, rsp
	push	r15
	push	r14
	push	rbx
	push	rax
	mov	r14d, esi
	mov	r15, rdi
	imul	r14d, edx
	lea	eax, [r14 + 2*r14]
	movsxd	rdi, eax
	call	_malloc
	test	r14d, r14d
	jle	LBB0_10
## %bb.1:
	movsxd	r8, r14d
	add	r8, r8
	mov	r10d, r14d
	cmp	r14d, 16
	jae	LBB0_3
## %bb.2:
	xor	r9d, r9d
	jmp	LBB0_8
LBB0_3:
	lea	rcx, [rax + r10]
	lea	r9, [rax + 2*r10]
	lea	rsi, [rax + r8]
	lea	rdi, [r8 + r10]
	add	rdi, rax
	cmp	rax, rdi
	setb	bl
	cmp	rsi, rcx
	setb	dl
	cmp	rcx, rdi
	setb	cl
	cmp	rsi, r9
	setb	sil
	xor	r9d, r9d
	test	bl, dl
	jne	LBB0_8
## %bb.4:
	and	cl, sil
	jne	LBB0_8
## %bb.5:
	mov	r9d, r10d
	and	r9d, -16
	movdqa	xmm0, xmmword ptr [rip + LCPI0_0] ## xmm0 = [1431655766,1431655766,1431655766,1431655766]
	movdqa	xmm1, xmmword ptr [rip + LCPI0_1] ## xmm1 = [255,0,0,0,255,0,0,0,255,0,0,0,255,0,0,0]
	mov	rdi, r9
	mov	rsi, rax
	mov	rbx, r15
	.p2align	4, 0x90
LBB0_6:                                 ## =>This Inner Loop Header: Depth=1
	pmovsxbd	xmm2, dword ptr [rbx + 12]
	pmovsxbd	xmm3, dword ptr [rbx + 8]
	pmovsxbd	xmm4, dword ptr [rbx + 4]
	pmovsxbd	xmm5, dword ptr [rbx]
	pmovsxbd	xmm6, dword ptr [rbx + r10 + 12]
	paddd	xmm6, xmm2
	pmovsxbd	xmm2, dword ptr [rbx + r10 + 8]
	paddd	xmm2, xmm3
	pmovsxbd	xmm3, dword ptr [rbx + r10 + 4]
	paddd	xmm3, xmm4
	pmovsxbd	xmm4, dword ptr [rbx + r10]
	pmovsxbd	xmm7, dword ptr [rbx + r8]
	paddd	xmm4, xmm5
	paddd	xmm7, xmm4
	pmovsxbd	xmm4, dword ptr [rbx + r8 + 4]
	paddd	xmm4, xmm3
	pmovsxbd	xmm5, dword ptr [rbx + r8 + 8]
	paddd	xmm5, xmm2
	pmovsxbd	xmm3, dword ptr [rbx + r8 + 12]
	paddd	xmm3, xmm6
	pshufd	xmm2, xmm7, 245                 ## xmm2 = xmm7[1,1,3,3]
	pmuldq	xmm2, xmm0
	pmuldq	xmm7, xmm0
	pshufd	xmm6, xmm7, 245                 ## xmm6 = xmm7[1,1,3,3]
	pblendw	xmm6, xmm2, 204                 ## xmm6 = xmm6[0,1],xmm2[2,3],xmm6[4,5],xmm2[6,7]
	movdqa	xmm2, xmm6
	psrld	xmm2, 31
	paddd	xmm2, xmm6
	pshufd	xmm6, xmm4, 245                 ## xmm6 = xmm4[1,1,3,3]
	pmuldq	xmm6, xmm0
	pmuldq	xmm4, xmm0
	pshufd	xmm7, xmm4, 245                 ## xmm7 = xmm4[1,1,3,3]
	pblendw	xmm7, xmm6, 204                 ## xmm7 = xmm7[0,1],xmm6[2,3],xmm7[4,5],xmm6[6,7]
	movdqa	xmm4, xmm7
	psrld	xmm4, 31
	paddd	xmm4, xmm7
	pshufd	xmm6, xmm5, 245                 ## xmm6 = xmm5[1,1,3,3]
	pmuldq	xmm6, xmm0
	pmuldq	xmm5, xmm0
	pshufd	xmm5, xmm5, 245                 ## xmm5 = xmm5[1,1,3,3]
	pblendw	xmm5, xmm6, 204                 ## xmm5 = xmm5[0,1],xmm6[2,3],xmm5[4,5],xmm6[6,7]
	movdqa	xmm6, xmm5
	psrld	xmm6, 31
	paddd	xmm6, xmm5
	pshufd	xmm5, xmm3, 245                 ## xmm5 = xmm3[1,1,3,3]
	pmuldq	xmm5, xmm0
	pmuldq	xmm3, xmm0
	pshufd	xmm3, xmm3, 245                 ## xmm3 = xmm3[1,1,3,3]
	pblendw	xmm3, xmm5, 204                 ## xmm3 = xmm3[0,1],xmm5[2,3],xmm3[4,5],xmm5[6,7]
	movdqa	xmm5, xmm3
	psrld	xmm5, 31
	paddd	xmm5, xmm3
	pand	xmm5, xmm1
	pand	xmm6, xmm1
	packusdw	xmm6, xmm5
	pand	xmm4, xmm1
	pand	xmm2, xmm1
	packusdw	xmm2, xmm4
	packuswb	xmm2, xmm6
	movdqu	xmmword ptr [rsi], xmm2
	movdqu	xmmword ptr [rsi + r10], xmm2
	movdqu	xmmword ptr [rsi + r8], xmm2
	add	rbx, 16
	add	rsi, 16
	add	rdi, -16
	jne	LBB0_6
## %bb.7:
	cmp	r9, r10
	je	LBB0_10
LBB0_8:
	lea	r11, [r15 + r10]
	lea	r14, [rax + r10]
	lea	rbx, [r15 + r8]
	mov	rdx, rax
	add	rdx, r8
	mov	rcx, rax
	.p2align	4, 0x90
LBB0_9:                                 ## =>This Inner Loop Header: Depth=1
	movsx	r8d, byte ptr [r15 + r9]
	movsx	esi, byte ptr [r11 + r9]
	add	esi, r8d
	movsx	edi, byte ptr [rbx + r9]
	add	edi, esi
	movsxd	rsi, edi
	imul	rsi, rsi, 1431655766
	mov	rdi, rsi
	shr	rdi, 63
	shr	rsi, 32
	add	esi, edi
	mov	byte ptr [rcx + r9], sil
	mov	byte ptr [r14 + r9], sil
	mov	byte ptr [rdx + r9], sil
	inc	rcx
	inc	r15
	inc	r11
	inc	r14
	inc	rbx
	inc	rdx
	dec	r10
	cmp	r9, r10
	jne	LBB0_9
LBB0_10:
	add	rsp, 8
	pop	rbx
	pop	r14
	pop	r15
	pop	rbp
	ret
                                        ## -- End function
.subsections_via_symbols
