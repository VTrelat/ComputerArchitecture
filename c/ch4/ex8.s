	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0	sdk_version 12, 3
	.intel_syntax noprefix
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
## %bb.0:
	push	rbp
	mov	rbp, rsp
	mov	dword ptr [rbp - 4], 0
	mov	dword ptr [rbp - 8], 1
	mov	eax, dword ptr [rbp - 8]
	mov	ecx, 4
	cdq
	idiv	ecx
	cmp	edx, 0
	jne	LBB0_2
## %bb.1:
	mov	dword ptr [rbp - 12], 1
LBB0_2:
	mov	eax, dword ptr [rbp - 4]
	pop	rbp
	ret
                                        ## -- End function
.subsections_via_symbols
