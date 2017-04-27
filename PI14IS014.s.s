.text
_start:
  mov  r0, #12     ; r0 = n
  bl   findMax     ; call your function
  mov  r1, r0      ; move return value to r1
  mov  r0, #1      ; 1 = stdout
  swi  0x6b        ; print r1
  swi  0x11

; Sample function f
f:                 ; r0 = x
  cmp  r0, #6
  bgt  f_else
  mov  pc, lr      ; x <= 6 --> f(x) = x
f_else:
  mov  r1, #12
  sub  r0, r1, r0  ; x >= 6 --> f(x) = 12-x
  mov  pc, lr

;-- DO NOT DELETE --
; Everything you write ABOVE this line will be ignored

findMax:
  ; fix this code
	str lr,[sp] ;first fun f
  	sub sp,sp,#4
  	mov r4,#0
	mov r7,#0
	mov r5,#0
	mov r1,r0 ;r0 original
	mov r0,#0
	mov r2,#0
	mov r3,#0
	mov r6,#0
  	str r0,[sp]
  	sub sp,sp,#4 
  	str r1,[sp]
  	sub sp,sp,#4 
  	str r2,[sp]
  	sub sp,sp,#4 
  	str r3,[sp]
  	sub sp,sp,#4 
  	str r4,[sp]
  	sub sp,sp,#4 
  	str r5,[sp]
  	sub sp,sp,#4 
  	str r6,[sp]
  	sub sp,sp,#4 
  	str r7,[sp]
  	sub sp,sp,#4 
  	cmp r1,#0
  	beq end
  	cmp r1,#1
  	beq end1
  	mov r0,r1,asr#1
	add sp,sp,#32
  	str r0,[sp] ; ro/2
  	sub sp,sp,#32
start:
	cmp r0,r1
	blt YES
	bge end ;never executed
YES:
	bl f
	mov r2,r0
	add sp,sp,#32
	ldr r0,[sp]
	sub sp,sp,#32
	sub r0,r0,#1
	add sp,sp,#32
	str r0,[sp]
	sub sp,sp,#32
	add sp,sp,#24
	str r2,[sp]
	sub sp,sp,#24
	bl f
	mov r3,r0
	add sp,sp,#24
	ldr r2,[sp]
	sub sp,sp,#24
	add sp,sp,#20
	str r3,[sp]
	sub sp,sp,#20
	cmp r2,r3
	bgt front
	blt back
	beq new
front:
	mov r4,r2
	add sp,sp,#16
	str r4,[sp]
	sub sp,sp,#16
	add sp,sp,#32
	ldr r0,[sp]
	sub sp,sp,#32
	add r0,r0,#1
	add sp,sp,#32
	str r0,[sp]
	sub sp,sp,#32
	add sp,sp,#28
	ldr r1,[sp]
	sub sp,sp,#28
	cmp r0,r1
	blt contf
	mov r0,r4
	add sp,sp,#36
	ldr lr,[sp]
	mov pc,lr
contf:
	bl f
	mov r2,r0
	add sp,sp,#24
	str r2,[sp]
	sub sp,sp,#24
	add sp,sp,#16
	ldr r4,[sp]
	sub sp,sp,#16
	cmp r2,r4
	bge front
	mov r0,r4
	add sp,sp,#36
	ldr lr,[sp]
	mov pc,lr
back:
	mov r5,r3
	add sp,sp,#12
	str r5,[sp]
	sub sp,sp,#12
	add sp,sp,#20
	str r3,[sp]
	sub sp,sp,#20
	add sp,sp,#32
	ldr r0,[sp]
	sub r0,r0,#1
	str r0,[sp]
	sub sp,sp,#32
	cmp r0,#0
	bge contback
        mov r0,r5
	add sp,sp,#36
	ldr lr,[sp]
	mov pc,lr
contback:
	bl f
	mov r3,r0
	add sp,sp,#20
	str r3,[sp]
	sub sp,sp,#20
	add sp,sp,#12
	ldr r5,[sp]
	sub sp,sp,#12
	cmp r3,r5
	bgt back
	mov r0,r5
	add sp,sp,#36
	ldr lr,[sp]
	mov pc,lr
new:
	add sp,sp,#32
	ldr r0,[sp]
	sub sp,sp,#32
	mov r5,r0  ;r/2-1
	add sp,sp,#12
	str r5,[sp]
	sub sp,sp,#12
	mov r0,#0
	add sp,sp,#32
	str r0,[sp]
	sub sp,sp,#32
B:
	add sp,sp,#32
	str r0,[sp]
	sub sp,sp,#32
	add sp,sp,#28
	ldr r1,[sp]
	sub sp,sp,#28
	cmp r0,r1
	blt D
	add sp,sp,#8
	ldr r6,[sp]
	sub sp,sp,#8
	mov r0,r6
	add sp,sp,#36
	ldr lr,[sp]
	mov pc,lr
D:
	add sp,sp,#32
	ldr r0,[sp]
	sub sp,sp,#32
	add sp,sp,#12
	ldr r5,[sp]
	sub sp,sp,#12
	cmp r0,r5
	bne M
	beq O
M:
	bl f
	mov r6,r0
	add sp,sp,#8
	str r6,[sp]
	sub sp,sp,#8
	add sp,sp,#32
	ldr r0,[sp]
	sub sp,sp,#32
	add r0,r0,#1
	add sp,sp,#4
	ldr r7,[sp]
	sub sp,sp,#4
	cmp r6,r7
	bge H
	b B
H:
	
	mov r7,r6
	add sp,sp,#4
	str r7,[sp]
	sub sp,sp,#4
	b B
O:
	add r0,r0,#2
	add sp,sp,#32
	str r7,[sp]
	sub sp,sp,#32
	add sp,sp,#4
	ldr r7,[sp]
	sub sp,sp,#4
	add sp,sp,#24
	ldr r2,[sp]
	sub sp,sp,#24
	add sp,sp,#20
	ldr r6,[sp]
	sub sp,sp,#20
	cmp r7,r2
	blt S
	cmp r7,r3
	blt F
	b B
S:
	mov r7,r2
	add sp,sp,#4
	str r7,[sp]
	sub sp,sp,#4
	b O
F:
	mov r7,r5
	add sp,sp,#4
	str r7,[sp]
	sub sp,sp,#4
	b B

	
 
end1:
	bl f
	add sp,sp,#36
	ldr lr,[sp]
end:
  mov  r0, #0      ; return 0
  mov  pc, lr