	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0	sdk_version 12, 3
	.intel_syntax noprefix
	.globl	_make_random_table              ## -- Begin function make_random_table
	.p2align	4, 0x90
_make_random_table:                     ## @make_random_table
## %bb.0:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	dword ptr [rbp - 12], edi
	movsxd	rdi, dword ptr [rbp - 12]
	shl	rdi, 2
	call	_malloc
	mov	qword ptr [rbp - 24], rax
	cmp	qword ptr [rbp - 24], 0
	jne	LBB0_2
## %bb.1:
	mov	qword ptr [rbp - 8], 0
	jmp	LBB0_7
LBB0_2:
	mov	dword ptr [rbp - 28], 0
LBB0_3:                                 ## =>This Inner Loop Header: Depth=1
	mov	eax, dword ptr [rbp - 28]
	cmp	eax, dword ptr [rbp - 12]
	jge	LBB0_6
## %bb.4:                               ##   in Loop: Header=BB0_3 Depth=1
	call	_rand
	mov	ecx, 100
	cdq
	idiv	ecx
	mov	rax, qword ptr [rbp - 24]
	movsxd	rcx, dword ptr [rbp - 28]
	mov	dword ptr [rax + 4*rcx], edx
## %bb.5:                               ##   in Loop: Header=BB0_3 Depth=1
	mov	eax, dword ptr [rbp - 28]
	add	eax, 1
	mov	dword ptr [rbp - 28], eax
	jmp	LBB0_3
LBB0_6:
	mov	rax, qword ptr [rbp - 24]
	mov	qword ptr [rbp - 8], rax
LBB0_7:
	mov	rax, qword ptr [rbp - 8]
	add	rsp, 32
	pop	rbp
	ret
                                        ## -- End function
	.globl	_count_less_than                ## -- Begin function count_less_than
	.p2align	4, 0x90
_count_less_than:                       ## @count_less_than
## %bb.0:
	push	rbp
	mov	rbp, rsp
	mov	qword ptr [rbp - 8], rdi
	mov	dword ptr [rbp - 12], esi
	mov	dword ptr [rbp - 16], edx
	mov	dword ptr [rbp - 24], 0
	mov	dword ptr [rbp - 20], 0
LBB1_1:                                 ## =>This Inner Loop Header: Depth=1
	mov	eax, dword ptr [rbp - 20]
	cmp	eax, dword ptr [rbp - 12]
	jge	LBB1_6
## %bb.2:                               ##   in Loop: Header=BB1_1 Depth=1
	mov	rax, qword ptr [rbp - 8]
	movsxd	rcx, dword ptr [rbp - 20]
	mov	eax, dword ptr [rax + 4*rcx]
	cmp	eax, dword ptr [rbp - 16]
	jge	LBB1_4
## %bb.3:                               ##   in Loop: Header=BB1_1 Depth=1
	mov	eax, dword ptr [rbp - 24]
	add	eax, 1
	mov	dword ptr [rbp - 24], eax
LBB1_4:                                 ##   in Loop: Header=BB1_1 Depth=1
	jmp	LBB1_5
LBB1_5:                                 ##   in Loop: Header=BB1_1 Depth=1
	mov	eax, dword ptr [rbp - 20]
	add	eax, 1
	mov	dword ptr [rbp - 20], eax
	jmp	LBB1_1
LBB1_6:
	mov	eax, dword ptr [rbp - 24]
	pop	rbp
	ret
                                        ## -- End function
	.globl	_print_timing                   ## -- Begin function print_timing
	.p2align	4, 0x90
_print_timing:                          ## @print_timing
## %bb.0:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 96
	mov	qword ptr [rbp - 24], rdi
	mov	dword ptr [rbp - 28], esi
	mov	dword ptr [rbp - 32], edx
	mov	qword ptr [rbp - 40], rcx
	mov	dword ptr [rbp - 44], r8d
	mov	dword ptr [rbp - 48], r9d
	mov	dword ptr [rbp - 52], 0
	mov	dword ptr [rbp - 56], 0
LBB2_1:                                 ## =>This Inner Loop Header: Depth=1
	mov	eax, dword ptr [rbp - 56]
	cmp	eax, dword ptr [rbp - 44]
	jge	LBB2_4
## %bb.2:                               ##   in Loop: Header=BB2_1 Depth=1
	mov	rax, qword ptr [rbp - 40]
	mov	rdi, qword ptr [rbp - 24]
	mov	esi, dword ptr [rbp - 28]
	mov	edx, dword ptr [rbp - 32]
	call	rax
	add	eax, dword ptr [rbp - 52]
	mov	dword ptr [rbp - 52], eax
## %bb.3:                               ##   in Loop: Header=BB2_1 Depth=1
	mov	eax, dword ptr [rbp - 56]
	add	eax, 1
	mov	dword ptr [rbp - 56], eax
	jmp	LBB2_1
LBB2_4:
	lea	rax, [rbp - 76]
	mov	qword ptr [rbp - 16], rax
	mov	rax, qword ptr [rbp - 16]
	mov	qword ptr [rbp - 88], rax       ## 8-byte Spill
	rdtscp
	mov	rsi, rdx
	mov	edx, ecx
	mov	rcx, qword ptr [rbp - 88]       ## 8-byte Reload
	shl	rsi, 32
	or	rax, rsi
	mov	dword ptr [rcx], edx
	mov	qword ptr [rbp - 64], rax
	mov	dword ptr [rbp - 80], 0
LBB2_5:                                 ## =>This Inner Loop Header: Depth=1
	mov	eax, dword ptr [rbp - 80]
	cmp	eax, dword ptr [rbp - 48]
	jge	LBB2_8
## %bb.6:                               ##   in Loop: Header=BB2_5 Depth=1
	mov	rax, qword ptr [rbp - 40]
	mov	rdi, qword ptr [rbp - 24]
	mov	esi, dword ptr [rbp - 28]
	mov	edx, dword ptr [rbp - 32]
	call	rax
	add	eax, dword ptr [rbp - 52]
	mov	dword ptr [rbp - 52], eax
## %bb.7:                               ##   in Loop: Header=BB2_5 Depth=1
	mov	eax, dword ptr [rbp - 80]
	add	eax, 1
	mov	dword ptr [rbp - 80], eax
	jmp	LBB2_5
LBB2_8:
	lea	rax, [rbp - 76]
	mov	qword ptr [rbp - 8], rax
	mov	rax, qword ptr [rbp - 8]
	mov	qword ptr [rbp - 96], rax       ## 8-byte Spill
	rdtscp
	mov	rsi, rdx
	mov	edx, ecx
	mov	rcx, qword ptr [rbp - 96]       ## 8-byte Reload
	shl	rsi, 32
	or	rax, rsi
	mov	dword ptr [rcx], edx
	mov	qword ptr [rbp - 72], rax
	mov	rax, qword ptr [rbp - 72]
	sub	rax, qword ptr [rbp - 64]
	movsxd	rcx, dword ptr [rbp - 48]
	xor	edx, edx
                                        ## kill: def $rdx killed $edx
	div	rcx
	mov	rsi, rax
	lea	rdi, [rip + L_.str]
	mov	al, 0
	call	_printf
	add	rsp, 96
	pop	rbp
	ret
                                        ## -- End function
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
## %bb.0:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	dword ptr [rbp - 4], 0
	xor	eax, eax
	mov	edi, eax
	call	_time
	mov	edi, eax
	call	_srand
	mov	edi, 10000000
	call	_make_random_table
	mov	qword ptr [rbp - 16], rax
	lea	rdi, [rip + L_.str.1]
	mov	al, 0
	call	_printf
	mov	dword ptr [rbp - 20], 0
LBB3_1:                                 ## =>This Inner Loop Header: Depth=1
	cmp	dword ptr [rbp - 20], 100
	jge	LBB3_4
## %bb.2:                               ##   in Loop: Header=BB3_1 Depth=1
	mov	esi, dword ptr [rbp - 20]
	lea	rdi, [rip + L_.str.2]
	mov	al, 0
	call	_printf
	mov	rdi, qword ptr [rbp - 16]
	mov	edx, dword ptr [rbp - 20]
	mov	esi, 10000000
	lea	rcx, [rip + _count_less_than]
	mov	r8d, 100
	mov	r9d, 1000
	call	_print_timing
## %bb.3:                               ##   in Loop: Header=BB3_1 Depth=1
	mov	eax, dword ptr [rbp - 20]
	add	eax, 1
	mov	dword ptr [rbp - 20], eax
	jmp	LBB3_1
LBB3_4:
	mov	rdi, qword ptr [rbp - 16]
	call	_free
	xor	eax, eax
	add	rsp, 32
	pop	rbp
	ret
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"%lu\n"

L_.str.1:                               ## @.str.1
	.asciz	"i t\n"

L_.str.2:                               ## @.str.2
	.asciz	"%d "

.subsections_via_symbols
