; ====================================================
; DLL-Injection-with-Assembly Copyright(C) 2017 Furkan Türkal
; This program comes with ABSOLUTELY NO WARRANTY; This is free software,
; and you are welcome to redistribute it under certain conditions; See
; file LICENSE, which is part of this source code package, for details.
; ====================================================

; Example	: Blink the LED at intervals of about 700 ms.

; Ports		: LED		-> PORTB's 5th pin

.org 0
   rjmp main

main:
   ldi r16, 0x20 	; Set PORTB's 5th pin to output mode [0x20 = 0010 0000, r16 = PORTB]
   out DDRB, r16	; Write the r16's value at the PORTB's DDRB (DataDirectionRegister)
   clr r17			; Using r17 as a tempory to activate/deactivate the LED

loop_main:
   eor r17, r16 	; XOR the r16's unchanged 0x20 data with r17 (this command will change the 5th bit with 1 and 0, on every tick) 
   out PORTB, r17 	; Write the r17's value at the PORTB
   call delay_ms	; Call the delay function
   rjmp loop_main 	; Go to loop_main tag via RelativeJump and make it work in an infinite loop

delay_ms:			; Delay function (700ms)
   push r16			; We need to use loop_main's r16 and r17's values in delay_ms function
   push r17			; Using the push command, we record the values inside these registers into stack
   
   ldi r16, 0x40 	; Run the loop 0x400000 times
   ldi r17, 0x00 	; Run the ~12 million command cycle
   ldi r18, 0x00 	; ~0.7s time delay will be obtained for 16Mhz working frequency

_w0:
   dec r18			; Decrement by 1 the r18's value 
   brne _w0			; If the result of reduction is not 0, callback _w0 branch
   dec r17			; Decrement by 1 the r17's value 
   brne _w0			; If the result of reduction is not 0, callback _w0 branch
   dec r16			; Decrement by 1 the r16's value 
   brne _w0			; If the result of reduction is not 0, return _w0 branch
   pop r17			; Pop the latest pushed r17 before returning from function
   pop r16			; Pop the latest pushed r16 before returning from function
   ret				; Return from the function