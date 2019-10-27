
_Timer0_Int_Init:

;BRIGHTING_REGULATOR.c,2 :: 		void Timer0_Int_Init()
;BRIGHTING_REGULATOR.c,4 :: 		OPTION_REG=0b11010010;
	MOVLW      210
	MOVWF      OPTION_REG+0
;BRIGHTING_REGULATOR.c,5 :: 		INTCON.F7=1;
	BSF        INTCON+0, 7
;BRIGHTING_REGULATOR.c,6 :: 		INTCON.F6=1;
	BSF        INTCON+0, 6
;BRIGHTING_REGULATOR.c,7 :: 		INTCON.F5=1;
	BSF        INTCON+0, 5
;BRIGHTING_REGULATOR.c,9 :: 		}
	RETURN
; end of _Timer0_Int_Init

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;BRIGHTING_REGULATOR.c,10 :: 		void interrupt(void)
;BRIGHTING_REGULATOR.c,12 :: 		if(INTCON.F2)
	BTFSS      INTCON+0, 2
	GOTO       L_interrupt0
;BRIGHTING_REGULATOR.c,14 :: 		INTCON.F2=0;
	BCF        INTCON+0, 2
;BRIGHTING_REGULATOR.c,15 :: 		GPIO.F1=1;
	BSF        GPIO+0, 1
;BRIGHTING_REGULATOR.c,16 :: 		reg=ADC_Read(0)>>3;
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	MOVF       R2+0, 0
	MOVWF      _reg+0
	MOVF       R2+1, 0
	MOVWF      _reg+1
;BRIGHTING_REGULATOR.c,17 :: 		if(reg<100)
	MOVLW      128
	XORWF      R2+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt8
	MOVLW      100
	SUBWF      R2+0, 0
L__interrupt8:
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt1
;BRIGHTING_REGULATOR.c,19 :: 		for(i=0;i<=reg;i++)  delay_us(1);
	CLRF       _i+0
	CLRF       _i+1
L_interrupt2:
	MOVLW      128
	XORWF      _reg+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt9
	MOVF       _i+0, 0
	SUBWF      _reg+0, 0
L__interrupt9:
	BTFSS      STATUS+0, 0
	GOTO       L_interrupt3
	NOP
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
	GOTO       L_interrupt2
L_interrupt3:
;BRIGHTING_REGULATOR.c,21 :: 		GPIO.F1=0;
	BCF        GPIO+0, 1
;BRIGHTING_REGULATOR.c,22 :: 		}
L_interrupt1:
;BRIGHTING_REGULATOR.c,23 :: 		}
L_interrupt0:
;BRIGHTING_REGULATOR.c,24 :: 		}
L__interrupt7:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;BRIGHTING_REGULATOR.c,25 :: 		void main()
;BRIGHTING_REGULATOR.c,27 :: 		Timer0_Int_Init();
	CALL       _Timer0_Int_Init+0
;BRIGHTING_REGULATOR.c,28 :: 		ANSEL.F3=0;
	BCF        ANSEL+0, 3
;BRIGHTING_REGULATOR.c,29 :: 		ANSEL.F2=0;
	BCF        ANSEL+0, 2
;BRIGHTING_REGULATOR.c,30 :: 		ANSEL.F1=0;
	BCF        ANSEL+0, 1
;BRIGHTING_REGULATOR.c,31 :: 		TRISIO.F1=0;
	BCF        TRISIO+0, 1
;BRIGHTING_REGULATOR.c,32 :: 		GPIO.F1=0;
	BCF        GPIO+0, 1
;BRIGHTING_REGULATOR.c,33 :: 		while(1)
L_main5:
;BRIGHTING_REGULATOR.c,36 :: 		}
	GOTO       L_main5
;BRIGHTING_REGULATOR.c,38 :: 		}
	GOTO       $+0
; end of _main
