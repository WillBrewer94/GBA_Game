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
	.file	"game.c"
	.text
	.align	2
	.global	initializeGame
	.type	initializeGame, %function
initializeGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	r0, #0
	ldr	r4, .L2
	mov	lr, pc
	bx	r4
	ldr	r3, .L2+4
	mov	lr, pc
	bx	r3
	mov	r0, #0
	mov	lr, pc
	bx	r4
	ldr	r4, .L2+8
	mov	r2, #0
	str	r2, [r4, #24]
	str	r2, [r4, #28]
	mov	r0, r2
	mov	r1, #20480
	mov	r2, #150
	str	r1, [r4, #0]
	str	r2, [r4, #40]
	mov	r1, #30720
	mov	r2, #100
	str	r1, [r4, #4]
	str	r2, [r4, #44]
	mov	r1, #32
	mov	r2, #50
	mov	r3, #1024
	str	r1, [r4, #16]
	str	r2, [r4, #56]
	mov	r1, #16
	mov	r2, #67108864
	add	r3, r3, #3
	str	r1, [r4, #20]
	strh	r3, [r2, #0]	@ movhi
	ldr	r3, .L2+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L2+16
	mov	lr, pc
	bx	r3
	mov	r3, #2048
	str	r3, [r4, #48]
	mov	r3, #2304
	str	r3, [r4, #52]
	ldr	r3, .L2+20
	mov	r2, #1
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	fillScreen4
	.word	flipPage
	.word	player
	.word	time
	.word	srand
	.word	state
	.size	initializeGame, .-initializeGame
	.align	2
	.global	erase
	.type	erase, %function
erase:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	r3, .L5
	sub	sp, sp, #12
	add	r0, r3, #60
	ldmia	r0, {r0, r1}	@ phole ldm
	mov	ip, #0
	ldr	r2, [r3, #16]
	mov	r0, r0, asr #8
	ldr	r3, [r3, #20]
	mov	r1, r1, asr #8
	str	ip, [sp, #0]
	ldr	ip, .L5+4
	mov	lr, pc
	bx	ip
	add	sp, sp, #12
	ldr	lr, [sp], #4
	bx	lr
.L6:
	.align	2
.L5:
	.word	player
	.word	drawRect3
	.size	erase, .-erase
	.align	2
	.global	drawPlayer
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L8
	sub	sp, sp, #8
	ldmia	r3, {r0, r1}	@ phole ldm
	ldr	r2, [r3, #16]
	mov	ip, #31
	ldr	r3, [r3, #20]
	mov	r0, r0, asr #8
	mov	r1, r1, asr #8
	ldr	r4, .L8+4
	str	ip, [sp, #0]
	mov	lr, pc
	bx	r4
	mov	ip, #32512
	add	ip, ip, #255
	mov	r0, #144
	mov	r1, #0
	mov	r2, #240
	mov	r3, #16
	str	ip, [sp, #0]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	ldmfd	sp!, {r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	player
	.word	drawRect3
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawEnemies
	.type	drawEnemies, %function
drawEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r3, .L15
	sub	sp, sp, #8
	ldr	r4, [r3, #0]
	cmp	r4, #0
	beq	.L10
	ldr	r6, .L15+4
	mov	r5, #31744
.L12:
	ldmia	r4, {r0, r1}	@ phole ldm
	add	r2, r4, #16
	ldmia	r2, {r2, r3}	@ phole ldm
	mov	r0, r0, asr #8
	mov	r1, r1, asr #8
	str	r5, [sp, #0]
	mov	lr, pc
	bx	r6
	ldr	r4, [r4, #64]
	cmp	r4, #0
	bne	.L12
.L10:
	add	sp, sp, #8
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L16:
	.align	2
.L15:
	.word	.LANCHOR0
	.word	drawRect3
	.size	drawEnemies, .-drawEnemies
	.align	2
	.global	draw
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	bl	erase
	bl	drawPlayer
	ldmfd	sp!, {r4, lr}
	b	drawEnemies
	.size	draw, .-draw
	.align	2
	.global	playerInput
	.type	playerInput, %function
playerInput:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L33
	stmfd	sp!, {r4, r5}
	ldr	r3, [r2, #0]
	cmp	r3, #0
	beq	.L19
	ldr	r3, .L33+4
	ldr	r0, .L33+8
	ldr	r1, [r3, #4]
	ldr	r0, [r0, #0]
	cmp	r1, r0
	addlt	r1, r1, #1
	movge	r3, #0
	strlt	r1, [r3, #4]
	strge	r3, [r2, #0]
.L18:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L19:
	ldr	r1, .L33+12
	ldr	ip, [r1, #0]
	ldr	r0, .L33+4
	tst	ip, #1
	str	r3, [r0, #4]
	beq	.L22
	ldr	r3, .L33+16
	ldr	r3, [r3, #0]
	tst	r3, #1
	bne	.L22
	ldr	r3, [r0, #8]
	cmp	r3, #1
	ble	.L31
.L22:
	mov	ip, #67108864
	ldr	r3, [ip, #304]
	mvn	r3, r3
	ands	r3, r3, #32
	beq	.L23
	ldr	r3, .L33+20
	ldr	ip, [r3, #4]
	ldr	r4, [r3, #28]
	sub	ip, ip, #768
	cmp	r4, #0
	str	ip, [r3, #4]
	movgt	ip, #0
	strgt	ip, [r3, #28]
.L24:
	ldr	r3, [r1, #0]
	tst	r3, #2
	beq	.L25
	ldr	ip, .L33+16
	ldr	ip, [ip, #0]
	tst	ip, #2
	beq	.L32
.L25:
	mov	r2, #67108864
	ldr	r2, [r2, #304]
	tst	r2, #32
	bne	.L28
	tst	r3, #512
	beq	.L28
	ldr	r2, .L33+16
	ldr	r2, [r2, #0]
	tst	r2, #512
	bne	.L28
	mvn	r2, #2992
	ldr	r1, .L33+20
	sub	r2, r2, #7
	str	r2, [r1, #28]
.L29:
	tst	r3, #256
	beq	.L18
	ldr	r3, .L33+16
	ldr	r3, [r3, #0]
	tst	r3, #256
	bne	.L18
	ldr	r3, [r0, #8]
	cmp	r3, #0
	ldrgt	r3, .L33+20
	movgt	r2, #3840
	strgt	r2, [r3, #24]
	b	.L18
.L23:
	ldr	ip, [ip, #304]
	tst	ip, #16
	bne	.L24
	ldr	ip, .L33+20
	ldr	r4, [ip, #4]
	ldr	r5, [ip, #28]
	add	r4, r4, #768
	cmp	r5, #0
	str	r4, [ip, #4]
	strlt	r3, [ip, #28]
	b	.L24
.L28:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	ldrne	r3, [r1, #0]
	bne	.L29
	ldr	r3, [r1, #0]
	tst	r3, #512
	beq	.L29
	ldr	r2, .L33+16
	ldr	r2, [r2, #0]
	tst	r2, #512
	moveq	r2, #2992
	ldreq	r1, .L33+20
	addeq	r2, r2, #8
	streq	r2, [r1, #28]
	b	.L29
.L32:
	mov	ip, #67108864
	ldr	ip, [ip, #304]
	tst	ip, #32
	mvneq	ip, #1488
	ldreq	r4, .L33+20
	subeq	ip, ip, #11
	streq	ip, [r4, #28]
	mov	ip, #67108864
	ldr	ip, [ip, #304]
	tst	ip, #16
	moveq	ip, #1488
	ldreq	r4, .L33+20
	addeq	ip, ip, #12
	streq	ip, [r4, #28]
	mov	ip, #1
	str	ip, [r2, #0]
	b	.L25
.L31:
	ldr	ip, .L33+20
	ldr	r4, [ip, #52]
	add	r3, r3, #1
	rsb	r4, r4, #0
	str	r4, [ip, #24]
	str	r3, [r0, #8]
	b	.L22
.L34:
	.align	2
.L33:
	.word	isAttack
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	oldButtons
	.word	buttons
	.word	player
	.size	playerInput, .-playerInput
	.align	2
	.global	updatePlayer
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L44
	stmfd	sp!, {r4, r5, r6, r7}
	ldr	r2, [r3, #24]
	ldr	r4, [r3, #40]
	ldr	r6, [r3, #0]
	add	r4, r4, r2
	ldr	r7, [r3, #20]
	ldr	r5, [r3, #4]
	add	ip, r4, r6
	ldr	r2, [r3, #28]
	mov	r1, ip, asr #8
	rsb	r7, r7, #143
	add	r0, r2, r5
	cmp	r1, r7
	str	r6, [r3, #60]
	str	r5, [r3, #64]
	str	r4, [r3, #24]
	str	ip, [r3, #0]
	str	r0, [r3, #4]
	blt	.L36
	ldr	r4, .L44+4
	mov	ip, #0
	mov	r1, r7, asl #8
	str	ip, [r3, #24]
	str	ip, [r4, #8]
	str	r1, [r3, #0]
	mov	r1, r1, asr #8
.L36:
	cmp	r1, #0
	movlt	r1, #0
	strlt	r1, [r3, #0]
	strlt	r1, [r3, #24]
	mov	r1, r0, asr #8
	ldr	r0, [r3, #16]
	cmp	r1, #0
	movle	r1, #0
	rsb	r0, r0, #239
	movle	r2, r1
	strle	r1, [r3, #4]
	strle	r1, [r3, #28]
	cmp	r0, r1
	ldrle	r1, .L44
	movle	r0, r0, asl #8
	strle	r0, [r1, #4]
	cmp	r2, #0
	blt	.L43
	ldrne	r1, [r3, #44]
	rsbne	r2, r1, r2
	strne	r2, [r3, #28]
.L41:
	ldr	r3, [r3, #56]
	cmp	r3, r2
	ble	.L42
	rsb	r3, r3, #0
	cmp	r2, r3
	ldrgt	r3, .L44
	movgt	r2, #0
	strgt	r2, [r3, #28]
.L42:
	ldmfd	sp!, {r4, r5, r6, r7}
	b	playerInput
.L43:
	ldr	r1, [r3, #44]
	add	r2, r2, r1
	str	r2, [r3, #28]
	b	.L41
.L45:
	.align	2
.L44:
	.word	player
	.word	.LANCHOR0
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	update
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	updatePlayer
	.size	update, .-update
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L52
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq	.L50
.L48:
	ldr	r3, .L52+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L47
	ldr	r3, .L52+8
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L51
.L47:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L51:
	ldr	r3, .L52+12
	mov	lr, pc
	bx	r3
	b	.L47
.L50:
	bl	updatePlayer
	ldr	r3, .L52+16
	mov	lr, pc
	bx	r3
	bl	draw
	b	.L48
.L53:
	.align	2
.L52:
	.word	.LANCHOR0
	.word	oldButtons
	.word	buttons
	.word	initializePause
	.word	waitForVblank
	.size	game, .-game
	.align	2
	.global	playerCollisions
	.type	playerCollisions, %function
playerCollisions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	playerCollisions, .-playerCollisions
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
	rsb	r0, r0, r0, asl #4
	ldr	r3, .L56
	mov	r0, r0, asl #3
	str	r0, [r3, #28]
	bx	lr
.L57:
	.align	2
.L56:
	.word	player
	.size	dash, .-dash
	.align	2
	.global	createEnemy
	.type	createEnemy, %function
createEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r5, .L59
	mov	r4, r0
	mov	lr, pc
	bx	r5
	ldr	r3, .L59+4
	smull	r2, r3, r0, r3
	mov	r2, r0, asr #31
	rsb	r3, r2, r3, asr #6
	add	r3, r3, r3, asl #2
	sub	r0, r0, r3, asl #5
	mov	r0, r0, asl #8
	str	r0, [r4, #0]
	mov	lr, pc
	bx	r5
	ldr	r3, .L59+8
	smull	r2, r3, r0, r3
	mov	r2, r0, asr #31
	add	r3, r3, r0
	rsb	r3, r2, r3, asr #7
	rsb	r3, r3, r3, asl #4
	sub	r0, r0, r3, asl #4
	mov	r3, #0
	str	r3, [r4, #24]
	str	r3, [r4, #28]
	mov	r3, #150
	str	r3, [r4, #36]
	mov	r3, #100
	str	r3, [r4, #40]
	mov	r3, #50
	str	r3, [r4, #52]
	mov	r3, #2048
	mov	r2, #16
	mov	r0, r0, asl #8
	str	r3, [r4, #44]
	mov	r3, #2304
	str	r0, [r4, #4]
	str	r2, [r4, #16]
	str	r2, [r4, #20]
	str	r3, [r4, #48]
	mov	r0, r4
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L60:
	.align	2
.L59:
	.word	rand
	.word	1717986919
	.word	-2004318071
	.size	createEnemy, .-createEnemy
	.align	2
	.global	spawner
	.type	spawner, %function
spawner:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	ldr	r4, .L65
	sub	sp, sp, #124
	ldr	r3, [r4, #16]
	cmp	r3, #60
	addne	r3, r3, #1
	strne	r3, [r4, #16]
	beq	.L64
.L61:
	add	sp, sp, #124
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L64:
	add	r5, sp, #56
	mov	r0, r5
	mov	r3, #0
	str	r3, [r4, #16]
	bl	createEnemy
	add	ip, sp, #68
	ldmia	ip!, {r0, r1, r2, r3}
	mov	lr, sp
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	ldr	ip, [ip, #0]
	ldmia	r5, {r1, r2, r3}
	mov	r0, r4
	str	ip, [lr, #0]
	ldr	ip, .L65+4
	mov	lr, pc
	bx	ip
	b	.L61
.L66:
	.align	2
.L65:
	.word	.LANCHOR0
	.word	addItem
	.size	spawner, .-spawner
	.align	2
	.global	updateEnemies
	.type	updateEnemies, %function
updateEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #76
	bl	spawner
	ldr	r3, .L76
	ldr	ip, [r3, #0]
	cmp	ip, #0
	beq	.L67
	add	r7, sp, #8
	b	.L73
.L70:
	ldrne	r4, [sp, #4]
	rsbne	r5, r4, r5
.L71:
	cmp	r5, r9
	bge	.L72
	rsb	r9, r9, #0
	cmp	r9, r5
	movlt	r5, #0
.L72:
	mov	r6, r7
	ldmia	r6!, {r0, r1, r2, r3}
	mov	r4, ip
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r6!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r6!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldr	r9, [sp, #0]
	ldmia	r6, {r0, r1, r2, r3}
	str	r8, [ip, #0]
	stmia	r4, {r0, r1, r2, r3}
	str	r9, [ip, #4]
	str	sl, [ip, #24]
	str	r5, [ip, #28]
	ldr	ip, [ip, #64]
	cmp	ip, #0
	beq	.L67
.L73:
	mov	r4, ip
	ldmia	r4!, {r0, r1, r2, r3}
	mov	r6, r7
	stmia	r6!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	r6!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	ldr	r5, [ip, #24]
	ldr	sl, [ip, #36]
	stmia	r6!, {r0, r1, r2, r3}
	ldr	r9, [ip, #20]
	ldr	r3, [r7, #0]
	add	sl, sl, r5
	add	r8, sl, r3
	ldmia	r4, {r0, r1, r2, r3}
	rsb	r4, r9, #143
	ldr	r9, [ip, #40]
	ldr	r5, [ip, #28]
	str	r9, [sp, #4]
	ldr	fp, [r7, #4]
	add	fp, r5, fp
	cmp	r4, r8, asr #8
	stmia	r6, {r0, r1, r2, r3}
	str	fp, [sp, #0]
	ldmia	r7, {r3, fp}	@ phole ldm
	movle	r8, r4, asl #8
	movle	sl, #0
	cmp	r5, #0
	ldr	r9, [ip, #52]
	str	r3, [sp, #64]
	str	fp, [sp, #68]
	bge	.L70
	ldr	r3, [sp, #4]
	add	r5, r5, r3
	b	.L71
.L67:
	add	sp, sp, #76
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L77:
	.align	2
.L76:
	.word	.LANCHOR0
	.size	updateEnemies, .-updateEnemies
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
	ldr	r3, .L79
	mov	r4, r0
	mov	lr, pc
	bx	r3
	mov	r1, r5
	ldr	r3, .L79+4
	mov	lr, pc
	bx	r3
	add	r0, r1, r4
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L80:
	.align	2
.L79:
	.word	rand
	.word	__aeabi_idivmod
	.size	getRand, .-getRand
	.global	hOff
	.global	vOff
	.global	isOver
	.global	timer
	.global	jumpCount
	.global	coolDown
	.global	frameCount
	.global	enemyTimer
	.global	head
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.comm	player,84,4
	.comm	state,4,4
	.comm	isDash,4,4
	.comm	isAttack,4,4
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	coolDown, %object
	.size	coolDown, 4
coolDown:
	.word	15
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	head, %object
	.size	head, 4
head:
	.space	4
	.type	frameCount, %object
	.size	frameCount, 4
frameCount:
	.space	4
	.type	jumpCount, %object
	.size	jumpCount, 4
jumpCount:
	.space	4
	.type	isOver, %object
	.size	isOver, 4
isOver:
	.space	4
	.type	enemyTimer, %object
	.size	enemyTimer, 4
enemyTimer:
	.space	4
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.space	4
	.type	timer, %object
	.size	timer, 4
timer:
	.space	4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
