
_main:

;INTERN_CLOCK_PIC.c,1 :: 		void main() {
;INTERN_CLOCK_PIC.c,2 :: 		OSCCON.F6=1;
	BSF         OSCCON+0, 6 
;INTERN_CLOCK_PIC.c,3 :: 		OSCCON.F5=1;
	BSF         OSCCON+0, 5 
;INTERN_CLOCK_PIC.c,4 :: 		OSCCON.F4=1;
	BSF         OSCCON+0, 4 
;INTERN_CLOCK_PIC.c,6 :: 		TRISD.F0=0;
	BCF         TRISD+0, 0 
;INTERN_CLOCK_PIC.c,8 :: 		while(1)
L_main0:
;INTERN_CLOCK_PIC.c,10 :: 		PORTD.F0=1;
	BSF         PORTD+0, 0 
;INTERN_CLOCK_PIC.c,11 :: 		delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 0
	BRA         L_main2
	DECFSZ      R12, 1, 0
	BRA         L_main2
	DECFSZ      R11, 1, 0
	BRA         L_main2
	NOP
	NOP
;INTERN_CLOCK_PIC.c,12 :: 		PORTD.F0=0;
	BCF         PORTD+0, 0 
;INTERN_CLOCK_PIC.c,13 :: 		delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 0
	BRA         L_main3
	DECFSZ      R12, 1, 0
	BRA         L_main3
	DECFSZ      R11, 1, 0
	BRA         L_main3
	NOP
	NOP
;INTERN_CLOCK_PIC.c,15 :: 		}
	GOTO        L_main0
;INTERN_CLOCK_PIC.c,16 :: 		}
	GOTO        $+0
; end of _main
