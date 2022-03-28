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
	mov	dword ptr [rbp - 8], 30
	cmp	dword ptr [rbp - 8], 24
	jle	LBB0_3
## %bb.1:
	cmp	dword ptr [rbp - 8], 51
	jge	LBB0_3
## %bb.2:
	mov	eax, dword ptr [rbp - 8]
	add	eax, 1
	mov	dword ptr [rbp - 8], eax
LBB0_3:
	xor	eax, eax
	pop	rbp
	ret
                                        ## -- End function
.subsections_via_symbols
