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
  mov  r0, #0      ; return 0
  mov  pc, lr