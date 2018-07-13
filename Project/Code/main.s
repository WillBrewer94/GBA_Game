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
	.file	"main.c"
	.text
	.align	2
	.global	initializeStart
	.type	initializeStart, %function
initializeStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	r3, #1040
	mov	r2, #67108864
	add	r3, r3, #4
	ldr	r5, .L2
	strh	r3, [r2, #0]	@ movhi
	ldr	r0, .L2+4
	ldr	r3, .L2+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L2+12
	mov	r0, r5
	mov	lr, pc
	bx	r4
	ldr	r3, .L2+16
	mov	lr, pc
	bx	r3
	mov	r0, r5
	mov	lr, pc
	bx	r4
	ldr	r3, .L2+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L2+24
	mov	lr, pc
	bx	r3
	mov	r1, #376832
	mov	r2, #11008
	add	r2, r2, #17
	mov	r3, #0
	ldr	r0, .L2+28
	add	r1, r1, #1600
	ldr	ip, .L2+32
	mov	lr, pc
	bx	ip
	ldr	r3, .L2+36
	mov	r2, #0
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	splash1Bitmap
	.word	splash1Pal
	.word	loadPalette
	.word	drawBackgroundImage4
	.word	flipPage
	.word	setupInterrupts
	.word	setupSounds
	.word	undertaleChoir
	.word	playSoundA
	.word	state
	.size	initializeStart, .-initializeStart
	.align	2
	.global	start
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r4, .L14
	mov	r3, #12992
	ldr	r2, [r4, #0]
	add	r3, r3, #8
	cmp	r2, r3
	addle	r2, r2, #1
	strle	r2, [r4, #0]
	ble	.L6
	ldr	r0, [r4, #4]
	mov	r5, #0
	cmp	r0, #1
	str	r5, [r4, #0]
	beq	.L8
	cmp	r0, #2
	beq	.L9
	cmp	r0, r5
	beq	.L12
.L6:
	ldr	r3, .L14+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L4
	ldr	r3, .L14+8
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L13
.L4:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L13:
	ldr	r3, .L14+12
	mov	lr, pc
	bx	r3
	mov	r1, #3129344
	add	r1, r1, #11264
	mov	r2, #11008
	ldr	r0, .L14+16
	add	r1, r1, #32
	add	r2, r2, #17
	mov	r3, #1
	ldr	ip, .L14+20
	mov	lr, pc
	bx	ip
	b	.L4
.L8:
	mov	r0, r5
	ldr	r3, .L14+24
	mov	lr, pc
	bx	r3
	ldr	r5, .L14+28
	ldr	r0, .L14+32
	mov	lr, pc
	bx	r5
	ldr	r3, .L14+36
	mov	lr, pc
	bx	r3
	ldr	r0, .L14+32
	mov	lr, pc
	bx	r5
	mov	r3, #2
	str	r3, [r4, #4]
	b	.L6
.L12:
	ldr	r3, .L14+24
	mov	lr, pc
	bx	r3
	ldr	r5, .L14+28
	ldr	r0, .L14+40
	mov	lr, pc
	bx	r5
	ldr	r3, .L14+36
	mov	lr, pc
	bx	r3
	ldr	r0, .L14+40
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4, #4]
	b	.L6
.L9:
	ldr	r3, .L14+24
	mov	r0, r5
	mov	lr, pc
	bx	r3
	ldr	r6, .L14+28
	ldr	r0, .L14+44
	mov	lr, pc
	bx	r6
	ldr	r3, .L14+36
	mov	lr, pc
	bx	r3
	ldr	r0, .L14+44
	mov	lr, pc
	bx	r6
	str	r5, [r4, #4]
	b	.L6
.L15:
	.align	2
.L14:
	.word	.LANCHOR0
	.word	oldButtons
	.word	buttons
	.word	initializeGame
	.word	bottomFeeders
	.word	playSoundA
	.word	fillScreen4
	.word	drawBackgroundImage4
	.word	splash3Bitmap
	.word	flipPage
	.word	splash2Bitmap
	.word	splash1Bitmap
	.size	start, .-start
	.align	2
	.global	initializePause
	.type	initializePause, %function
initializePause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	mov	r3, #1040
	mov	r2, #67108864
	add	r3, r3, #4
	strh	r3, [r2, #0]	@ movhi
	ldr	r0, .L17
	ldr	r3, .L17+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L17+8
	mov	r2, #4
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	pausePal
	.word	loadPalette
	.word	state
	.size	initializePause, .-initializePause
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r0, .L22
	ldr	r4, .L22+4
	ldr	r5, .L22+8
	mov	lr, pc
	bx	r4
	mov	lr, pc
	bx	r5
	ldr	r0, .L22
	mov	lr, pc
	bx	r4
	ldr	r3, .L22+12
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L19
	ldr	r3, .L22+16
	ldr	r4, [r3, #0]
	ands	r4, r4, #8
	beq	.L21
.L19:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L21:
	mov	r0, r4
	ldr	r6, .L22+20
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	lr, pc
	bx	r6
	mov	r2, #4864	@ movhi
	mov	r3, #67108864
	strh	r2, [r3, #0]	@ movhi
	ldr	r3, .L22+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L22+28
	mov	r2, #1
	str	r2, [r3, #0]
	b	.L19
.L23:
	.align	2
.L22:
	.word	pauseBitmap
	.word	drawBackgroundImage4
	.word	flipPage
	.word	oldButtons
	.word	buttons
	.word	fillScreen4
	.word	initGraphics
	.word	state
	.size	pause, .-pause
	.align	2
	.global	initializeWin
	.type	initializeWin, %function
initializeWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #1040
	add	r3, r3, #4
	mov	r2, #67108864
	strh	r3, [r2, #0]	@ movhi
	ldr	r3, .L25
	mov	r2, #3
	str	r2, [r3, #0]
	bx	lr
.L26:
	.align	2
.L25:
	.word	state
	.size	initializeWin, .-initializeWin
	.align	2
	.global	win
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r0, .L30
	ldr	r4, .L30+4
	mov	lr, pc
	bx	r4
	ldr	r3, .L30+8
	mov	lr, pc
	bx	r3
	ldr	r0, .L30
	mov	lr, pc
	bx	r4
	ldr	r3, .L30+12
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L27
	ldr	r3, .L30+16
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L29
.L27:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L29:
	ldr	r3, .L30+20
	mov	lr, pc
	bx	r3
	b	.L27
.L31:
	.align	2
.L30:
	.word	winBitmap
	.word	drawBackgroundImage4
	.word	flipPage
	.word	oldButtons
	.word	buttons
	.word	initializeGame
	.size	win, .-win
	.align	2
	.global	initializeLose
	.type	initializeLose, %function
initializeLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	mov	r3, #1040
	mov	r2, #67108864
	add	r3, r3, #4
	strh	r3, [r2, #0]	@ movhi
	ldr	r0, .L33
	ldr	r3, .L33+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L33+8
	mov	r2, #2
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L34:
	.align	2
.L33:
	.word	losePal
	.word	loadPalette
	.word	state
	.size	initializeLose, .-initializeLose
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r0, .L38
	ldr	r4, .L38+4
	mov	lr, pc
	bx	r4
	ldr	r3, .L38+8
	mov	lr, pc
	bx	r3
	ldr	r0, .L38
	mov	lr, pc
	bx	r4
	ldr	r3, .L38+12
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L35
	ldr	r3, .L38+16
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L37
.L35:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L37:
	ldr	r3, .L38+20
	mov	lr, pc
	bx	r3
	b	.L35
.L39:
	.align	2
.L38:
	.word	loseBitmap
	.word	drawBackgroundImage4
	.word	flipPage
	.word	oldButtons
	.word	buttons
	.word	initializeGame
	.size	lose, .-lose
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, sl, lr}
	bl	initializeStart
	ldr	r4, .L53
	ldr	r7, .L53+4
	ldr	r6, .L53+8
	ldr	sl, .L53+12
	ldr	r8, .L53+16
	mov	r5, #67108864
.L52:
	ldr	r3, [r4, #0]
	ldr	r2, [r7, #0]
.L42:
	str	r3, [r6, #0]
	ldr	r3, [r5, #304]
	str	r3, [r4, #0]
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L42
.L49:
	.word	.L43
	.word	.L44
	.word	.L45
	.word	.L46
	.word	.L47
	.word	.L48
.L48:
	mov	lr, pc
	bx	r8
	b	.L52
.L47:
	bl	pause
	b	.L52
.L46:
	bl	win
	b	.L52
.L45:
	bl	lose
	b	.L52
.L44:
	mov	lr, pc
	bx	sl
	b	.L52
.L43:
	bl	start
	b	.L52
.L54:
	.align	2
.L53:
	.word	buttons
	.word	state
	.word	oldButtons
	.word	game
	.word	death
	.size	main, .-main
	.global	timer
	.global	currFrame
	.comm	g,4,4
	.comm	scorebuffer,30,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	timer, %object
	.size	timer, 4
timer:
	.space	4
	.type	currFrame, %object
	.size	currFrame, 4
currFrame:
	.space	4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
