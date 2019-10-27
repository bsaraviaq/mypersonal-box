
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;SERVOMOTOR_CONTROLER.c,7 :: 		void interrupt(void){ /////*/*/******/*/*/*//*/*/*/*/*
;SERVOMOTOR_CONTROLER.c,8 :: 		if(PIR1.F0==1) {
	BTFSS      PIR1+0, 0
	GOTO       L_interrupt0
;SERVOMOTOR_CONTROLER.c,9 :: 		TMR1H=462;
	MOVLW      206
	MOVWF      TMR1H+0
;SERVOMOTOR_CONTROLER.c,10 :: 		TMR1L=50;
	MOVLW      50
	MOVWF      TMR1L+0
;SERVOMOTOR_CONTROLER.c,11 :: 		PORTB.F3=1;
	BSF        PORTB+0, 3
;SERVOMOTOR_CONTROLER.c,12 :: 		PORTB.F4=1;
	BSF        PORTB+0, 4
;SERVOMOTOR_CONTROLER.c,13 :: 		PORTB.F5=1;
	BSF        PORTB+0, 5
;SERVOMOTOR_CONTROLER.c,14 :: 		PORTB.F6=1;
	BSF        PORTB+0, 6
;SERVOMOTOR_CONTROLER.c,15 :: 		PORTB.F7=1;
	BSF        PORTB+0, 7
;SERVOMOTOR_CONTROLER.c,16 :: 		delay_us(900);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      215
	MOVWF      R13+0
L_interrupt1:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt1
	DECFSZ     R12+0, 1
	GOTO       L_interrupt1
;SERVOMOTOR_CONTROLER.c,17 :: 		for(i=0;i<=80;i++){
	CLRF       _i+0
	CLRF       _i+1
L_interrupt2:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt16
	MOVF       _i+0, 0
	SUBLW      80
L__interrupt16:
	BTFSS      STATUS+0, 0
	GOTO       L_interrupt3
;SERVOMOTOR_CONTROLER.c,18 :: 		if(i>servo1){
	MOVLW      128
	XORWF      _servo1+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt17
	MOVF       _i+0, 0
	SUBWF      _servo1+0, 0
L__interrupt17:
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt5
;SERVOMOTOR_CONTROLER.c,19 :: 		PORTB.F3=0;
	BCF        PORTB+0, 3
;SERVOMOTOR_CONTROLER.c,20 :: 		}
L_interrupt5:
;SERVOMOTOR_CONTROLER.c,21 :: 		if(i>servo2){
	MOVLW      128
	XORWF      _servo2+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt18
	MOVF       _i+0, 0
	SUBWF      _servo2+0, 0
L__interrupt18:
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt6
;SERVOMOTOR_CONTROLER.c,22 :: 		PORTB.F4=0;
	BCF        PORTB+0, 4
;SERVOMOTOR_CONTROLER.c,23 :: 		}
L_interrupt6:
;SERVOMOTOR_CONTROLER.c,24 :: 		if(i>servo3){
	MOVLW      128
	XORWF      _servo3+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt19
	MOVF       _i+0, 0
	SUBWF      _servo3+0, 0
L__interrupt19:
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt7
;SERVOMOTOR_CONTROLER.c,25 :: 		PORTB.F5=0;
	BCF        PORTB+0, 5
;SERVOMOTOR_CONTROLER.c,26 :: 		}
L_interrupt7:
;SERVOMOTOR_CONTROLER.c,27 :: 		if(i>servo4){
	MOVLW      128
	XORWF      _servo4+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt20
	MOVF       _i+0, 0
	SUBWF      _servo4+0, 0
L__interrupt20:
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt8
;SERVOMOTOR_CONTROLER.c,28 :: 		PORTB.F6=0;
	BCF        PORTB+0, 6
;SERVOMOTOR_CONTROLER.c,29 :: 		}
L_interrupt8:
;SERVOMOTOR_CONTROLER.c,30 :: 		if(i>servo5){
	MOVLW      128
	XORWF      _servo5+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt21
	MOVF       _i+0, 0
	SUBWF      _servo5+0, 0
L__interrupt21:
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt9
;SERVOMOTOR_CONTROLER.c,31 :: 		PORTB.F7=0;
	BCF        PORTB+0, 7
;SERVOMOTOR_CONTROLER.c,32 :: 		}
L_interrupt9:
;SERVOMOTOR_CONTROLER.c,17 :: 		for(i=0;i<=80;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;SERVOMOTOR_CONTROLER.c,33 :: 		}
	GOTO       L_interrupt2
L_interrupt3:
;SERVOMOTOR_CONTROLER.c,35 :: 		PIR1.F0=0;
	BCF        PIR1+0, 0
;SERVOMOTOR_CONTROLER.c,38 :: 		}
L_interrupt0:
;SERVOMOTOR_CONTROLER.c,39 :: 		}
L__interrupt15:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;SERVOMOTOR_CONTROLER.c,42 :: 		void main() {           //-------******-------
;SERVOMOTOR_CONTROLER.c,45 :: 		int j=0;
	CLRF       main_j_L0+0
	CLRF       main_j_L0+1
;SERVOMOTOR_CONTROLER.c,47 :: 		TRISB= 0b00000011;
	MOVLW      3
	MOVWF      TRISB+0
;SERVOMOTOR_CONTROLER.c,48 :: 		INTCON=0b11000000;
	MOVLW      192
	MOVWF      INTCON+0
;SERVOMOTOR_CONTROLER.c,49 :: 		T1CON= 0b00110001;
	MOVLW      49
	MOVWF      T1CON+0
;SERVOMOTOR_CONTROLER.c,50 :: 		PIE1.F0=1;
	BSF        PIE1+0, 0
;SERVOMOTOR_CONTROLER.c,51 :: 		PORTB.F2=1;
	BSF        PORTB+0, 2
;SERVOMOTOR_CONTROLER.c,53 :: 		UART1_Init(9600);
	MOVLW      129
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;SERVOMOTOR_CONTROLER.c,54 :: 		while(1)
L_main10:
;SERVOMOTOR_CONTROLER.c,56 :: 		if(UART1_Data_Ready()){
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main12
;SERVOMOTOR_CONTROLER.c,57 :: 		ch=UART1_Read();
	CALL       _UART1_Read+0
;SERVOMOTOR_CONTROLER.c,58 :: 		a=ch;
	MOVF       R0+0, 0
	MOVWF      main_a_L0+0
	CLRF       main_a_L0+1
;SERVOMOTOR_CONTROLER.c,59 :: 		if(a>185) j=0;
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_a_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main22
	MOVF       main_a_L0+0, 0
	SUBLW      185
L__main22:
	BTFSC      STATUS+0, 0
	GOTO       L_main13
	CLRF       main_j_L0+0
	CLRF       main_j_L0+1
L_main13:
;SERVOMOTOR_CONTROLER.c,60 :: 		angle_servo[j]=a;
	MOVF       main_j_L0+0, 0
	MOVWF      R0+0
	MOVF       main_j_L0+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      main_angle_servo_L0+0
	MOVWF      FSR
	MOVF       main_a_L0+0, 0
	MOVWF      INDF+0
	MOVF       main_a_L0+1, 0
	INCF       FSR, 1
	MOVWF      INDF+0
;SERVOMOTOR_CONTROLER.c,61 :: 		j++;
	INCF       main_j_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_j_L0+1, 1
;SERVOMOTOR_CONTROLER.c,62 :: 		delay_us(50);
	MOVLW      83
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
;SERVOMOTOR_CONTROLER.c,63 :: 		}
L_main12:
;SERVOMOTOR_CONTROLER.c,64 :: 		servo1= angle_servo[1]*0.44;
	MOVF       main_angle_servo_L0+2, 0
	MOVWF      R0+0
	MOVF       main_angle_servo_L0+3, 0
	MOVWF      R0+1
	CALL       _Int2Double+0
	MOVLW      174
	MOVWF      R4+0
	MOVLW      71
	MOVWF      R4+1
	MOVLW      97
	MOVWF      R4+2
	MOVLW      125
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _Double2Int+0
	MOVF       R0+0, 0
	MOVWF      _servo1+0
	MOVF       R0+1, 0
	MOVWF      _servo1+1
;SERVOMOTOR_CONTROLER.c,65 :: 		servo2= angle_servo[2]*0.44;
	MOVF       main_angle_servo_L0+4, 0
	MOVWF      R0+0
	MOVF       main_angle_servo_L0+5, 0
	MOVWF      R0+1
	CALL       _Int2Double+0
	MOVLW      174
	MOVWF      R4+0
	MOVLW      71
	MOVWF      R4+1
	MOVLW      97
	MOVWF      R4+2
	MOVLW      125
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _Double2Int+0
	MOVF       R0+0, 0
	MOVWF      _servo2+0
	MOVF       R0+1, 0
	MOVWF      _servo2+1
;SERVOMOTOR_CONTROLER.c,66 :: 		servo3= angle_servo[3]*0.44;
	MOVF       main_angle_servo_L0+6, 0
	MOVWF      R0+0
	MOVF       main_angle_servo_L0+7, 0
	MOVWF      R0+1
	CALL       _Int2Double+0
	MOVLW      174
	MOVWF      R4+0
	MOVLW      71
	MOVWF      R4+1
	MOVLW      97
	MOVWF      R4+2
	MOVLW      125
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _Double2Int+0
	MOVF       R0+0, 0
	MOVWF      _servo3+0
	MOVF       R0+1, 0
	MOVWF      _servo3+1
;SERVOMOTOR_CONTROLER.c,67 :: 		servo4= angle_servo[4]*0.44;
	MOVF       main_angle_servo_L0+8, 0
	MOVWF      R0+0
	MOVF       main_angle_servo_L0+9, 0
	MOVWF      R0+1
	CALL       _Int2Double+0
	MOVLW      174
	MOVWF      R4+0
	MOVLW      71
	MOVWF      R4+1
	MOVLW      97
	MOVWF      R4+2
	MOVLW      125
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _Double2Int+0
	MOVF       R0+0, 0
	MOVWF      _servo4+0
	MOVF       R0+1, 0
	MOVWF      _servo4+1
;SERVOMOTOR_CONTROLER.c,68 :: 		servo5= angle_servo[5]*0.44;
	MOVF       main_angle_servo_L0+10, 0
	MOVWF      R0+0
	MOVF       main_angle_servo_L0+11, 0
	MOVWF      R0+1
	CALL       _Int2Double+0
	MOVLW      174
	MOVWF      R4+0
	MOVLW      71
	MOVWF      R4+1
	MOVLW      97
	MOVWF      R4+2
	MOVLW      125
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _Double2Int+0
	MOVF       R0+0, 0
	MOVWF      _servo5+0
	MOVF       R0+1, 0
	MOVWF      _servo5+1
;SERVOMOTOR_CONTROLER.c,70 :: 		}
	GOTO       L_main10
;SERVOMOTOR_CONTROLER.c,71 :: 		}
	GOTO       $+0
; end of _main
