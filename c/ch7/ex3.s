	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0	sdk_version 12, 3
	.intel_syntax noprefix
	.globl	_min                            ## -- Begin function min
	.p2align	4, 0x90
_min:                                   ## @min
## %bb.0:
	push	rbp
	mov	rbp, rsp
	mov	eax, dword ptr [rdi]
	cmp	esi, 2
	jl	LBB0_11
## %bb.1:
	mov	ecx, esi
	lea	r8, [rcx - 1]
	mov	edx, 1
	cmp	r8, 8
	jb	LBB0_10
## %bb.2:
	mov	rdx, r8
	and	rdx, -8
	movd	xmm0, eax
	pshufd	xmm0, xmm0, 0                   ## xmm0 = xmm0[0,0,0,0]
	lea	rax, [rdx - 8]
	mov	r9, rax
	shr	r9, 3
	add	r9, 1
	test	rax, rax
	je	LBB0_3
## %bb.4:
	mov	rax, r9
	and	rax, -2
	neg	rax
	mov	esi, 1
	movdqa	xmm1, xmm0
	.p2align	4, 0x90
LBB0_5:                                 ## =>This Inner Loop Header: Depth=1
	movdqu	xmm2, xmmword ptr [rdi + 4*rsi]
	pminsd	xmm2, xmm0
	movdqu	xmm3, xmmword ptr [rdi + 4*rsi + 16]
	pminsd	xmm3, xmm1
	movdqu	xmm0, xmmword ptr [rdi + 4*rsi + 32]
	pminsd	xmm0, xmm2
	movdqu	xmm1, xmmword ptr [rdi + 4*rsi + 48]
	pminsd	xmm1, xmm3
	add	rsi, 16
	add	rax, 2
	jne	LBB0_5
## %bb.6:
	test	r9b, 1
	je	LBB0_8
LBB0_7:
	movdqu	xmm2, xmmword ptr [rdi + 4*rsi]
	pminsd	xmm0, xmm2
	movdqu	xmm2, xmmword ptr [rdi + 4*rsi + 16]
	pminsd	xmm1, xmm2
LBB0_8:
	pminsd	xmm0, xmm1
	pshufd	xmm1, xmm0, 238                 ## xmm1 = xmm0[2,3,2,3]
	pminsd	xmm1, xmm0
	pshufd	xmm0, xmm1, 85                  ## xmm0 = xmm1[1,1,1,1]
	pminsd	xmm0, xmm1
	movd	eax, xmm0
	cmp	r8, rdx
	je	LBB0_11
## %bb.9:
	or	rdx, 1
	.p2align	4, 0x90
LBB0_10:                                ## =>This Inner Loop Header: Depth=1
	mov	esi, dword ptr [rdi + 4*rdx]
	cmp	esi, eax
	cmovl	eax, esi
	add	rdx, 1
	cmp	rcx, rdx
	jne	LBB0_10
LBB0_11:
	pop	rbp
	ret
LBB0_3:
	mov	esi, 1
	movdqa	xmm1, xmm0
	test	r9b, 1
	jne	LBB0_7
	jmp	LBB0_8
                                        ## -- End function
.subsections_via_symbols
