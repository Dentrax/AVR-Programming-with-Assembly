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
	ldi r16, 0x20	; 0x20=0010 0000 -> PORTB nin 5. pinini output yapmak istiyoruz, o nedenle 5. bit 1
	out DDRB, r16	; PortB nin data direction registeri DDRB ye r16 daki degeri yaziyoruz
   
loop_main:
	sbi PORTB, 5	; PORTB nin 5. pinini lojik 1 yapiyoruz yani set ediyoruz ve led yaniyor.
	rjmp loop_main	; Programin loop_main etiketine giderek sonsuz dongude calismasini sagliyoruz