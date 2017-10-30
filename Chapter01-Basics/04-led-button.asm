; ====================================================
; DLL-Injection-with-Assembly Copyright(C) 2017 Furkan Türkal
; This program comes with ABSOLUTELY NO WARRANTY; This is free software,
; and you are welcome to redistribute it under certain conditions; See
; file LICENSE, which is part of this source code package, for details.
; ====================================================

; Example	: Activate the LED if button pressed

; Ports		: LED		-> PORTB's 5th pin
;			: Button	-> PORTB's 6th pin		

.org 0
	rjmp main

main:
	ldi r16, 0x20	 ; Set PORTB's 5th pin to output mode [0x20 = 0010 0000, r16 = PORTB]
	out DDRB, r16	 ; Write the r16's value at the PORTB's DDRB (DataDirectionRegister)
	sbi PORTB, 6	 ; Activate the PB6's pull-up resistor. When you press the button, you will read 0, else you will read 1

loop_main:
	sbis PINB, 6	 ; If PB6 pin's value == 1 (button_not_pressed), skip next command
	rjmp button_led	 ; If PB6 pin's value == 0 (button_pressed), dont skip and execute command
	cbi PORTB, 5	 ; Deactivate the LED If button is not pressed
	rjmp loop_main   ; Go to loop_button tag via RelativeJump and make it work in an infinite loop

button_led:
	sbi PORTB, 5	 ; If button is pressed, activate the LED 
	rjmp loop_main   ; Infinite loop