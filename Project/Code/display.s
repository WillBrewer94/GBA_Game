	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"display.c"
	.text
	.align	2
	.global	hideSprites
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r6, .L5
	ldr	r5, .L5+4
	mov	r4, #0
.L2:
	mov	ip, #512	@ movhi
	strh	ip, [r6, r4]	@ movhi
	mov	r0, #3
	ldr	r1, .L5
	mov	r2, #117440512
	mov	r3, #512
	add	r4, r4, #8
	mov	lr, pc
	bx	r5
	cmp	r4, #1024
	bne	.L2
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L6:
	.align	2
.L5:
	.word	shadowOAM
	.word	DMANow
	.size	hideSprites, .-hideSprites
	.align	2
	.global	updateOAM
	.type	updateOAM, %function
updateOAM:
	@ Function supports interworking.
	@ args = 108, pretend = 16, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	sub	sp, sp, #16
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	ldr	ip, .L13
	ldr	lr, [ip, #0]
	add	ip, sp, #24
	tst	lr, #256
	stmia	ip, {r0, r1, r2, r3}
	ldr	r3, [sp, #128]
	ldr	r1, [sp, #116]
	ldr	r0, [sp, #120]
	beq	.L8
	ldr	r2, .L13+4
	ldr	r2, [r2, #0]
	tst	r2, #256
	beq	.L12
.L8:
	ldr	r2, [sp, #124]
	cmp	r2, #0
	bne	.L9
	ldr	lr, [sp, #88]
	ldr	r2, [sp, #72]
	ldr	r5, [sp, #68]
	ldr	r6, [sp, #76]
	ldr	r4, [sp, #28]
	cmp	lr, #3
	cmpne	lr, #0
	ldr	ip, .L13+8
	ldrb	r7, [sp, #25]	@ zero_extendqisi2
	mov	r3, r3, asl #3
	orr	r6, r6, r2
	addeq	r1, r1, r0, asl #4
	addne	r1, r1, r0, asl #4
	orr	r5, r5, #4096
	mov	r4, r4, asl #15
	add	r2, ip, r3
	orr	r5, r5, r7
	orr	r4, r6, r4, lsr #23
	moveq	r1, r1, asl #2
	movne	r1, r1, asl #1
	strh	r5, [ip, r3]	@ movhi
	strh	r4, [r2, #2]	@ movhi
	streqh	r1, [r2, #4]	@ movhi
	strneh	r1, [r2, #4]	@ movhi
.L11:
	mov	r0, #3
	ldr	r1, .L13+8
	mov	r2, #117440512
	mov	r3, #512
	ldr	ip, .L13+12
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	add	sp, sp, #16
	bx	lr
.L9:
	ldr	r2, .L13+8
	mov	r3, r3, asl #3
	ldrh	r1, [r2, r3]
	orr	r1, r1, #512
	strh	r1, [r2, r3]	@ movhi
	b	.L11
.L12:
	ldr	lr, .L13+16
	ldr	ip, [lr, #0]
	ldr	r2, .L13+20
	add	ip, ip, #1
	smull	r4, r2, ip, r2
	mov	r4, ip, asr #31
	add	r2, r2, ip
	rsb	r2, r4, r2, asr #3
	rsb	r2, r2, r2, asl #4
	rsb	r2, r2, ip
	mov	ip, r2, asl #8
	orr	ip, ip, r2, asl #12
	str	r2, [lr, #0]
	mov	r2, #67108864
	strh	ip, [r2, #76]	@ movhi
	b	.L8
.L14:
	.align	2
.L13:
	.word	oldButtons
	.word	buttons
	.word	shadowOAM
	.word	DMANow
	.word	.LANCHOR0
	.word	-2004318071
	.size	updateOAM, .-updateOAM
	.align	2
	.global	animatePlayer
	.type	animatePlayer, %function
animatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	ldr	r4, .L29
	sub	sp, sp, #100
	add	r2, r4, #84
	ldmia	r2, {r2, r3}	@ phole ldm
	ands	r3, r3, #3
	str	r2, [r4, #92]
	bne	.L16
	ldr	r1, [r4, #96]
	cmp	r1, #3
	str	r3, [r4, #88]
	beq	.L27
	cmp	r1, #9
	beq	.L18
.L19:
	add	r1, r1, #1
	str	r1, [r4, #96]
.L16:
	ldr	r5, .L29+4
	ldr	r3, [r5, #0]
	cmp	r3, #0
	bne	.L28
	ldr	r3, .L29+8
	ldr	r3, [r3, #0]
	ands	r2, r3, #2
	beq	.L22
	ldr	r1, .L29+12
	ldr	r1, [r1, #0]
	tst	r1, #2
	bne	.L22
.L20:
	mov	r1, #67108864
	ldr	r1, [r1, #304]
	mov	r0, #0
	tst	r1, #32
	ldr	r1, .L29
	str	r0, [r4, #84]
	moveq	r0, #1
	streq	r0, [r1, #84]
	moveq	r0, #4096
	streq	r0, [r1, #52]
	mov	r1, #67108864
	ldr	r1, [r1, #304]
	tst	r1, #16
	moveq	r1, #1
	streq	r1, [r4, #84]
	moveq	r1, #0
	streq	r1, [r4, #52]
	tst	r3, #1
	beq	.L25
	ldr	r3, .L29+12
	ldr	r3, [r3, #0]
	ands	r3, r3, #1
	moveq	r1, #2
	streq	r1, [r4, #84]
	streq	r3, [r5, #0]
	streq	r3, [r4, #96]
.L25:
	cmp	r2, #0
	beq	.L22
	ldr	r3, .L29+12
	ldr	r6, [r3, #0]
	ands	r6, r6, #2
	bne	.L22
	ldr	ip, [r4, #72]
	cmp	ip, #0
	ldr	r7, .L29
	ble	.L22
	sub	ip, ip, #1
	str	ip, [r7, #72]
	mov	r1, #6080
	mov	ip, #3
	mov	r2, #11008
	str	ip, [r7, #84]
	ldr	r0, .L29+16
	add	r1, r1, #7
	add	r2, r2, #17
	mov	r3, r6
	ldr	ip, .L29+20
	mov	lr, pc
	bx	ip
	str	r6, [r5, #0]
	str	r6, [r7, #96]
.L22:
	mov	r3, #0
	ldr	r1, .L29+24
	mov	r2, #88
	str	r3, [sp, #88]
	mov	r0, sp
	ldr	r3, .L29+28
	mov	lr, pc
	bx	r3
	ldmia	r4, {r0, r1, r2, r3}
	bl	updateOAM
	ldr	r3, [r4, #88]
	add	r3, r3, #1
	str	r3, [r4, #88]
	add	sp, sp, #100
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	bx	lr
.L28:
	ldr	r3, .L29+8
	ldr	r3, [r3, #0]
	and	r2, r3, #2
	b	.L20
.L27:
	cmp	r2, #3
	bne	.L19
.L18:
	ldr	r3, .L29+8
	mov	r2, #0
	ldr	r5, .L29+4
	ldr	r3, [r3, #0]
	str	r2, [r4, #96]
	mov	r2, #1
	str	r2, [r5, #0]
	and	r2, r3, #2
	b	.L20
.L30:
	.align	2
.L29:
	.word	player
	.word	.LANCHOR1
	.word	oldButtons
	.word	buttons
	.word	sword
	.word	playSoundB
	.word	player+16
	.word	memcpy
	.size	animatePlayer, .-animatePlayer
	.align	2
	.global	animateEnemies
	.type	animateEnemies, %function
animateEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r7, .L40
	ldr	r8, .L40+4
	sub	sp, sp, #100
	mov	r4, r7
	mov	r5, #0
	mov	r6, #4
	mov	r9, #9
	mov	fp, #11
.L38:
	ldr	r3, [r4, #88]
	ands	r2, r3, #7
	str	r6, [r4, #92]
	add	r3, r5, #2
	bne	.L32
	ldr	r1, [r4, #96]
	cmp	r1, #8
	addne	r1, r1, #2
	str	r2, [r4, #88]
	streq	r2, [r4, #96]
	strne	r1, [r4, #96]
.L32:
	ldr	r2, [r4, #64]
	cmp	r2, #1
	streq	r9, [r4, #92]
	beq	.L34
	cmp	r2, #2
	streq	fp, [r4, #92]
	beq	.L34
	cmp	r2, #0
	streq	r6, [r4, #92]
.L34:
	add	sl, r5, r5, asl #1
	add	sl, r5, sl, asl #2
	add	sl, r7, sl, asl #3
	add	r1, sl, #16
	mov	r2, #88
	mov	r0, sp
	str	r3, [sp, #88]
	mov	lr, pc
	bx	r8
	ldmia	sl, {r0, r1, r2, r3}
	bl	updateOAM
	ldr	r3, [r4, #88]
	add	r5, r5, #1
	add	r3, r3, #1
	cmp	r5, #50
	str	r3, [r4, #88]
	add	r4, r4, #104
	bne	.L38
	add	sp, sp, #100
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	enemies
	.word	memcpy
	.size	animateEnemies, .-animateEnemies
	.align	2
	.global	animateUI
	.type	animateUI, %function
animateUI:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L55
	stmfd	sp!, {r3, lr}
	ldr	r3, .L55+4
	mov	r0, #16384	@ movhi
	ldr	r2, [r1, #72]
	strh	r0, [r3, #8]	@ movhi
	mov	r0, #49152
	strh	r0, [r3, #10]	@ movhi
	cmp	r2, #3
	mov	r0, #4736	@ movhi
	strh	r0, [r3, #12]	@ movhi
	beq	.L50
	cmp	r2, #2
	beq	.L51
	cmp	r2, #1
	beq	.L52
	mov	r3, #83886080
	mov	r2, #2112
	add	r3, r3, #512
	add	r2, r2, #2
	strh	r2, [r3, #40]	@ movhi
	strh	r2, [r3, #42]	@ movhi
	strh	r2, [r3, #44]	@ movhi
.L44:
	ldr	r3, [r1, #68]
	cmp	r3, #3
	beq	.L53
.L47:
	cmp	r3, #2
	beq	.L54
	mov	r3, #83886080
	mov	r1, #1056
	mov	r2, #2112
	add	r3, r3, #512
	add	r2, r2, #2
	add	r1, r1, #15
	strh	r1, [r3, #34]	@ movhi
	strh	r2, [r3, #36]	@ movhi
	strh	r2, [r3, #38]	@ movhi
.L48:
	mov	r0, #3
	ldr	r1, .L55+4
	mov	r2, #117440512
	mov	r3, #512
	ldr	ip, .L55+8
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r3, lr}
	bx	lr
.L50:
	mov	r3, #83886080
	mov	r2, #6976
	add	r3, r3, #512
	add	r2, r2, #27
	strh	r2, [r3, #40]	@ movhi
	strh	r2, [r3, #42]	@ movhi
	strh	r2, [r3, #44]	@ movhi
	ldr	r3, [r1, #68]
	cmp	r3, #3
	bne	.L47
.L53:
	mov	r3, #83886080
	mov	r2, #1056
	add	r3, r3, #512
	add	r2, r2, #15
	strh	r2, [r3, #34]	@ movhi
	strh	r2, [r3, #36]	@ movhi
	strh	r2, [r3, #38]	@ movhi
	b	.L48
.L51:
	mov	r3, #83886080
	mov	r2, #6976
	mov	r0, #2112
	add	r3, r3, #512
	add	r2, r2, #27
	add	r0, r0, #2
	strh	r2, [r3, #40]	@ movhi
	strh	r2, [r3, #42]	@ movhi
	strh	r0, [r3, #44]	@ movhi
	b	.L44
.L52:
	mov	r3, #83886080
	mov	r0, #6976
	mov	r2, #2112
	add	r3, r3, #512
	add	r2, r2, #2
	add	r0, r0, #27
	strh	r0, [r3, #40]	@ movhi
	strh	r2, [r3, #42]	@ movhi
	strh	r2, [r3, #44]	@ movhi
	b	.L44
.L54:
	mov	r3, #83886080
	mov	r2, #1056
	mov	r1, #2112
	add	r3, r3, #512
	add	r2, r2, #15
	add	r1, r1, #2
	strh	r2, [r3, #34]	@ movhi
	strh	r2, [r3, #36]	@ movhi
	strh	r1, [r3, #38]	@ movhi
	b	.L48
.L56:
	.align	2
.L55:
	.word	player
	.word	shadowOAM
	.word	DMANow
	.size	animateUI, .-animateUI
	.align	2
	.global	animate
	.type	animate, %function
animate:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	bl	animatePlayer
	bl	animateEnemies
	ldmfd	sp!, {r4, lr}
	b	animateUI
	.size	animate, .-animate
	.align	2
	.global	initGraphics
	.type	initGraphics, %function
initGraphics:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	ip, #24064	@ movhi
	mov	r3, #67108864
	mov	r1, #23552
	mov	r2, #23040
	strh	ip, [r3, #8]	@ movhi
	add	r1, r1, #4
	mov	ip, #5888	@ movhi
	add	r2, r2, #8
	strh	ip, [r3, #0]	@ movhi
	mov	r5, #100663296
	strh	r1, [r3, #10]	@ movhi
	ldr	r0, .L59
	strh	r2, [r3, #12]	@ movhi
	ldr	r3, .L59+4
	ldr	r4, .L59+8
	mov	lr, pc
	bx	r3
	mov	r2, r5
	mov	r0, #3
	ldr	r1, .L59+12
	mov	r3, #1856
	mov	lr, pc
	bx	r4
	add	r2, r5, #61440
	mov	r0, #3
	ldr	r1, .L59+16
	mov	r3, #2048
	mov	lr, pc
	bx	r4
	mov	r3, #4160
	add	r2, r5, #16384
	mov	r0, #3
	ldr	r1, .L59+20
	add	r3, r3, #48
	mov	lr, pc
	bx	r4
	add	r2, r5, #57344
	mov	r0, #3
	ldr	r1, .L59+24
	mov	r3, #2048
	mov	lr, pc
	bx	r4
	add	r2, r5, #32768
	mov	r0, #3
	ldr	r1, .L59+28
	mov	r3, #3184
	mov	lr, pc
	bx	r4
	add	r2, r5, #53248
	mov	r0, #3
	ldr	r1, .L59+32
	mov	r3, #2048
	mov	lr, pc
	bx	r4
	add	r2, r5, #65536
	mov	r0, #3
	ldr	r1, .L59+36
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L59+40
	add	r2, r2, #512
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L60:
	.align	2
.L59:
	.word	tilemap_ground_v1Pal
	.word	loadPalette
	.word	DMANow
	.word	tilemap_ground_v1Tiles
	.word	tilemap_ground_v1Map
	.word	tilemap_mountainsv1Tiles
	.word	tilemap_mountainsv1Map
	.word	tilemap_moonTiles
	.word	tilemap_moonMap
	.word	sprite_sheet_v1Tiles
	.word	sprite_sheet_v1Pal
	.size	initGraphics, .-initGraphics
	.global	aniIsFinish
	.global	cooldown
	.global	isAttack
	.global	counter
	.comm	shadowOAM,1024,4
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	aniIsFinish, %object
	.size	aniIsFinish, 4
aniIsFinish:
	.word	1
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	counter, %object
	.size	counter, 4
counter:
	.space	4
	.type	cooldown, %object
	.size	cooldown, 4
cooldown:
	.space	4
	.type	isAttack, %object
	.size	isAttack, 4
isAttack:
	.space	4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
