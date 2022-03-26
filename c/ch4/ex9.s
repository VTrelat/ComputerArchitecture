	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0	sdk_version 12, 3
	.intel_syntax noprefix
	.globl	_u                              ## -- Begin function u
	.p2align	4, 0x90
_u:                                     ## @u
## %bb.0:
	test	esi, esi
	je	LBB0_5
## %bb.1:
	push	rbp
	mov	rbp, rsp
	add	esi, -1
	call	_u
                                        ## kill: def $eax killed $eax def $rax
	test	al, 1
	pop	rbp
	jne	LBB0_3
## %bb.2:
	mov	edi, eax
	shr	edi, 31
	add	edi, eax
	sar	edi
	mov	eax, edi
	ret
LBB0_3:
	mov	edi, 1
	cmp	eax, 1
	je	LBB0_5
## %bb.4:
	lea	edi, [rax + 2*rax]
	add	edi, 1
LBB0_5:
	mov	eax, edi
	ret
                                        ## -- End function
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
## %bb.0:
	push	rbp
	mov	rbp, rsp
	mov	edi, 3
	mov	esi, 100
	call	_u
	lea	rdi, [rip + L_.str]
	mov	esi, eax
	xor	eax, eax
	call	_printf
	xor	eax, eax
	pop	rbp
	ret
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"%d\n"

.subsections_via_symbols
