
_interrupt:

;USB_PIC.c,8 :: 		void interrupt( void )
;USB_PIC.c,10 :: 		USB_Interrupt_Proc();
	CALL        _USB_Interrupt_Proc+0, 0
;USB_PIC.c,11 :: 		}
L__interrupt7:
	RETFIE      1
; end of _interrupt

_main:

;USB_PIC.c,12 :: 		void main( void )
;USB_PIC.c,18 :: 		INTCON = 0;
	CLRF        INTCON+0 
;USB_PIC.c,19 :: 		INTCON2 = 0xF5;
	MOVLW       245
	MOVWF       INTCON2+0 
;USB_PIC.c,20 :: 		INTCON3 = 0xC0;
	MOVLW       192
	MOVWF       INTCON3+0 
;USB_PIC.c,21 :: 		RCON.IPEN = 0;
	BCF         RCON+0, 7 
;USB_PIC.c,22 :: 		PIE1 = 0;
	CLRF        PIE1+0 
;USB_PIC.c,23 :: 		PIE2 = 0;
	CLRF        PIE2+0 
;USB_PIC.c,24 :: 		PIR1 = 0;
	CLRF        PIR1+0 
;USB_PIC.c,25 :: 		PIR2 = 0;
	CLRF        PIR2+0 
;USB_PIC.c,27 :: 		TRISD.F0 = 0;
	BCF         TRISD+0, 0 
;USB_PIC.c,29 :: 		hid_Enable(&Br,&Bw);//Función de inicio para el puerto USB.
	MOVLW       _Br+0
	MOVWF       FARG_HID_Enable_readbuff+0 
	MOVLW       hi_addr(_Br+0)
	MOVWF       FARG_HID_Enable_readbuff+1 
	MOVLW       _Bw+0
	MOVWF       FARG_HID_Enable_writebuff+0 
	MOVLW       hi_addr(_Bw+0)
	MOVWF       FARG_HID_Enable_writebuff+1 
	CALL        _HID_Enable+0, 0
;USB_PIC.c,31 :: 		for(n=0; n<64; n++)Bw[n]=0;
	CLRF        main_n_L0+0 
L_main0:
	MOVLW       64
	SUBWF       main_n_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main1
	MOVLW       _Bw+0
	MOVWF       FSR1L 
	MOVLW       hi_addr(_Bw+0)
	MOVWF       FSR1H 
	MOVF        main_n_L0+0, 0 
	ADDWF       FSR1L, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	CLRF        POSTINC1+0 
	INCF        main_n_L0+0, 1 
	GOTO        L_main0
L_main1:
;USB_PIC.c,32 :: 		while(1) //Bucle infinito.
L_main3:
;USB_PIC.c,34 :: 		PORTD.F0=1;
	BSF         PORTD+0, 0 
;USB_PIC.c,35 :: 		delay_ms(500);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 0
	BRA         L_main5
	DECFSZ      R12, 1, 0
	BRA         L_main5
	DECFSZ      R11, 1, 0
	BRA         L_main5
	NOP
;USB_PIC.c,36 :: 		PORTD.F0=0;
	BCF         PORTD+0, 0 
;USB_PIC.c,37 :: 		delay_ms(500);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_main6:
	DECFSZ      R13, 1, 0
	BRA         L_main6
	DECFSZ      R12, 1, 0
	BRA         L_main6
	DECFSZ      R11, 1, 0
	BRA         L_main6
	NOP
;USB_PIC.c,59 :: 		}
	GOTO        L_main3
;USB_PIC.c,60 :: 		}
	GOTO        $+0
; end of _main
