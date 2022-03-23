	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0	sdk_version 12, 3
	.intel_syntax noprefix
	.globl	_sum                            ## -- Begin function sum
	.p2align	4, 0x90
_sum:                                   ## @sum
## %bb.0:
	push	rbp
	mov	rbp, rsp
                                        ## kill: def $edi killed $edi def $rdi
	test	edi, edi
	jle	LBB0_1
## %bb.2:
	lea	eax, [rdi - 1]
	lea	ecx, [rdi - 2]
	imul	rcx, rax
	mov	rax, rcx
	shr	rax
	lea	edx, [8*rax]
	sub	edx, eax
	add	edx, edi
	lea	eax, [rdi - 3]
	add	edi, -4
	imul	rdi, rax
	imul	rdi, rcx
                                        ## kill: def $ecx killed $ecx killed $rcx def $rcx
	imul	ecx, eax
	and	ecx, -2
	lea	eax, [rdx + 2*rcx]
	shr	rdi, 2
	and	edi, -2
	add	eax, edi
	add	eax, -1
	pop	rbp
	ret
LBB0_1:
	xor	eax, eax
	pop	rbp
	ret
                                        ## -- End function
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
## %bb.0:
	push	rbp
	mov	rbp, rsp
	xor	eax, eax
	pop	rbp
	ret
                                        ## -- End function
.subsections_via_symbols
