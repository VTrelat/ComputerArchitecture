	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0	sdk_version 12, 3
	.intel_syntax noprefix
	.globl	_f                              ## -- Begin function f
	.p2align	4, 0x90
_f:                                     ## @f
## %bb.0:
	push	rbp
	mov	rbp, rsp
                                        ## kill: def $edx killed $edx def $rdx
	cmp	edx, 3
	jl	LBB0_6
## %bb.1:
	add	edx, -1
	lea	r8, [rdx - 1]
	mov	eax, 1
	cmp	edx, 2
	je	LBB0_4
## %bb.2:
	mov	r9, r8
	and	r9, -2
	neg	r9
	mov	edx, 1
	.p2align	4, 0x90
LBB0_3:                                 ## =>This Inner Loop Header: Depth=1
	mov	eax, dword ptr [rsi + 4*rdx]
	mov	dword ptr [rdi + 4*rdx], eax
	mov	eax, dword ptr [rsi + 4*rdx + 4]
	mov	dword ptr [rdi + 4*rdx + 4], eax
	mov	eax, dword ptr [rsi + 4*rdx + 4]
	mov	dword ptr [rdi + 4*rdx + 4], eax
	lea	rax, [rdx + 2]
	mov	ecx, dword ptr [rsi + 4*rdx + 8]
	mov	dword ptr [rdi + 4*rdx + 8], ecx
	lea	rcx, [r9 + rdx]
	add	rcx, 2
	mov	rdx, rax
	cmp	rcx, 1
	jne	LBB0_3
LBB0_4:
	test	r8b, 1
	je	LBB0_6
## %bb.5:
	mov	ecx, dword ptr [rsi + 4*rax]
	mov	dword ptr [rdi + 4*rax], ecx
	mov	ecx, dword ptr [rsi + 4*rax + 4]
	mov	dword ptr [rdi + 4*rax + 4], ecx
LBB0_6:
	pop	rbp
	ret
                                        ## -- End function
.subsections_via_symbols
