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
	.file	"engine.c"
	.text
	.align	2
	.global	initializeGame
	.type	initializeGame, %function
initializeGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r0, #0
	ldr	r4, .L5
	mov	lr, pc
	bx	r4
	ldr	r3, .L5+4
	mov	lr, pc
	bx	r3
	mov	r0, #0
	mov	lr, pc
	bx	r4
	ldr	r3, .L5+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L5+12
	mov	r1, #25600
	str	r1, [r3, #0]
	mov	r1, #30720
	str	r1, [r3, #4]
	mov	r1, #32768
	str	r1, [r3, #48]
	mov	r1, #16384
	str	r1, [r3, #44]
	mov	r1, #32
	str	r1, [r3, #56]
	mov	r1, #16
	str	r1, [r3, #60]
	mov	r1, #80
	str	r1, [r3, #24]
	mov	r1, #100
	str	r1, [r3, #28]
	mov	r1, #50
	str	r1, [r3, #40]
	mov	r1, #2048
	mov	r4, #0
	mov	r2, #3
	str	r1, [r3, #32]
	mov	r1, #1280
	str	r4, [r3, #16]
	str	r4, [r3, #20]
	str	r4, [r3, #100]
	str	r2, [r3, #64]
	str	r2, [r3, #68]
	str	r2, [r3, #72]
	str	r4, [r3, #80]
	str	r1, [r3, #36]
	ldr	r5, .L5+16
	ldr	r3, .L5+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L5+24
	ldr	r2, .L5+28
	str	r4, [r5, #0]
	mov	r4, #1
.L2:
	str	r4, [r3, #100]
	add	r3, r3, #104
	cmp	r3, r2
	bne	.L2
	ldr	r3, .L5+32
	mov	r0, #0
	mov	lr, pc
	bx	r3
	ldr	r3, .L5+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L5+40
	mov	r1, #50	@ movhi
	ldrh	r2, [r3, #0]
	mov	r3, #67108864
	strh	r1, [r3, #24]	@ movhi
	mov	r1, #0
	str	r1, [r5, #4]
	strh	r2, [r3, #26]	@ movhi
	ldr	r3, .L5+44
	str	r4, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L6:
	.align	2
.L5:
	.word	fillScreen4
	.word	flipPage
	.word	initGraphics
	.word	player
	.word	.LANCHOR0
	.word	hideSprites
	.word	enemies
	.word	enemies+5200
	.word	time
	.word	srand
	.word	.LANCHOR1
	.word	state
	.size	initializeGame, .-initializeGame
	.align	2
	.global	initializeDeath
	.type	initializeDeath, %function
initializeDeath:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #49920
	mov	r2, #11008
	stmfd	sp!, {r3, lr}
	add	r2, r2, #17
	mov	r3, #0
	ldr	r0, .L8
	add	r1, r1, #26
	ldr	ip, .L8+4
	mov	lr, pc
	bx	ip
	ldr	r3, .L8+8
	mov	r2, #5
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	fleshTear
	.word	playSoundA
	.word	state
	.size	initializeDeath, .-initializeDeath
	.align	2
	.global	death
	.type	death, %function
death:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L14
	stmfd	sp!, {r3, lr}
	ldr	r1, [r2, #8]
	mov	r3, #99328
	add	r3, r3, #672
	cmp	r1, r3
	addle	r1, r1, #1
	strle	r1, [r2, #8]
	bgt	.L13
.L10:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L13:
	ldr	r3, .L14+4
	mov	lr, pc
	bx	r3
	b	.L10
.L15:
	.align	2
.L14:
	.word	.LANCHOR0
	.word	initializeLose
	.size	death, .-death
	.align	2
	.global	draw
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L17
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r3, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	animate
	.size	draw, .-draw
	.align	2
	.global	playerInput
	.type	playerInput, %function
playerInput:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L51
	stmfd	sp!, {r4, r5}
	ldr	r3, [r1, #0]
	tst	r3, #1
	beq	.L47
	ldr	r3, .L51+4
	ldr	r3, [r3, #0]
	tst	r3, #1
	beq	.L44
.L47:
	ldr	r3, .L51+8
.L20:
	mov	r2, #67108864
	ldr	r0, [r2, #304]
	tst	r0, #32
	bne	.L21
	ldr	r0, .L51+12
	ldr	ip, [r0, #4]
	cmp	ip, #0
	ble	.L22
	ldr	r2, [r3, #4]
	ldr	r4, [r3, #56]
	mov	r5, r2, asr #8
	add	r4, r4, r4, lsr #31
	add	r4, r5, r4, asr #1
	cmp	r4, #119
	suble	ip, ip, #2
	strle	ip, [r0, #4]
	bgt	.L23
.L24:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	mov	r2, #4096
	str	r2, [r3, #52]
	ldrgt	r2, .L51+8
	movgt	r0, #0
	strgt	r0, [r2, #20]
.L25:
	ldr	r2, [r1, #0]
	tst	r2, #2
	beq	.L29
	ldr	r0, .L51+4
	ldr	r0, [r0, #0]
	tst	r0, #2
	beq	.L49
.L29:
	mov	r0, #67108864
	ldr	r0, [r0, #304]
	tst	r0, #32
	bne	.L32
	tst	r2, #512
	beq	.L32
	ldr	r0, .L51+4
	ldr	r0, [r0, #0]
	tst	r0, #512
	moveq	r1, #-1677721600
	moveq	r1, r1, asr #20
	streq	r1, [r3, #20]
	beq	.L33
.L32:
	mov	r2, #67108864
	ldr	r2, [r2, #304]
	tst	r2, #16
	beq	.L34
	ldr	r3, [r3, #20]
	ldr	r2, [r1, #0]
.L35:
	cmp	r3, #0
	ble	.L33
.L38:
	tst	r2, #256
	beq	.L19
	ldr	r3, .L51+4
	ldr	r3, [r3, #0]
	tst	r3, #256
	ldreq	r3, .L51+16
	moveq	r2, #1
	streq	r2, [r3, #20]
.L19:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L21:
	ldr	r2, [r2, #304]
	tst	r2, #16
	bne	.L25
	ldr	r0, .L51+12
	ldr	ip, [r0, #4]
	cmp	ip, #272
	ldrge	r2, [r3, #4]
	blt	.L50
.L27:
	add	r2, r2, #768
	str	r2, [r3, #4]
.L28:
	ldr	r0, [r3, #20]
	mov	r2, #0
	cmp	r0, r2
	ldrlt	r0, .L51+8
	str	r2, [r3, #52]
	strlt	r2, [r0, #20]
	b	.L25
.L34:
	ldr	r2, [r1, #0]
	tst	r2, #512
	beq	.L48
	ldr	r1, .L51+4
	ldr	r1, [r1, #0]
	tst	r1, #512
	bne	.L48
	mov	r1, #1600
	str	r1, [r3, #20]
	ldr	r3, .L51+16
	mov	r1, #1
	str	r1, [r3, #16]
	b	.L38
.L49:
	ldr	r0, [r3, #72]
	cmp	r0, #0
	ble	.L29
	mov	r0, #67108864
	ldr	r0, [r0, #304]
	tst	r0, #32
	moveq	r0, #-1677721600
	ldreq	ip, .L51+8
	moveq	r0, r0, asr #21
	streq	r0, [ip, #20]
	mov	r0, #67108864
	ldr	r0, [r0, #304]
	tst	r0, #16
	moveq	r0, #800
	streq	r0, [r3, #20]
	mov	r0, #1
	str	r0, [r3, #80]
	b	.L29
.L44:
	ldr	r2, .L51+16
	ldr	r0, [r2, #12]
	cmp	r0, #1
	bgt	.L47
	ldr	r3, .L51+8
	ldr	ip, [r3, #36]
	add	r0, r0, #1
	rsb	ip, ip, #0
	str	ip, [r3, #16]
	str	r0, [r2, #12]
	b	.L20
.L22:
	ldr	r2, [r3, #4]
.L23:
	sub	r2, r2, #768
	str	r2, [r3, #4]
	b	.L24
.L33:
	ldr	r3, .L51+16
	mov	r1, #0
	str	r1, [r3, #16]
	b	.L38
.L48:
	ldr	r3, [r3, #20]
	b	.L35
.L50:
	ldr	r2, [r3, #4]
	ldr	r4, [r3, #56]
	mov	r5, r2, asr #8
	add	r4, r4, r4, lsr #31
	add	r4, r5, r4, asr #1
	cmp	r4, #120
	addgt	ip, ip, #2
	strgt	ip, [r0, #4]
	bgt	.L28
	b	.L27
.L52:
	.align	2
.L51:
	.word	oldButtons
	.word	buttons
	.word	player
	.word	.LANCHOR1
	.word	.LANCHOR0
	.size	playerInput, .-playerInput
	.align	2
	.global	updatePlayer
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L73
	ldr	r0, .L73+4
	stmfd	sp!, {r4, r5}
	ldr	r2, [r0, #4]
	ldr	r4, [r3, #16]
	ldr	r5, [r3, #24]
	mov	r1, #508
	add	r1, r1, #2
	add	r4, r5, r4
	sub	r5, r2, #1
	cmp	r5, r1
	ldr	ip, [r3, #0]
	ldrls	r1, [r3, #20]
	ldrhi	r1, [r3, #4]
	add	ip, r4, ip
	str	r4, [r3, #16]
	ldrhi	r4, [r3, #20]
	addls	r2, r2, r1, asr #8
	addhi	r1, r4, r1
	strls	r2, [r0, #4]
	ldrls	r1, [r3, #4]
	ldr	r4, [r0, #0]
	ldr	r0, [r3, #80]
	strhi	r1, [r3, #4]
	add	r2, r1, r2, asl #8
	str	ip, [r3, #0]
	cmp	r0, #1
	add	ip, ip, r4, asl #8
	str	ip, [r3, #8]
	str	r2, [r3, #12]
	ldrne	r1, .L73+8
	beq	.L71
.L56:
	mov	r2, #0
	str	r2, [r3, #80]
	str	r2, [r1, #24]
.L57:
	ldr	r2, [r1, #28]
	ldr	r0, .L73+12
	smull	ip, r0, r2, r0
	mov	ip, r2, asr #31
	rsb	r0, ip, r0, asr #5
	add	r0, r0, r0, asl #2
	cmp	r2, r0, asl #4
	bne	.L58
	ldr	r2, [r3, #72]
	cmp	r2, #2
	ldrle	r0, .L73
	addle	r2, r2, #1
	strle	r2, [r0, #72]
.L58:
	ldr	r0, [r3, #0]
	mov	r0, r0, asr #8
	cmp	r0, #127
	ldr	r2, .L73
	ble	.L59
	mov	r0, #0
	mov	ip, #32768
	str	ip, [r2, #0]
	str	r0, [r2, #16]
	str	r0, [r1, #12]
.L60:
	ldr	r2, [r3, #4]
	mov	r2, r2, asr #8
	cmp	r2, #0
	ldr	r0, .L73
	movle	r2, #0
	strle	r2, [r0, #4]
	strle	r2, [r0, #20]
	ble	.L65
	cmp	r2, #206
	ldr	r2, [r0, #20]
	movgt	ip, #52992
	strgt	ip, [r0, #4]
	cmp	r2, #0
	blt	.L72
	ldrne	r0, [r3, #28]
	rsbne	r2, r0, r2
	strne	r2, [r3, #20]
.L65:
	ldr	r3, [r3, #40]
	cmp	r3, r2
	ble	.L66
	rsb	r3, r3, #0
	cmp	r3, r2
	bge	.L66
	ldr	r3, .L73
	mov	r2, #0
	str	r2, [r3, #20]
.L67:
	mov	r3, #0
	str	r3, [r1, #16]
	b	.L68
.L66:
	cmp	r2, #0
	ble	.L67
.L68:
	ldmfd	sp!, {r4, r5}
	b	playerInput
.L59:
	cmp	r0, #0
	movlt	r0, #0
	strlt	r0, [r2, #0]
	strlt	r0, [r2, #16]
	b	.L60
.L72:
	ldr	r0, [r3, #28]
	add	r2, r2, r0
	str	r2, [r3, #20]
	b	.L65
.L71:
	ldr	r1, .L73+8
	ldr	r2, [r1, #24]
	cmp	r2, #19
	addle	r2, r2, #1
	strle	r2, [r1, #24]
	ble	.L57
	b	.L56
.L74:
	.align	2
.L73:
	.word	player
	.word	.LANCHOR1
	.word	.LANCHOR0
	.word	1717986919
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	dash
	.type	dash, %function
dash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r0, r0, r0, asl #2
	add	r0, r0, r0, asl #2
	ldr	r3, .L76
	mov	r0, r0, asl #6
	str	r0, [r3, #20]
	bx	lr
.L77:
	.align	2
.L76:
	.word	player
	.size	dash, .-dash
	.align	2
	.global	createEnemy
	.type	createEnemy, %function
createEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r4, .L89
	mov	lr, pc
	bx	r4
	mov	r5, r0
	mov	lr, pc
	bx	r4
	ldr	r3, .L89+4
	ldr	r3, [r3, #0]
	cmp	r3, #49
	bgt	.L78
	ldr	ip, .L89+8
	mov	r3, #0
	mov	r2, ip
	b	.L87
.L80:
	add	r3, r3, #1
	cmp	r3, #50
	add	r2, r2, #104
	beq	.L78
.L87:
	ldr	r1, [r2, #100]
	cmp	r1, #0
	beq	.L80
	ldr	r6, .L89+12
	smull	r2, r6, r0, r6
	mov	r1, r0, asr #31
	mov	r4, r3, asl #1
	rsb	r1, r1, r6, asr #1
	add	r2, r4, r3
	add	r6, r1, r1, asl #2
	add	r2, r3, r2, asl #2
	add	r2, ip, r2, asl #3
	rsb	r0, r6, r0
	mov	r6, #150
	mov	r1, #0
	str	r6, [r2, #24]
	mov	r6, #100
	str	r1, [r2, #16]
	str	r1, [r2, #20]
	str	r6, [r2, #28]
	str	r1, [r2, #100]
	mov	r6, #50
	mov	r1, #32768
	str	r6, [r2, #40]
	str	r1, [r2, #48]
	cmp	r0, #4
	ldrls	pc, [pc, r0, asl #2]
	b	.L81
.L85:
	.word	.L82
	.word	.L82
	.word	.L82
	.word	.L83
	.word	.L84
.L84:
	add	r2, r4, r3
	add	r2, r3, r2, asl #2
	add	r2, ip, r2, asl #3
	mov	r1, #32
	str	r1, [r2, #56]
	mov	r1, #16
	str	r1, [r2, #60]
	mov	r1, #25600
	str	r1, [r2, #8]
	mov	r1, #16384
	str	r1, [r2, #44]
	mov	r1, #2
	str	r1, [r2, #64]
.L81:
	mov	r2, r5, lsr #31
	add	r5, r5, r2
	add	r4, r4, r3
	add	r3, r3, r4, asl #2
	and	r5, r5, #1
	add	ip, ip, r3, asl #3
	rsb	r2, r2, r5
	mov	r3, #2048
	cmp	r2, #1
	str	r3, [ip, #32]
	mov	r3, #2304
	str	r3, [ip, #36]
	moveq	r3, #0
	movne	r3, #131072
	streq	r3, [ip, #12]
	strne	r3, [ip, #12]
.L78:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L83:
	add	r2, r4, r3
	add	r2, r3, r2, asl #2
	add	r2, ip, r2, asl #3
	mov	r1, #32
	str	r1, [r2, #56]
	mov	r1, #16
	str	r1, [r2, #60]
	mov	r1, #25600
	str	r1, [r2, #8]
	mov	r1, #16384
	str	r1, [r2, #44]
	mov	r1, #1
	str	r1, [r2, #64]
	b	.L81
.L82:
	add	r2, r4, r3
	add	r2, r3, r2, asl #2
	add	r2, ip, r2, asl #3
	mov	r1, #16
	str	r1, [r2, #56]
	mov	r1, #32
	str	r1, [r2, #60]
	mov	r1, #25600
	str	r1, [r2, #8]
	mov	r1, #32768
	str	r1, [r2, #44]
	mov	r1, #0
	str	r1, [r2, #64]
	b	.L81
.L90:
	.align	2
.L89:
	.word	rand
	.word	.LANCHOR0
	.word	enemies
	.word	1717986919
	.size	createEnemy, .-createEnemy
	.align	2
	.global	spawner
	.type	spawner, %function
spawner:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L95
	ldr	r3, [r4, #32]
	cmp	r3, #30
	beq	.L94
.L92:
	add	r3, r3, #1
	str	r3, [r4, #32]
.L91:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L94:
	ldr	r2, [r4, #0]
	cmp	r2, #49
	bgt	.L92
	mov	r3, #0
	str	r3, [r4, #32]
	bl	createEnemy
	ldr	r3, [r4, #0]
	add	r3, r3, #1
	str	r3, [r4, #0]
	b	.L91
.L96:
	.align	2
.L95:
	.word	.LANCHOR0
	.size	spawner, .-spawner
	.align	2
	.global	tiltedManAI
	.type	tiltedManAI, %function
tiltedManAI:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	ldr	r2, .L105
	ldr	r1, [r0, #60]
	ldr	r3, [r0, #8]
	mov	r4, r0
	ldr	r7, [r0, #16]
	rsb	r6, r1, #160
	ldr	r0, [r2, #0]
	cmp	r6, r3, asr #8
	rsbge	r1, r1, #164
	ldr	r2, [r2, #4]
	sub	r0, r3, r0, asl #8
	ldr	ip, [r4, #24]
	ldr	r5, [r4, #12]
	ldr	r3, [r4, #20]
	movge	r1, r1, asl #8
	add	ip, r7, ip
	sub	r2, r5, r2, asl #8
	strge	r1, [r4, #8]
	cmp	r3, #0
	str	ip, [r4, #16]
	stmia	r4, {r0, r2}	@ phole stm
	blt	.L103
	ldrne	r2, [r4, #28]
	rsbne	r3, r2, r3
	strne	r3, [r4, #20]
.L100:
	ldr	r6, .L105+4
	ldr	r3, [r6, #12]
	cmp	r5, r3
	bgt	.L104
.L101:
	cmp	r5, r3
	bge	.L97
	ldr	r3, .L105+8
	mov	lr, pc
	bx	r3
	add	r3, r0, r0, lsr #31
	and	r3, r3, #1
	sub	r3, r3, r0, lsr #31
	add	r5, r5, r3, asl #8
	mov	r3, #0
	str	r5, [r4, #12]
	str	r3, [r4, #52]
.L97:
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L104:
	ldr	r3, .L105+8
	mov	lr, pc
	bx	r3
	add	r3, r0, r0, lsr #31
	and	r3, r3, #1
	sub	r3, r3, r0, lsr #31
	sub	r5, r5, r3, asl #8
	str	r5, [r4, #12]
	mov	r3, #4096
	str	r3, [r4, #52]
	ldr	r3, [r6, #12]
	b	.L101
.L103:
	ldr	r2, [r4, #28]
	add	r3, r2, r3
	str	r3, [r4, #20]
	b	.L100
.L106:
	.align	2
.L105:
	.word	.LANCHOR1
	.word	player
	.word	rand
	.size	tiltedManAI, .-tiltedManAI
	.align	2
	.global	amalgamAI
	.type	amalgamAI, %function
amalgamAI:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	mov	r4, r0
	ldr	ip, [r4, #60]
	ldr	r1, [r4, #8]
	ldr	r0, .L126
	rsb	r7, ip, #160
	cmp	r7, r1, asr #8
	ldr	r2, [r4, #20]
	ldr	r5, [r4, #12]
	ldr	r3, [r4, #16]
	ldmia	r0, {r6, r8}	@ phole ldm
	rsbge	ip, ip, #164
	movge	ip, ip, asl #8
	add	sl, r3, r1
	add	r0, r2, r5
	sub	r6, sl, r6, asl #8
	sub	r0, r0, r8, asl #8
	strge	ip, [r4, #8]
	cmp	r2, #0
	str	r6, [r4, #0]
	str	r0, [r4, #4]
	blt	.L120
	ldrne	r1, [r4, #28]
	rsbne	r2, r1, r2
	strne	r2, [r4, #20]
.L110:
	cmp	r3, #0
	blt	.L121
	ldrne	r2, [r4, #28]
	rsbne	r3, r2, r3
	strne	r3, [r4, #16]
.L112:
	ldr	r6, .L126+4
	ldr	r3, [r6, #12]
	ldr	r0, [r4, #56]
	mov	r2, r3, asr #8
	mov	r1, r5, asr #8
	sub	ip, r2, #99
	add	r0, r1, r0
	cmp	ip, r0
	mov	r7, r5
	ldrgt	ip, [r6, #56]
	bgt	.L114
	ldr	ip, [r6, #56]
	add	r8, r2, ip
	cmp	r0, r8
	bge	.L114
.L115:
	cmp	r3, r5
	blt	.L122
.L117:
	cmp	r3, r7
	bgt	.L123
.L107:
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	bx	lr
.L114:
	add	r0, r2, #99
	add	ip, r0, ip
	cmp	r1, ip
	bgt	.L116
	cmp	r2, r1
	blt	.L115
.L116:
	cmp	r3, r5
	blt	.L124
	cmp	r7, r3
	bge	.L107
.L125:
	ldr	r3, .L126+8
	mov	lr, pc
	bx	r3
	add	r3, r0, r0, lsr #31
	and	r3, r3, #1
	sub	r3, r3, r0, lsr #31
	add	r7, r7, r3, asl #8
	mov	r3, #0
	str	r7, [r4, #12]
	str	r3, [r4, #52]
	b	.L107
.L121:
	ldr	r2, [r4, #24]
	add	r3, r2, r3
	str	r3, [r4, #16]
	b	.L112
.L120:
	ldr	r1, [r4, #28]
	add	r2, r1, r2
	str	r2, [r4, #20]
	b	.L110
.L124:
	ldr	r3, .L126+8
	mov	lr, pc
	bx	r3
	add	r7, r0, r0, lsr #31
	and	r7, r7, #1
	sub	r7, r7, r0, lsr #31
	sub	r7, r5, r7, asl #8
	str	r7, [r4, #12]
	mov	r3, #4096
	str	r3, [r4, #52]
	ldr	r3, [r6, #12]
	cmp	r7, r3
	bge	.L107
	b	.L125
.L123:
	ldr	r3, .L126+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L126+12
	smull	r2, r3, r0, r3
	mov	r2, r0, asr #31
	rsb	r3, r2, r3, asr #1
	add	r3, r3, r3, asl #2
	rsb	r0, r3, r0
	add	r7, r7, r0, asl #8
	mov	r3, #0
	str	r7, [r4, #12]
	str	r3, [r4, #52]
	b	.L107
.L122:
	ldr	r3, .L126+8
	mov	lr, pc
	bx	r3
	ldr	r7, .L126+12
	smull	r2, r7, r0, r7
	mov	r3, r0, asr #31
	rsb	r7, r3, r7, asr #1
	add	r7, r7, r7, asl #2
	rsb	r7, r7, r0
	sub	r7, r5, r7, asl #8
	str	r7, [r4, #12]
	mov	r3, #4096
	str	r3, [r4, #52]
	ldr	r3, [r6, #12]
	b	.L117
.L127:
	.align	2
.L126:
	.word	.LANCHOR1
	.word	player
	.word	rand
	.word	1717986919
	.size	amalgamAI, .-amalgamAI
	.align	2
	.global	voidFlyerAI
	.type	voidFlyerAI, %function
voidFlyerAI:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r3, .L142
	ldr	r1, [r0, #8]
	ldr	r2, [r0, #60]
	ldr	r7, [r3, #0]
	ldr	r6, [r3, #4]
	rsb	ip, r2, #110
	mov	r3, r1, asr #8
	mov	r4, r0
	cmp	r3, ip
	ldr	r8, [r0, #16]
	ldr	r0, [r0, #24]
	movle	r3, ip, asl #8
	sub	r1, r1, r7, asl #8
	strle	r3, [r4, #8]
	add	r0, r8, r0
	movle	r3, r3, asr #8
	str	r1, [r4, #0]
	rsb	r2, r2, #160
	movle	r1, #0
	str	r0, [r4, #16]
	ldr	r5, [r4, #12]
	ldr	r0, [r4, #20]
	strle	r1, [r4, #16]
	cmp	r2, r3
	movlt	r3, #1
	sub	r6, r5, r6, asl #8
	strlt	r3, [r4, #100]
	cmp	r0, #0
	str	r6, [r4, #4]
	blt	.L139
	ldrne	r3, [r4, #28]
	rsbne	r0, r3, r0
	strne	r0, [r4, #20]
.L132:
	ldr	r6, .L142+4
	ldr	r0, [r4, #56]
	ldr	r3, [r6, #12]
	mov	r1, r5, asr #8
	add	r0, r1, r0
	mov	r2, r3, asr #8
	cmp	r0, r2
	bgt	.L133
	ldr	ip, [r6, #56]
	add	ip, r2, ip
.L134:
	cmp	r1, ip
	bge	.L136
	cmp	r1, r2
	bgt	.L135
.L136:
	cmp	r5, r3
	bgt	.L140
	cmp	r5, r3
	blt	.L141
.L128:
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L133:
	ldr	ip, [r6, #56]
	add	ip, r2, ip
	cmp	r0, ip
	bge	.L134
.L135:
	ldr	r3, [r4, #8]
	add	r3, r3, #768
	str	r3, [r4, #8]
	b	.L128
.L141:
	ldr	r3, .L142+8
	mov	lr, pc
	bx	r3
	add	r3, r0, r0, lsr #31
	and	r3, r3, #1
	sub	r3, r3, r0, lsr #31
	add	r5, r5, r3, asl #8
	mov	r3, #0
	str	r5, [r4, #12]
	str	r3, [r4, #52]
	b	.L128
.L139:
	ldr	r3, [r4, #28]
	add	r0, r3, r0
	str	r0, [r4, #20]
	b	.L132
.L140:
	ldr	r3, .L142+8
	mov	lr, pc
	bx	r3
	add	r3, r0, r0, lsr #31
	and	r3, r3, #1
	sub	r3, r3, r0, lsr #31
	sub	r5, r5, r3, asl #8
	str	r5, [r4, #12]
	mov	r3, #4096
	str	r3, [r4, #52]
	ldr	r3, [r6, #12]
	cmp	r5, r3
	bge	.L128
	b	.L141
.L143:
	.align	2
.L142:
	.word	.LANCHOR1
	.word	player
	.word	rand
	.size	voidFlyerAI, .-voidFlyerAI
	.align	2
	.global	enemyCollisions
	.type	enemyCollisions, %function
enemyCollisions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L164
	stmfd	sp!, {r4, r5}
	ldr	r2, [r3, #80]
	cmp	r2, #0
	beq	.L160
	ldr	r2, [r3, #52]
	cmp	r2, #0
	beq	.L161
	ldr	r2, [r3, #12]
	ldr	r1, [r0, #12]
	mov	r2, r2, asr #8
	mov	r1, r1, asr #8
.L147:
	ldr	r4, [r0, #56]
	sub	ip, r2, #2
	add	r1, r1, r4
	cmp	ip, r1
	bgt	.L160
	ldr	ip, [r3, #56]
	add	r2, r2, ip
	cmp	r1, r2
	blt	.L157
.L160:
	ldr	r2, .L164+4
.L145:
	ldr	r1, [r2, #36]
	cmp	r1, #1
	ldr	r1, .L164+4
	beq	.L162
.L148:
	ldr	r1, [r0, #100]
	cmp	r1, #0
	bne	.L144
	ldr	r1, [r3, #80]
	cmp	r1, #0
	ldr	ip, .L164
	bne	.L144
	ldr	r4, [ip, #20]
	cmp	r4, #0
	ble	.L163
.L144:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L161:
	ldr	r2, [r3, #12]
	ldr	ip, [r3, #56]
	ldr	r1, [r0, #12]
	mov	r2, r2, asr #8
	add	ip, ip, #2
	mov	r1, r1, asr #8
	add	ip, ip, r2
	cmp	ip, r1
	blt	.L147
	cmp	r2, r1
	bge	.L147
	ldr	ip, [r0, #8]
	ldr	r4, [r3, #8]
	mov	ip, ip, asr #8
	rsb	ip, ip, r4, asr #8
	add	ip, ip, #19
	cmp	ip, #38
	bhi	.L147
	ldr	r2, .L164+4
	ldr	ip, [r2, #0]
	mov	r1, #-2097152000
	sub	ip, ip, #1
	mov	r1, r1, asr #21
	mov	r4, #1
	str	r4, [r0, #100]
	str	ip, [r2, #0]
	str	r1, [r0, #20]
	b	.L145
.L162:
	ldr	ip, [r1, #40]
	cmp	ip, #199
	addle	ip, ip, #1
	strle	ip, [r1, #40]
	bgt	.L148
	b	.L144
.L163:
	ldr	r4, [ip, #8]
	ldr	r5, [r0, #8]
	mov	r4, r4, asr #8
	rsb	r4, r4, r5, asr #8
	add	r4, r4, #29
	cmp	r4, #58
	ldr	r5, .L164+4
	str	r1, [r2, #36]
	str	r1, [r2, #40]
	bhi	.L144
	ldr	r4, [ip, #12]
	ldr	r1, [r0, #12]
	mov	r0, r4, asr #8
	add	r4, r0, #9
	mov	r1, r1, asr #8
	cmp	r4, r1
	blt	.L150
	cmp	r0, r1
	bge	.L150
	ldr	r3, [r5, #20]
	cmp	r3, #0
	bne	.L144
	ldr	r1, [ip, #68]
	mov	r2, #-2097152000
	mov	r3, r2
	mov	r3, r3, asr #22
	mov	r2, r2, asr #21
	sub	r1, r1, #1
	mov	r0, #1
	str	r0, [r5, #36]
	str	r2, [ip, #20]
	str	r3, [ip, #16]
	str	r1, [ip, #68]
	b	.L144
.L157:
	ldr	r1, .L164
	ldr	r2, [r0, #8]
	ldr	r1, [r1, #8]
	mov	r2, r2, asr #8
	rsb	r2, r2, r1, asr #8
	add	r2, r2, #19
	cmp	r2, #38
	bhi	.L160
	ldr	r2, .L164+4
	ldr	r1, [r2, #0]
	sub	r1, r1, #1
	mov	ip, #1
	str	r1, [r2, #0]
	mov	r1, #1000
	str	ip, [r0, #100]
	str	r1, [r0, #20]
	b	.L145
.L150:
	add	ip, r1, #3
	cmp	r0, ip
	bgt	.L144
	cmp	r4, r1
	blt	.L144
	ldr	r2, [r2, #20]
	cmp	r2, #0
	bne	.L144
	ldr	r1, [r3, #68]
	ldr	r0, .L164+4
	mov	r2, #-2097152000
	mov	ip, #1
	mov	r2, r2, asr #22
	sub	r1, r1, #1
	str	ip, [r0, #36]
	mov	r0, #1000
	str	r0, [r3, #20]
	str	r2, [r3, #16]
	str	r1, [r3, #68]
	b	.L144
.L165:
	.align	2
.L164:
	.word	player
	.word	.LANCHOR0
	.size	enemyCollisions, .-enemyCollisions
	.align	2
	.global	updateEnemies
	.type	updateEnemies, %function
updateEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	ldr	r7, .L177
	bl	spawner
	mov	r4, #0
	mov	r5, r7
	b	.L173
.L176:
	cmp	r3, #2
	beq	.L171
	cmp	r3, #0
	movne	r6, r4, asl #1
	bne	.L172
	mov	r6, r4, asl #1
	add	r0, r6, r4
	add	r0, r4, r0, asl #2
	add	r0, r7, r0, asl #3
	bl	tiltedManAI
.L172:
	add	r6, r6, r4
	add	r0, r4, r6, asl #2
	add	r0, r7, r0, asl #3
	bl	enemyCollisions
.L167:
	add	r4, r4, #1
	cmp	r4, #50
	add	r5, r5, #104
	beq	.L175
.L173:
	ldr	r3, [r5, #100]
	cmp	r3, #0
	bne	.L167
	ldr	r3, [r5, #64]
	cmp	r3, #1
	bne	.L176
	mov	r6, r4, asl #1
	add	r0, r6, r4
	add	r0, r4, r0, asl #2
	add	r0, r7, r0, asl #3
	bl	amalgamAI
	b	.L172
.L171:
	mov	r6, r4, asl #1
	add	r0, r6, r4
	add	r0, r4, r0, asl #2
	add	r0, r7, r0, asl #3
	bl	voidFlyerAI
	b	.L172
.L175:
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L178:
	.align	2
.L177:
	.word	enemies
	.size	updateEnemies, .-updateEnemies
	.align	2
	.global	update
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	bl	updatePlayer
	bl	updateEnemies
	ldr	r0, .L185
	ldr	r3, [r0, #4]
	cmp	r3, #0
	ble	.L184
	cmp	r3, #272
	bge	.L182
	ldr	r4, .L185+4
	smull	r1, r4, r3, r4
	sub	r4, r4, r3, asr #31
	mov	r6, r3, asl #16
	mov	r4, r4, asl #16
	mov	r3, r3, asl #15
	mov	r6, r6, lsr #16
	mov	r5, r3, lsr #16
	mov	r4, r4, lsr #16
.L181:
	ldr	ip, .L185+8
	ldr	r1, .L185+12
	ldr	r2, [ip, #28]
	smull	r3, r1, r2, r1
	mov	r3, r2, asr #31
	rsb	r1, r3, r1, asr #6
	rsb	r3, r1, r1, asl #5
	add	r1, r1, r3, asl #2
	cmp	r2, r1, asl #3
	ldrne	r3, [ip, #44]
	addne	r3, r3, #1
	strne	r3, [ip, #44]
	ldr	r2, .L185+4
	ldr	r3, [r0, #0]
	smull	r1, r2, r3, r2
	add	r1, r3, r3, lsr #31
	sub	r2, r2, r3, asr #31
	mov	r0, r3, asl #16
	mov	r1, r1, asl #15
	mov	r2, r2, asl #16
	mov	r3, #67108864
	mov	r0, r0, lsr #16
	mov	r1, r1, lsr #16
	mov	r2, r2, lsr #16
	strh	r6, [r3, #16]	@ movhi
	strh	r0, [r3, #18]	@ movhi
	strh	r5, [r3, #20]	@ movhi
	strh	r1, [r3, #22]	@ movhi
	strh	r4, [r3, #24]	@ movhi
	strh	r2, [r3, #26]	@ movhi
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L182:
	mov	r6, #272
	str	r6, [r0, #4]
	mov	r4, #90
	mov	r5, #136
	b	.L181
.L184:
	mov	r3, #0
	mov	r4, r3
	str	r3, [r0, #4]
	mov	r5, r3
	mov	r6, r3
	b	.L181
.L186:
	.align	2
.L185:
	.word	.LANCHOR1
	.word	1431655766
	.word	.LANCHOR0
	.word	274877907
	.size	update, .-update
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L194
	ldr	r3, [r4, #48]
	cmp	r3, #0
	beq	.L191
	ldr	r3, .L194+4
	ldr	r3, [r3, #68]
	cmp	r3, #0
	ble	.L192
.L189:
	ldr	r3, .L194+8
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L187
	ldr	r3, .L194+12
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L193
.L187:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L193:
	ldr	r3, .L194+16
	mov	lr, pc
	bx	r3
	b	.L187
.L191:
	bl	update
	ldr	r3, .L194+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L194+24
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #28]
	add	r3, r3, #1
	str	r3, [r4, #28]
	ldr	r3, .L194+4
	ldr	r3, [r3, #68]
	cmp	r3, #0
	bgt	.L189
.L192:
	bl	initializeDeath
	b	.L189
.L195:
	.align	2
.L194:
	.word	.LANCHOR0
	.word	player
	.word	oldButtons
	.word	buttons
	.word	initializePause
	.word	waitForVblank
	.word	animate
	.size	game, .-game
	.global	__aeabi_idivmod
	.align	2
	.global	getRand
	.type	getRand, %function
getRand:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r5, r1
	ldr	r3, .L197
	mov	r4, r0
	mov	lr, pc
	bx	r3
	mov	r1, r5
	ldr	r3, .L197+4
	mov	lr, pc
	bx	r3
	add	r0, r1, r4
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L198:
	.align	2
.L197:
	.word	rand
	.word	__aeabi_idivmod
	.size	getRand, .-getRand
	.global	hOff
	.global	vOff
	.global	isOver
	.global	isCheat
	.global	attackTimer
	.global	hitTimer
	.global	isDash
	.global	isHit
	.global	jumpCount
	.global	coolDown
	.global	frameCount
	.global	enemyTimer
	.global	enemyCount
	.global	enemyMultiplier
	.global	deathTimer
	.global	score
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.comm	player,104,4
	.comm	enemies,5200,4
	.comm	state,4,4
	.comm	sbb,4,4
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.word	20
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.word	136
	.type	coolDown, %object
	.size	coolDown, 4
coolDown:
	.word	20
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	enemyCount, %object
	.size	enemyCount, 4
enemyCount:
	.space	4
	.type	score, %object
	.size	score, 4
score:
	.space	4
	.type	deathTimer, %object
	.size	deathTimer, 4
deathTimer:
	.space	4
	.type	jumpCount, %object
	.size	jumpCount, 4
jumpCount:
	.space	4
	.type	isDash, %object
	.size	isDash, 4
isDash:
	.space	4
	.type	isCheat, %object
	.size	isCheat, 4
isCheat:
	.space	4
	.type	attackTimer, %object
	.size	attackTimer, 4
attackTimer:
	.space	4
	.type	frameCount, %object
	.size	frameCount, 4
frameCount:
	.space	4
	.type	enemyTimer, %object
	.size	enemyTimer, 4
enemyTimer:
	.space	4
	.type	isHit, %object
	.size	isHit, 4
isHit:
	.space	4
	.type	hitTimer, %object
	.size	hitTimer, 4
hitTimer:
	.space	4
	.type	enemyMultiplier, %object
	.size	enemyMultiplier, 4
enemyMultiplier:
	.space	4
	.type	isOver, %object
	.size	isOver, 4
isOver:
	.space	4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
