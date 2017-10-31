; ====================================================
; DLL-Injection-with-Assembly Copyright(C) 2017 Furkan Türkal
; This program comes with ABSOLUTELY NO WARRANTY; This is free software,
; and you are welcome to redistribute it under certain conditions; See
; file LICENSE, which is part of this source code package, for details.
; ====================================================

; Example	: Activate the LED if button pressed

; Ports		: LED		-> PORTB's 5th pin
 
.org 0
	rjmp main
	
main:
	ldi r16, 0x20	; Set PORTB's 5th pin to output mode [0x20 = 0010 0000, r16 = PORTB]
	out DDRB, r16	; Write the r16's value at the PORTB's DDRB (DataDirectionRegister)
   
loop_main:
	sbi PORTB, 5	; Set PORTB's 5th pin to logic 1 and activate the LED
	rjmp loop_main	; Go to loop_button tag via RelativeJump and make it work in an infinite loop