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
	shr	rcx
	lea	eax, [rcx + rdi]
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
