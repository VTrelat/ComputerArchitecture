	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0	sdk_version 12, 3
	.intel_syntax noprefix
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
## %bb.0:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	dword ptr [rbp - 4], 0
	mov	dword ptr [rbp - 12], 0
	mov	dword ptr [rbp - 16], 0
	mov	dword ptr [rbp - 20], 0
	mov	dword ptr [rbp - 24], 0
	mov	dword ptr [rbp - 8], 1
LBB0_1:                                 ## =>This Inner Loop Header: Depth=1
	cmp	dword ptr [rbp - 8], 10
	jge	LBB0_4
## %bb.2:                               ##   in Loop: Header=BB0_1 Depth=1
	mov	eax, dword ptr [rbp - 8]
	imul	eax, dword ptr [rbp - 8]
	imul	eax, dword ptr [rbp - 8]
	imul	eax, dword ptr [rbp - 8]
	add	eax, dword ptr [rbp - 12]
	mov	dword ptr [rbp - 12], eax
	mov	eax, dword ptr [rbp - 12]
	imul	eax, dword ptr [rbp - 12]
	imul	eax, dword ptr [rbp - 12]
	imul	eax, dword ptr [rbp - 12]
	add	eax, dword ptr [rbp - 16]
	mov	dword ptr [rbp - 16], eax
	mov	eax, dword ptr [rbp - 12]
	imul	eax, dword ptr [rbp - 12]
	imul	eax, dword ptr [rbp - 16]
	imul	eax, dword ptr [rbp - 16]
	add	eax, dword ptr [rbp - 20]
	mov	dword ptr [rbp - 20], eax
	mov	eax, dword ptr [rbp - 12]
	cdq
	idiv	dword ptr [rbp - 16]
	add	eax, dword ptr [rbp - 24]
	mov	dword ptr [rbp - 24], eax
	mov	eax, dword ptr [rbp - 20]
	add	eax, dword ptr [rbp - 24]
	mov	dword ptr [rbp - 24], eax
## %bb.3:                               ##   in Loop: Header=BB0_1 Depth=1
	mov	eax, dword ptr [rbp - 8]
	add	eax, 1
	mov	dword ptr [rbp - 8], eax
	jmp	LBB0_1
LBB0_4:
	mov	esi, dword ptr [rbp - 24]
	lea	rdi, [rip + L_.str]
	mov	al, 0
	call	_printf
	xor	eax, eax
	add	rsp, 32
	pop	rbp
	ret
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"%d\n"

.subsections_via_symbols
