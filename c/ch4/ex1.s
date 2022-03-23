	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0	sdk_version 12, 3
	.intel_syntax noprefix
	.globl	_sum                            ## -- Begin function sum
	.p2align	4, 0x90
_sum:                                   ## @sum
## %bb.0:
	push	rbp
	mov	rbp, rsp
	mov	dword ptr [rbp - 4], edi
	mov	dword ptr [rbp - 8], 0
	mov	dword ptr [rbp - 12], 0
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	mov	eax, dword ptr [rbp - 12]
	cmp	eax, dword ptr [rbp - 4]
	jge	LBB0_4
## %bb.2:                               ##   in Loop: Header=BB0_1 Depth=1
	mov	eax, dword ptr [rbp - 12]
	add	eax, dword ptr [rbp - 8]
	mov	dword ptr [rbp - 8], eax
## %bb.3:                               ##   in Loop: Header=BB0_1 Depth=1
	mov	eax, dword ptr [rbp - 12]
	add	eax, 1
	mov	dword ptr [rbp - 12], eax
	jmp	LBB0_1
LBB0_4:
	mov	eax, dword ptr [rbp - 8]
	pop	rbp
	ret
                                        ## -- End function
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
## %bb.0:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 16
	mov	dword ptr [rbp - 4], 0
	mov	dword ptr [rbp - 8], 2
	mov	edi, dword ptr [rbp - 8]
	call	_sum
	add	eax, dword ptr [rbp - 4]
	mov	dword ptr [rbp - 4], eax
	mov	edi, dword ptr [rbp - 4]
	call	_sum
	add	eax, dword ptr [rbp - 4]
	mov	dword ptr [rbp - 4], eax
	xor	eax, eax
	add	rsp, 16
	pop	rbp
	ret
                                        ## -- End function
.subsections_via_symbols
