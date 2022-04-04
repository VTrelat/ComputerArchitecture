	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 12, 0	sdk_version 12, 3
	.globl	_sincr                          ; -- Begin function sincr
	.p2align	2
_sincr:                                 ; @sincr
; %bb.0:
	subs	w9, w1, #1
	b.lt	LBB0_15
; %bb.1:
	cmp	w9, #7
	b.hs	LBB0_3
; %bb.2:
	mov	w11, #0
	mov	x9, x0
	b	LBB0_13
LBB0_3:
	add	x8, x9, #1
	cmp	w9, #63
	b.hs	LBB0_5
; %bb.4:
	mov	x10, #0
	b	LBB0_9
LBB0_5:
	and	x10, x8, #0x1ffffffc0
	add	x9, x0, #32
	movi.16b	v0, #1
	mov	x11, x10
LBB0_6:                                 ; =>This Inner Loop Header: Depth=1
	ldp	q1, q2, [x9, #-32]
	ldp	q3, q4, [x9]
	add.16b	v1, v1, v0
	add.16b	v2, v2, v0
	add.16b	v3, v3, v0
	add.16b	v4, v4, v0
	stp	q1, q2, [x9, #-32]
	stp	q3, q4, [x9], #64
	subs	x11, x11, #64
	b.ne	LBB0_6
; %bb.7:
	cmp	x8, x10
	b.eq	LBB0_15
; %bb.8:
	tst	x8, #0x38
	b.eq	LBB0_12
LBB0_9:
	and	x11, x8, #0x1fffffff8
	add	x9, x0, x11
	add	x12, x0, x10
	sub	x10, x10, x11
	movi.8b	v0, #1
LBB0_10:                                ; =>This Inner Loop Header: Depth=1
	ldr	d1, [x12]
	add.8b	v1, v1, v0
	str	d1, [x12], #8
	adds	x10, x10, #8
	b.ne	LBB0_10
; %bb.11:
	cmp	x8, x11
	b.ne	LBB0_13
	b	LBB0_15
LBB0_12:
	add	x9, x0, x10
	mov	x11, x10
LBB0_13:
	sub	w8, w1, w11
LBB0_14:                                ; =>This Inner Loop Header: Depth=1
	ldrb	w10, [x9]
	add	w10, w10, #1
	strb	w10, [x9], #1
	subs	w8, w8, #1
	b.ne	LBB0_14
LBB0_15:
	ret
                                        ; -- End function
.subsections_via_symbols
