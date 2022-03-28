	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0	sdk_version 12, 3
	.intel_syntax noprefix
	.globl	_make_random_table              ## -- Begin function make_random_table
	.p2align	4, 0x90
_make_random_table:                     ## @make_random_table
## %bb.0:
	push	rbp
	mov	rbp, rsp
	push	r15
	push	r14
	push	rbx
	push	rax
	mov	r14d, edi
	movsxd	rdi, edi
	shl	rdi, 2
	call	_malloc
	test	rax, rax
	je	LBB0_1
## %bb.2:
	mov	r15, rax
	test	r14d, r14d
	jle	LBB0_5
## %bb.3:
	mov	r14d, r14d
	xor	ebx, ebx
	.p2align	4, 0x90
LBB0_4:                                 ## =>This Inner Loop Header: Depth=1
	call	_rand
	cdqe
	imul	rcx, rax, 1374389535
	mov	rdx, rcx
	shr	rdx, 63
	sar	rcx, 37
	add	ecx, edx
	imul	ecx, ecx, 100
	sub	eax, ecx
	mov	dword ptr [r15 + 4*rbx], eax
	add	rbx, 1
	cmp	r14, rbx
	jne	LBB0_4
	jmp	LBB0_5
LBB0_1:
	xor	r15d, r15d
LBB0_5:
	mov	rax, r15
	add	rsp, 8
	pop	rbx
	pop	r14
	pop	r15
	pop	rbp
	ret
                                        ## -- End function
	.globl	_count_less_than                ## -- Begin function count_less_than
	.p2align	4, 0x90
_count_less_than:                       ## @count_less_than
## %bb.0:
	push	rbp
	mov	rbp, rsp
	test	esi, esi
	jle	LBB1_1
## %bb.2:
	mov	r8d, esi
	xor	esi, esi
	xor	eax, eax
	.p2align	4, 0x90
LBB1_3:                                 ## =>This Inner Loop Header: Depth=1
	xor	ecx, ecx
	cmp	dword ptr [rdi + 4*rsi], edx
	setl	cl
	add	eax, ecx
	add	rsi, 1
	cmp	r8, rsi
	jne	LBB1_3
## %bb.4:
	pop	rbp
	ret
LBB1_1:
	xor	eax, eax
	pop	rbp
	ret
                                        ## -- End function
	.globl	_print_timing                   ## -- Begin function print_timing
	.p2align	4, 0x90
_print_timing:                          ## @print_timing
## %bb.0:
	push	rbp
	mov	rbp, rsp
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbx
	sub	rsp, 24
	mov	dword ptr [rbp - 44], r9d       ## 4-byte Spill
	mov	r15, rcx
	mov	r12d, edx
	mov	r13d, esi
	mov	r14, rdi
	test	r8d, r8d
	jle	LBB2_3
## %bb.1:
	mov	ebx, r8d
	.p2align	4, 0x90
LBB2_2:                                 ## =>This Inner Loop Header: Depth=1
	mov	rdi, r14
	mov	esi, r13d
	mov	edx, r12d
	call	r15
	add	ebx, -1
	jne	LBB2_2
LBB2_3:
	rdtscp
	shl	rdx, 32
	or	rdx, rax
	mov	qword ptr [rbp - 56], rdx       ## 8-byte Spill
	cmp	dword ptr [rbp - 44], 0         ## 4-byte Folded Reload
	jle	LBB2_6
## %bb.4:
	mov	ebx, dword ptr [rbp - 44]       ## 4-byte Reload
	.p2align	4, 0x90
LBB2_5:                                 ## =>This Inner Loop Header: Depth=1
	mov	rdi, r14
	mov	esi, r13d
	mov	edx, r12d
	call	r15
	add	ebx, -1
	jne	LBB2_5
LBB2_6:
	rdtscp
	shl	rdx, 32
	or	rax, rdx
	sub	rax, qword ptr [rbp - 56]       ## 8-byte Folded Reload
	movsxd	rcx, dword ptr [rbp - 44]       ## 4-byte Folded Reload
	xor	edx, edx
	div	rcx
	lea	rdi, [rip + L_.str]
	mov	rsi, rax
	xor	eax, eax
	call	_printf
	add	rsp, 24
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	ret
                                        ## -- End function
	.globl	_main                           ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
## %bb.0:
	push	rbp
	mov	rbp, rsp
	push	r15
	push	r14
	push	r12
	push	rbx
	xor	edi, edi
	call	_time
	mov	edi, eax
	call	_srand
	mov	edi, 10000000
	call	_make_random_table
	mov	r12, rax
	lea	rdi, [rip + L_str]
	call	_puts
	lea	r14, [rip + L_.str.2]
	lea	r15, [rip + _count_less_than]
	xor	ebx, ebx
	.p2align	4, 0x90
LBB3_1:                                 ## =>This Inner Loop Header: Depth=1
	mov	rdi, r14
	mov	esi, ebx
	xor	eax, eax
	call	_printf
	mov	rdi, r12
	mov	esi, 10000000
	mov	edx, ebx
	mov	rcx, r15
	mov	r8d, 100
	mov	r9d, 1000
	call	_print_timing
	add	ebx, 1
	cmp	ebx, 100
	jne	LBB3_1
## %bb.2:
	mov	rdi, r12
	call	_free
	xor	eax, eax
	pop	rbx
	pop	r12
	pop	r14
	pop	r15
	pop	rbp
	ret
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"%lu\n"

L_.str.2:                               ## @.str.2
	.asciz	"%d "

L_str:                                  ## @str
	.asciz	"i t"

.subsections_via_symbols
