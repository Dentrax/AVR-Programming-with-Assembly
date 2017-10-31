; ====================================================
; DLL-Injection-with-Assembly Copyright(C) 2017 Furkan Türkal
; This program comes with ABSOLUTELY NO WARRANTY; This is free software,
; and you are welcome to redistribute it under certain conditions; See
; file LICENSE, which is part of this source code package, for details.
; ====================================================

; Example	: Purpose of the ".org 0" (Indispensable)

; The command at the 0th place (also known as ".org 0"), is the first executed command when the first time it is started or reset								

.org 0          ; The 0th address in the program memory, allows the next command to be written.
    rjmp main   ; Redirecting to main (or whatever you want) which we want to work first.

main
    ;Codes