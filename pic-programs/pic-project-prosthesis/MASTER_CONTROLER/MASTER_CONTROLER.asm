
_interrupt:

;MASTER_CONTROLER.c,6 :: 		void interrupt (void){    //interrupcion pra el funcionamiento del servomotor 0
;MASTER_CONTROLER.c,8 :: 		if(INTCON.F2) {           //utilizando la interrupcion del  Timer0
	BTFSS       INTCON+0, 2 
	GOTO        L_interrupt0
;MASTER_CONTROLER.c,9 :: 		n=angulo*3.2;
	MOVF        _angulo+0, 0 
	MOVWF       R0 
	MOVF        _angulo+1, 0 
	MOVWF       R1 
	CALL        _Int2Double+0, 0
	MOVLW       205
	MOVWF       R4 
	MOVLW       204
	MOVWF       R5 
	MOVLW       76
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _Double2Int+0, 0
	MOVF        R0, 0 
	MOVWF       interrupt_n_L0+0 
	MOVF        R1, 0 
	MOVWF       interrupt_n_L0+1 
;MASTER_CONTROLER.c,10 :: 		PORTD.F0=1;
	BSF         PORTD+0, 0 
;MASTER_CONTROLER.c,11 :: 		delay_us(500);
	MOVLW       5
	MOVWF       R12, 0
	MOVLW       96
	MOVWF       R13, 0
L_interrupt1:
	DECFSZ      R13, 1, 0
	BRA         L_interrupt1
	DECFSZ      R12, 1, 0
	BRA         L_interrupt1
	NOP
	NOP
;MASTER_CONTROLER.c,12 :: 		for(i=0;i<=n;i++)
	CLRF        interrupt_i_L0+0 
	CLRF        interrupt_i_L0+1 
L_interrupt2:
	MOVLW       128
	XORWF       interrupt_n_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	XORWF       interrupt_i_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt53
	MOVF        interrupt_i_L0+0, 0 
	SUBWF       interrupt_n_L0+0, 0 
L__interrupt53:
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt3
;MASTER_CONTROLER.c,13 :: 		delay_us(1);
	MOVLW       2
	MOVWF       R13, 0
L_interrupt5:
	DECFSZ      R13, 1, 0
	BRA         L_interrupt5
;MASTER_CONTROLER.c,12 :: 		for(i=0;i<=n;i++)
	INFSNZ      interrupt_i_L0+0, 1 
	INCF        interrupt_i_L0+1, 1 
;MASTER_CONTROLER.c,13 :: 		delay_us(1);
	GOTO        L_interrupt2
L_interrupt3:
;MASTER_CONTROLER.c,14 :: 		PORTD.F0=0;
	BCF         PORTD+0, 0 
;MASTER_CONTROLER.c,15 :: 		INTCON.F2=0;
	BCF         INTCON+0, 2 
;MASTER_CONTROLER.c,16 :: 		TMR0H=5;
	MOVLW       5
	MOVWF       TMR0H+0 
;MASTER_CONTROLER.c,17 :: 		TMR0L=0;
	CLRF        TMR0L+0 
;MASTER_CONTROLER.c,18 :: 		}
L_interrupt0:
;MASTER_CONTROLER.c,19 :: 		}
L__interrupt52:
	RETFIE      1
; end of _interrupt

_main:

;MASTER_CONTROLER.c,23 :: 		void main() {                   //     PROGRAMA PRINCIPAL
;MASTER_CONTROLER.c,25 :: 		int retraso=0;
	CLRF        main_retraso_L0+0 
	CLRF        main_retraso_L0+1 
;MASTER_CONTROLER.c,26 :: 		int cont=1;
	MOVLW       1
	MOVWF       main_cont_L0+0 
	MOVLW       0
	MOVWF       main_cont_L0+1 
;MASTER_CONTROLER.c,28 :: 		dato[0]=189;                  //      caracter de sincronizacion de transmision
	MOVLW       189
	MOVWF       main_dato_L0+0 
;MASTER_CONTROLER.c,29 :: 		dato[1]=0;        //      meñique
	CLRF        main_dato_L0+1 
;MASTER_CONTROLER.c,30 :: 		dato[2]=0;        //
	CLRF        main_dato_L0+2 
;MASTER_CONTROLER.c,31 :: 		dato[3]=0;        //
	CLRF        main_dato_L0+3 
;MASTER_CONTROLER.c,32 :: 		dato[4]=0;        //
	CLRF        main_dato_L0+4 
;MASTER_CONTROLER.c,33 :: 		dato[5]=0;        //      pulgar
	CLRF        main_dato_L0+5 
;MASTER_CONTROLER.c,34 :: 		INTCON=0b10100000;            //      palabra de control de interrupciones
	MOVLW       160
	MOVWF       INTCON+0 
;MASTER_CONTROLER.c,35 :: 		T0CON=0b10000000;             //      palabra de control del Timer 0
	MOVLW       128
	MOVWF       T0CON+0 
;MASTER_CONTROLER.c,36 :: 		TRISD=0b11111110;
	MOVLW       254
	MOVWF       TRISD+0 
;MASTER_CONTROLER.c,37 :: 		UART1_Init(9600);             //      inicializacion del modulo USART1
	MOVLW       175
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;MASTER_CONTROLER.c,39 :: 		while(1){
L_main6:
;MASTER_CONTROLER.c,40 :: 		s1=PORTD.F1;     //   <--|
	BTFSC       PORTD+0, 1 
	GOTO        L__main54
	BCF         main_s1_L0+0, BitPos(main_s1_L0+0) 
	GOTO        L__main55
L__main54:
	BSF         main_s1_L0+0, BitPos(main_s1_L0+0) 
L__main55:
;MASTER_CONTROLER.c,41 :: 		s2=PORTD.F2;     //      |
	BTFSC       PORTD+0, 2 
	GOTO        L__main56
	BCF         main_s2_L0+0, BitPos(main_s2_L0+0) 
	GOTO        L__main57
L__main56:
	BSF         main_s2_L0+0, BitPos(main_s2_L0+0) 
L__main57:
;MASTER_CONTROLER.c,42 :: 		s3=PORTD.F3;     //      |-----sensores de presion(pulsadores)
	BTFSC       PORTD+0, 3 
	GOTO        L__main58
	BCF         main_s3_L0+0, BitPos(main_s3_L0+0) 
	GOTO        L__main59
L__main58:
	BSF         main_s3_L0+0, BitPos(main_s3_L0+0) 
L__main59:
;MASTER_CONTROLER.c,43 :: 		s4=PORTD.F4;     //      |
	BTFSC       PORTD+0, 4 
	GOTO        L__main60
	BCF         main_s4_L0+0, BitPos(main_s4_L0+0) 
	GOTO        L__main61
L__main60:
	BSF         main_s4_L0+0, BitPos(main_s4_L0+0) 
L__main61:
;MASTER_CONTROLER.c,44 :: 		s5=PORTD.F5;     //   <--|
	BTFSC       PORTD+0, 5 
	GOTO        L__main62
	BCF         main_s5_L0+0, BitPos(main_s5_L0+0) 
	GOTO        L__main63
L__main62:
	BSF         main_s5_L0+0, BitPos(main_s5_L0+0) 
L__main63:
;MASTER_CONTROLER.c,45 :: 		control=PORTD.F6;  //     mano cerrada o abierta
	BTFSC       PORTD+0, 6 
	GOTO        L__main64
	BCF         main_control_L0+0, BitPos(main_control_L0+0) 
	GOTO        L__main65
L__main64:
	BSF         main_control_L0+0, BitPos(main_control_L0+0) 
L__main65:
;MASTER_CONTROLER.c,48 :: 		if(control==1) {    //      control de los servomotores 1-5
	BTFSS       main_control_L0+0, BitPos(main_control_L0+0) 
	GOTO        L_main8
;MASTER_CONTROLER.c,49 :: 		delay_ms(5);
	MOVLW       44
	MOVWF       R12, 0
	MOVLW       211
	MOVWF       R13, 0
L_main9:
	DECFSZ      R13, 1, 0
	BRA         L_main9
	DECFSZ      R12, 1, 0
	BRA         L_main9
	NOP
	NOP
;MASTER_CONTROLER.c,50 :: 		angulo=180;
	MOVLW       180
	MOVWF       _angulo+0 
	MOVLW       0
	MOVWF       _angulo+1 
;MASTER_CONTROLER.c,51 :: 		cont++;
	INFSNZ      main_cont_L0+0, 1 
	INCF        main_cont_L0+1, 1 
;MASTER_CONTROLER.c,52 :: 		if(s1==1) dato[1]=dato[1];
	BTFSS       main_s1_L0+0, BitPos(main_s1_L0+0) 
	GOTO        L_main10
	GOTO        L_main11
L_main10:
;MASTER_CONTROLER.c,53 :: 		else if((cont>=0)&&(cont<=180))  dato[1]=cont;
	MOVLW       128
	XORWF       main_cont_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main66
	MOVLW       0
	SUBWF       main_cont_L0+0, 0 
L__main66:
	BTFSS       STATUS+0, 0 
	GOTO        L_main14
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       main_cont_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main67
	MOVF        main_cont_L0+0, 0 
	SUBLW       180
L__main67:
	BTFSS       STATUS+0, 0 
	GOTO        L_main14
L__main51:
	MOVF        main_cont_L0+0, 0 
	MOVWF       main_dato_L0+1 
L_main14:
L_main11:
;MASTER_CONTROLER.c,54 :: 		if(s2==1) dato[2]=dato[2];
	BTFSS       main_s2_L0+0, BitPos(main_s2_L0+0) 
	GOTO        L_main15
	GOTO        L_main16
L_main15:
;MASTER_CONTROLER.c,55 :: 		else if((cont>=10)&&(cont<=190))  dato[2]=cont-10;
	MOVLW       128
	XORWF       main_cont_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main68
	MOVLW       10
	SUBWF       main_cont_L0+0, 0 
L__main68:
	BTFSS       STATUS+0, 0 
	GOTO        L_main19
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       main_cont_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main69
	MOVF        main_cont_L0+0, 0 
	SUBLW       190
L__main69:
	BTFSS       STATUS+0, 0 
	GOTO        L_main19
L__main50:
	MOVLW       10
	SUBWF       main_cont_L0+0, 0 
	MOVWF       main_dato_L0+2 
L_main19:
L_main16:
;MASTER_CONTROLER.c,56 :: 		if(s3==1) dato[3]=dato[3];
	BTFSS       main_s3_L0+0, BitPos(main_s3_L0+0) 
	GOTO        L_main20
	GOTO        L_main21
L_main20:
;MASTER_CONTROLER.c,57 :: 		else if((cont>=20)&&(cont<=200))  dato[3]=cont-20;
	MOVLW       128
	XORWF       main_cont_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main70
	MOVLW       20
	SUBWF       main_cont_L0+0, 0 
L__main70:
	BTFSS       STATUS+0, 0 
	GOTO        L_main24
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       main_cont_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main71
	MOVF        main_cont_L0+0, 0 
	SUBLW       200
L__main71:
	BTFSS       STATUS+0, 0 
	GOTO        L_main24
L__main49:
	MOVLW       20
	SUBWF       main_cont_L0+0, 0 
	MOVWF       main_dato_L0+3 
L_main24:
L_main21:
;MASTER_CONTROLER.c,58 :: 		if(s4==1) dato[4]=dato[4];
	BTFSS       main_s4_L0+0, BitPos(main_s4_L0+0) 
	GOTO        L_main25
	GOTO        L_main26
L_main25:
;MASTER_CONTROLER.c,59 :: 		else if((cont>=30)&&(cont<=210))  dato[4]=cont-30;
	MOVLW       128
	XORWF       main_cont_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main72
	MOVLW       30
	SUBWF       main_cont_L0+0, 0 
L__main72:
	BTFSS       STATUS+0, 0 
	GOTO        L_main29
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       main_cont_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main73
	MOVF        main_cont_L0+0, 0 
	SUBLW       210
L__main73:
	BTFSS       STATUS+0, 0 
	GOTO        L_main29
L__main48:
	MOVLW       30
	SUBWF       main_cont_L0+0, 0 
	MOVWF       main_dato_L0+4 
L_main29:
L_main26:
;MASTER_CONTROLER.c,60 :: 		if(s5==1) dato[5]=dato[5];
	BTFSS       main_s5_L0+0, BitPos(main_s5_L0+0) 
	GOTO        L_main30
	GOTO        L_main31
L_main30:
;MASTER_CONTROLER.c,61 :: 		else if((cont>=40)&&(cont<=220))  dato[5]=cont-40;
	MOVLW       128
	XORWF       main_cont_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main74
	MOVLW       40
	SUBWF       main_cont_L0+0, 0 
L__main74:
	BTFSS       STATUS+0, 0 
	GOTO        L_main34
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       main_cont_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main75
	MOVF        main_cont_L0+0, 0 
	SUBLW       220
L__main75:
	BTFSS       STATUS+0, 0 
	GOTO        L_main34
L__main47:
	MOVLW       40
	SUBWF       main_cont_L0+0, 0 
	MOVWF       main_dato_L0+5 
L_main34:
L_main31:
;MASTER_CONTROLER.c,62 :: 		}
	GOTO        L_main35
L_main8:
;MASTER_CONTROLER.c,64 :: 		delay_ms(5);
	MOVLW       44
	MOVWF       R12, 0
	MOVLW       211
	MOVWF       R13, 0
L_main36:
	DECFSZ      R13, 1, 0
	BRA         L_main36
	DECFSZ      R12, 1, 0
	BRA         L_main36
	NOP
	NOP
;MASTER_CONTROLER.c,65 :: 		cont=0;
	CLRF        main_cont_L0+0 
	CLRF        main_cont_L0+1 
;MASTER_CONTROLER.c,66 :: 		dato[1]=cont;
	CLRF        main_dato_L0+1 
;MASTER_CONTROLER.c,67 :: 		dato[2]=cont;
	CLRF        main_dato_L0+2 
;MASTER_CONTROLER.c,68 :: 		dato[3]=cont;
	CLRF        main_dato_L0+3 
;MASTER_CONTROLER.c,69 :: 		dato[4]=cont;
	CLRF        main_dato_L0+4 
;MASTER_CONTROLER.c,70 :: 		dato[5]=cont;
	CLRF        main_dato_L0+5 
;MASTER_CONTROLER.c,71 :: 		}
L_main35:
;MASTER_CONTROLER.c,72 :: 		if(cont>=220) cont=220;
	MOVLW       128
	XORWF       main_cont_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main76
	MOVLW       220
	SUBWF       main_cont_L0+0, 0 
L__main76:
	BTFSS       STATUS+0, 0 
	GOTO        L_main37
	MOVLW       220
	MOVWF       main_cont_L0+0 
	MOVLW       0
	MOVWF       main_cont_L0+1 
	GOTO        L_main38
L_main37:
;MASTER_CONTROLER.c,73 :: 		else cont=cont;
L_main38:
;MASTER_CONTROLER.c,78 :: 		UART1_Write(dato[0]);  //       envio de los datos por el canal Tx
	MOVF        main_dato_L0+0, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;MASTER_CONTROLER.c,79 :: 		delay_us(1500);
	MOVLW       14
	MOVWF       R12, 0
	MOVLW       36
	MOVWF       R13, 0
L_main39:
	DECFSZ      R13, 1, 0
	BRA         L_main39
	DECFSZ      R12, 1, 0
	BRA         L_main39
	NOP
	NOP
;MASTER_CONTROLER.c,80 :: 		UART1_Write(dato[1]);
	MOVF        main_dato_L0+1, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;MASTER_CONTROLER.c,81 :: 		delay_us(1500);
	MOVLW       14
	MOVWF       R12, 0
	MOVLW       36
	MOVWF       R13, 0
L_main40:
	DECFSZ      R13, 1, 0
	BRA         L_main40
	DECFSZ      R12, 1, 0
	BRA         L_main40
	NOP
	NOP
;MASTER_CONTROLER.c,82 :: 		UART1_Write(dato[2]);
	MOVF        main_dato_L0+2, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;MASTER_CONTROLER.c,83 :: 		delay_us(1500);
	MOVLW       14
	MOVWF       R12, 0
	MOVLW       36
	MOVWF       R13, 0
L_main41:
	DECFSZ      R13, 1, 0
	BRA         L_main41
	DECFSZ      R12, 1, 0
	BRA         L_main41
	NOP
	NOP
;MASTER_CONTROLER.c,84 :: 		UART1_Write(dato[3]);
	MOVF        main_dato_L0+3, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;MASTER_CONTROLER.c,85 :: 		delay_us(1500);
	MOVLW       14
	MOVWF       R12, 0
	MOVLW       36
	MOVWF       R13, 0
L_main42:
	DECFSZ      R13, 1, 0
	BRA         L_main42
	DECFSZ      R12, 1, 0
	BRA         L_main42
	NOP
	NOP
;MASTER_CONTROLER.c,86 :: 		UART1_Write(dato[4]);
	MOVF        main_dato_L0+4, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;MASTER_CONTROLER.c,87 :: 		delay_us(1500);
	MOVLW       14
	MOVWF       R12, 0
	MOVLW       36
	MOVWF       R13, 0
L_main43:
	DECFSZ      R13, 1, 0
	BRA         L_main43
	DECFSZ      R12, 1, 0
	BRA         L_main43
	NOP
	NOP
;MASTER_CONTROLER.c,88 :: 		UART1_Write(dato[5]);
	MOVF        main_dato_L0+5, 0 
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;MASTER_CONTROLER.c,89 :: 		delay_us(1500);
	MOVLW       14
	MOVWF       R12, 0
	MOVLW       36
	MOVWF       R13, 0
L_main44:
	DECFSZ      R13, 1, 0
	BRA         L_main44
	DECFSZ      R12, 1, 0
	BRA         L_main44
	NOP
	NOP
;MASTER_CONTROLER.c,90 :: 		if(control==0) {
	BTFSC       main_control_L0+0, BitPos(main_control_L0+0) 
	GOTO        L_main45
;MASTER_CONTROLER.c,91 :: 		delay_ms(250);
	MOVLW       9
	MOVWF       R11, 0
	MOVLW       144
	MOVWF       R12, 0
	MOVLW       135
	MOVWF       R13, 0
L_main46:
	DECFSZ      R13, 1, 0
	BRA         L_main46
	DECFSZ      R12, 1, 0
	BRA         L_main46
	DECFSZ      R11, 1, 0
	BRA         L_main46
;MASTER_CONTROLER.c,92 :: 		angulo=80;
	MOVLW       80
	MOVWF       _angulo+0 
	MOVLW       0
	MOVWF       _angulo+1 
;MASTER_CONTROLER.c,93 :: 		}
L_main45:
;MASTER_CONTROLER.c,96 :: 		}
	GOTO        L_main6
;MASTER_CONTROLER.c,97 :: 		}
	GOTO        $+0
; end of _main
