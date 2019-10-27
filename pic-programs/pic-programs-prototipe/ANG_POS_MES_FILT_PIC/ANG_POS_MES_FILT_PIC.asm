
_MPU_Write:

;ANG_POS_MES_FILT_PIC.c,21 :: 		void  MPU_Write(unsigned short add,unsigned short dato)
;ANG_POS_MES_FILT_PIC.c,23 :: 		I2C1_Start();
	CALL        _I2C1_Start+0, 0
;ANG_POS_MES_FILT_PIC.c,24 :: 		I2C1_Wr(W_DATA);
	MOVF        _W_DATA+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;ANG_POS_MES_FILT_PIC.c,25 :: 		I2C1_Wr(add);
	MOVF        FARG_MPU_Write_add+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;ANG_POS_MES_FILT_PIC.c,26 :: 		I2C1_Wr(dato);
	MOVF        FARG_MPU_Write_dato+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;ANG_POS_MES_FILT_PIC.c,27 :: 		I2C1_Stop();
	CALL        _I2C1_Stop+0, 0
;ANG_POS_MES_FILT_PIC.c,28 :: 		delay_ms(50);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_MPU_Write0:
	DECFSZ      R13, 1, 0
	BRA         L_MPU_Write0
	DECFSZ      R12, 1, 0
	BRA         L_MPU_Write0
	NOP
	NOP
;ANG_POS_MES_FILT_PIC.c,29 :: 		}
	RETURN      0
; end of _MPU_Write

_MPU_Read:

;ANG_POS_MES_FILT_PIC.c,30 :: 		unsigned short MPU_Read(unsigned short add)
;ANG_POS_MES_FILT_PIC.c,33 :: 		I2C1_Start();
	CALL        _I2C1_Start+0, 0
;ANG_POS_MES_FILT_PIC.c,34 :: 		I2C1_Wr(W_DATA);
	MOVF        _W_DATA+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;ANG_POS_MES_FILT_PIC.c,35 :: 		I2C1_Wr(add);
	MOVF        FARG_MPU_Read_add+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;ANG_POS_MES_FILT_PIC.c,36 :: 		I2C1_Repeated_Start();
	CALL        _I2C1_Repeated_Start+0, 0
;ANG_POS_MES_FILT_PIC.c,37 :: 		I2C1_Wr(R_DATA);
	MOVF        _R_DATA+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;ANG_POS_MES_FILT_PIC.c,38 :: 		res=I2C1_Rd(0u);
	CLRF        FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVF        R0, 0 
	MOVWF       MPU_Read_res_L0+0 
;ANG_POS_MES_FILT_PIC.c,39 :: 		I2C1_Stop();
	CALL        _I2C1_Stop+0, 0
;ANG_POS_MES_FILT_PIC.c,40 :: 		return res;
	MOVF        MPU_Read_res_L0+0, 0 
	MOVWF       R0 
;ANG_POS_MES_FILT_PIC.c,41 :: 		}
	RETURN      0
; end of _MPU_Read

_MPU6050_Init:

;ANG_POS_MES_FILT_PIC.c,42 :: 		void  MPU6050_Init(void)
;ANG_POS_MES_FILT_PIC.c,44 :: 		MPU_Write(0x6B,0x80);
	MOVLW       107
	MOVWF       FARG_MPU_Write_add+0 
	MOVLW       128
	MOVWF       FARG_MPU_Write_dato+0 
	CALL        _MPU_Write+0, 0
;ANG_POS_MES_FILT_PIC.c,45 :: 		MPU_Write(0x6B,0x00);
	MOVLW       107
	MOVWF       FARG_MPU_Write_add+0 
	CLRF        FARG_MPU_Write_dato+0 
	CALL        _MPU_Write+0, 0
;ANG_POS_MES_FILT_PIC.c,46 :: 		MPU_Write(0x1B,0x00);
	MOVLW       27
	MOVWF       FARG_MPU_Write_add+0 
	CLRF        FARG_MPU_Write_dato+0 
	CALL        _MPU_Write+0, 0
;ANG_POS_MES_FILT_PIC.c,47 :: 		MPU_Write(0x1C,0x00);
	MOVLW       28
	MOVWF       FARG_MPU_Write_add+0 
	CLRF        FARG_MPU_Write_dato+0 
	CALL        _MPU_Write+0, 0
;ANG_POS_MES_FILT_PIC.c,48 :: 		}
	RETURN      0
; end of _MPU6050_Init

_interrupt:

;ANG_POS_MES_FILT_PIC.c,49 :: 		void interrupt()
;ANG_POS_MES_FILT_PIC.c,51 :: 		if(INTCON.F2)
	BTFSS       INTCON+0, 2 
	GOTO        L_interrupt1
;ANG_POS_MES_FILT_PIC.c,53 :: 		TMR0H=0x63;
	MOVLW       99
	MOVWF       TMR0H+0 
;ANG_POS_MES_FILT_PIC.c,54 :: 		TMR0L=0xC0;
	MOVLW       192
	MOVWF       TMR0L+0 
;ANG_POS_MES_FILT_PIC.c,56 :: 		if (aux==1) {MPU6050_Init();aux=0;}     // inicializacion del modulo MPU
	MOVF        _aux+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt2
	CALL        _MPU6050_Init+0, 0
	CLRF        _aux+0 
L_interrupt2:
;ANG_POS_MES_FILT_PIC.c,58 :: 		accel[1]=(MPU_Read(0x3B)<<8)+MPU_Read(0x3C);
	MOVLW       59
	MOVWF       FARG_MPU_Read_add+0 
	CALL        _MPU_Read+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__interrupt+1 
	CLRF        FLOC__interrupt+0 
	MOVLW       60
	MOVWF       FARG_MPU_Read_add+0 
	CALL        _MPU_Read+0, 0
	MOVF        R0, 0 
	ADDWF       FLOC__interrupt+0, 0 
	MOVWF       _accel+2 
	MOVLW       0
	ADDWFC      FLOC__interrupt+1, 0 
	MOVWF       _accel+3 
;ANG_POS_MES_FILT_PIC.c,59 :: 		accel[3]=(MPU_Read(0x3F)<<8)+MPU_Read(0x40);
	MOVLW       63
	MOVWF       FARG_MPU_Read_add+0 
	CALL        _MPU_Read+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__interrupt+1 
	CLRF        FLOC__interrupt+0 
	MOVLW       64
	MOVWF       FARG_MPU_Read_add+0 
	CALL        _MPU_Read+0, 0
	MOVF        R0, 0 
	ADDWF       FLOC__interrupt+0, 0 
	MOVWF       _accel+6 
	MOVLW       0
	ADDWFC      FLOC__interrupt+1, 0 
	MOVWF       _accel+7 
;ANG_POS_MES_FILT_PIC.c,60 :: 		ang=atan((accel[1]*1.0)/(accel[3]*1.0))*57.295779+90.0;    // calculo del angulo de inclinacion
	MOVF        _accel+2, 0 
	MOVWF       R0 
	MOVF        _accel+3, 0 
	MOVWF       R1 
	CALL        _Int2Double+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__interrupt+0 
	MOVF        R1, 0 
	MOVWF       FLOC__interrupt+1 
	MOVF        R2, 0 
	MOVWF       FLOC__interrupt+2 
	MOVF        R3, 0 
	MOVWF       FLOC__interrupt+3 
	MOVF        _accel+6, 0 
	MOVWF       R0 
	MOVF        _accel+7, 0 
	MOVWF       R1 
	CALL        _Int2Double+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        FLOC__interrupt+0, 0 
	MOVWF       R0 
	MOVF        FLOC__interrupt+1, 0 
	MOVWF       R1 
	MOVF        FLOC__interrupt+2, 0 
	MOVWF       R2 
	MOVF        FLOC__interrupt+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_atan_f+0 
	MOVF        R1, 0 
	MOVWF       FARG_atan_f+1 
	MOVF        R2, 0 
	MOVWF       FARG_atan_f+2 
	MOVF        R3, 0 
	MOVWF       FARG_atan_f+3 
	CALL        _atan+0, 0
	MOVLW       225
	MOVWF       R4 
	MOVLW       46
	MOVWF       R5 
	MOVLW       101
	MOVWF       R6 
	MOVLW       132
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       52
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _ang+0 
	MOVF        R1, 0 
	MOVWF       _ang+1 
	MOVF        R2, 0 
	MOVWF       _ang+2 
	MOVF        R3, 0 
	MOVWF       _ang+3 
;ANG_POS_MES_FILT_PIC.c,61 :: 		angf=3.88*(0.0375*ang+0.0440*ang_1+0.0474*ang_2+0.0474*ang_3+0.0440*ang_4+0.0375*ang_5);       //  aplicaicon del filtro digital
	MOVLW       154
	MOVWF       R4 
	MOVLW       153
	MOVWF       R5 
	MOVLW       25
	MOVWF       R6 
	MOVLW       122
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__interrupt+0 
	MOVF        R1, 0 
	MOVWF       FLOC__interrupt+1 
	MOVF        R2, 0 
	MOVWF       FLOC__interrupt+2 
	MOVF        R3, 0 
	MOVWF       FLOC__interrupt+3 
	MOVLW       88
	MOVWF       R0 
	MOVLW       57
	MOVWF       R1 
	MOVLW       52
	MOVWF       R2 
	MOVLW       122
	MOVWF       R3 
	MOVF        _ang_1+0, 0 
	MOVWF       R4 
	MOVF        _ang_1+1, 0 
	MOVWF       R5 
	MOVF        _ang_1+2, 0 
	MOVWF       R6 
	MOVF        _ang_1+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        FLOC__interrupt+0, 0 
	MOVWF       R4 
	MOVF        FLOC__interrupt+1, 0 
	MOVWF       R5 
	MOVF        FLOC__interrupt+2, 0 
	MOVWF       R6 
	MOVF        FLOC__interrupt+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__interrupt+0 
	MOVF        R1, 0 
	MOVWF       FLOC__interrupt+1 
	MOVF        R2, 0 
	MOVWF       FLOC__interrupt+2 
	MOVF        R3, 0 
	MOVWF       FLOC__interrupt+3 
	MOVLW       129
	MOVWF       R0 
	MOVLW       38
	MOVWF       R1 
	MOVLW       66
	MOVWF       R2 
	MOVLW       122
	MOVWF       R3 
	MOVF        _ang_2+0, 0 
	MOVWF       R4 
	MOVF        _ang_2+1, 0 
	MOVWF       R5 
	MOVF        _ang_2+2, 0 
	MOVWF       R6 
	MOVF        _ang_2+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        FLOC__interrupt+0, 0 
	MOVWF       R4 
	MOVF        FLOC__interrupt+1, 0 
	MOVWF       R5 
	MOVF        FLOC__interrupt+2, 0 
	MOVWF       R6 
	MOVF        FLOC__interrupt+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__interrupt+0 
	MOVF        R1, 0 
	MOVWF       FLOC__interrupt+1 
	MOVF        R2, 0 
	MOVWF       FLOC__interrupt+2 
	MOVF        R3, 0 
	MOVWF       FLOC__interrupt+3 
	MOVLW       129
	MOVWF       R0 
	MOVLW       38
	MOVWF       R1 
	MOVLW       66
	MOVWF       R2 
	MOVLW       122
	MOVWF       R3 
	MOVF        _ang_3+0, 0 
	MOVWF       R4 
	MOVF        _ang_3+1, 0 
	MOVWF       R5 
	MOVF        _ang_3+2, 0 
	MOVWF       R6 
	MOVF        _ang_3+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        FLOC__interrupt+0, 0 
	MOVWF       R4 
	MOVF        FLOC__interrupt+1, 0 
	MOVWF       R5 
	MOVF        FLOC__interrupt+2, 0 
	MOVWF       R6 
	MOVF        FLOC__interrupt+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__interrupt+0 
	MOVF        R1, 0 
	MOVWF       FLOC__interrupt+1 
	MOVF        R2, 0 
	MOVWF       FLOC__interrupt+2 
	MOVF        R3, 0 
	MOVWF       FLOC__interrupt+3 
	MOVLW       88
	MOVWF       R0 
	MOVLW       57
	MOVWF       R1 
	MOVLW       52
	MOVWF       R2 
	MOVLW       122
	MOVWF       R3 
	MOVF        _ang_4+0, 0 
	MOVWF       R4 
	MOVF        _ang_4+1, 0 
	MOVWF       R5 
	MOVF        _ang_4+2, 0 
	MOVWF       R6 
	MOVF        _ang_4+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        FLOC__interrupt+0, 0 
	MOVWF       R4 
	MOVF        FLOC__interrupt+1, 0 
	MOVWF       R5 
	MOVF        FLOC__interrupt+2, 0 
	MOVWF       R6 
	MOVF        FLOC__interrupt+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__interrupt+0 
	MOVF        R1, 0 
	MOVWF       FLOC__interrupt+1 
	MOVF        R2, 0 
	MOVWF       FLOC__interrupt+2 
	MOVF        R3, 0 
	MOVWF       FLOC__interrupt+3 
	MOVLW       154
	MOVWF       R0 
	MOVLW       153
	MOVWF       R1 
	MOVLW       25
	MOVWF       R2 
	MOVLW       122
	MOVWF       R3 
	MOVF        _ang_5+0, 0 
	MOVWF       R4 
	MOVF        _ang_5+1, 0 
	MOVWF       R5 
	MOVF        _ang_5+2, 0 
	MOVWF       R6 
	MOVF        _ang_5+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        FLOC__interrupt+0, 0 
	MOVWF       R4 
	MOVF        FLOC__interrupt+1, 0 
	MOVWF       R5 
	MOVF        FLOC__interrupt+2, 0 
	MOVWF       R6 
	MOVF        FLOC__interrupt+3, 0 
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVLW       236
	MOVWF       R4 
	MOVLW       81
	MOVWF       R5 
	MOVLW       120
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _angf+0 
	MOVF        R1, 0 
	MOVWF       _angf+1 
	MOVF        R2, 0 
	MOVWF       _angf+2 
	MOVF        R3, 0 
	MOVWF       _angf+3 
;ANG_POS_MES_FILT_PIC.c,62 :: 		floattostr(angf,txt0);
	MOVF        R0, 0 
	MOVWF       FARG_FloatToStr_fnum+0 
	MOVF        R1, 0 
	MOVWF       FARG_FloatToStr_fnum+1 
	MOVF        R2, 0 
	MOVWF       FARG_FloatToStr_fnum+2 
	MOVF        R3, 0 
	MOVWF       FARG_FloatToStr_fnum+3 
	MOVLW       _txt0+0
	MOVWF       FARG_FloatToStr_str+0 
	MOVLW       hi_addr(_txt0+0)
	MOVWF       FARG_FloatToStr_str+1 
	CALL        _FloatToStr+0, 0
;ANG_POS_MES_FILT_PIC.c,63 :: 		UART1_Write_Text(txt0);
	MOVLW       _txt0+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_txt0+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;ANG_POS_MES_FILT_PIC.c,64 :: 		UART1_Write(0x0D);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;ANG_POS_MES_FILT_PIC.c,65 :: 		UART1_Write(0x0A);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;ANG_POS_MES_FILT_PIC.c,66 :: 		PORTD.F0=1;
	BSF         PORTD+0, 0 
;ANG_POS_MES_FILT_PIC.c,67 :: 		delay_ms(1);
	MOVLW       3
	MOVWF       R12, 0
	MOVLW       151
	MOVWF       R13, 0
L_interrupt3:
	DECFSZ      R13, 1, 0
	BRA         L_interrupt3
	DECFSZ      R12, 1, 0
	BRA         L_interrupt3
	NOP
	NOP
;ANG_POS_MES_FILT_PIC.c,68 :: 		PORTD.F0=0;
	BCF         PORTD+0, 0 
;ANG_POS_MES_FILT_PIC.c,70 :: 		ang_1=ang;
	MOVF        _ang+0, 0 
	MOVWF       _ang_1+0 
	MOVF        _ang+1, 0 
	MOVWF       _ang_1+1 
	MOVF        _ang+2, 0 
	MOVWF       _ang_1+2 
	MOVF        _ang+3, 0 
	MOVWF       _ang_1+3 
;ANG_POS_MES_FILT_PIC.c,71 :: 		ang_2=ang_1;
	MOVF        _ang+0, 0 
	MOVWF       _ang_2+0 
	MOVF        _ang+1, 0 
	MOVWF       _ang_2+1 
	MOVF        _ang+2, 0 
	MOVWF       _ang_2+2 
	MOVF        _ang+3, 0 
	MOVWF       _ang_2+3 
;ANG_POS_MES_FILT_PIC.c,72 :: 		ang_3=ang_2;
	MOVF        _ang+0, 0 
	MOVWF       _ang_3+0 
	MOVF        _ang+1, 0 
	MOVWF       _ang_3+1 
	MOVF        _ang+2, 0 
	MOVWF       _ang_3+2 
	MOVF        _ang+3, 0 
	MOVWF       _ang_3+3 
;ANG_POS_MES_FILT_PIC.c,73 :: 		ang_4=ang_3;
	MOVF        _ang+0, 0 
	MOVWF       _ang_4+0 
	MOVF        _ang+1, 0 
	MOVWF       _ang_4+1 
	MOVF        _ang+2, 0 
	MOVWF       _ang_4+2 
	MOVF        _ang+3, 0 
	MOVWF       _ang_4+3 
;ANG_POS_MES_FILT_PIC.c,74 :: 		ang_5=ang_4;
	MOVF        _ang+0, 0 
	MOVWF       _ang_5+0 
	MOVF        _ang+1, 0 
	MOVWF       _ang_5+1 
	MOVF        _ang+2, 0 
	MOVWF       _ang_5+2 
	MOVF        _ang+3, 0 
	MOVWF       _ang_5+3 
;ANG_POS_MES_FILT_PIC.c,75 :: 		}
L_interrupt1:
;ANG_POS_MES_FILT_PIC.c,76 :: 		INTCON.F2=0;
	BCF         INTCON+0, 2 
;ANG_POS_MES_FILT_PIC.c,77 :: 		}
L__interrupt6:
	RETFIE      1
; end of _interrupt

_main:

;ANG_POS_MES_FILT_PIC.c,80 :: 		void main()
;ANG_POS_MES_FILT_PIC.c,83 :: 		TRISD.F0=0;
	BCF         TRISD+0, 0 
;ANG_POS_MES_FILT_PIC.c,84 :: 		PORTD.F0=0;
	BCF         PORTD+0, 0 
;ANG_POS_MES_FILT_PIC.c,86 :: 		ADCON1.F3=1;
	BSF         ADCON1+0, 3 
;ANG_POS_MES_FILT_PIC.c,87 :: 		ADCON1.F2=1;
	BSF         ADCON1+0, 2 
;ANG_POS_MES_FILT_PIC.c,88 :: 		ADCON1.F1=1;
	BSF         ADCON1+0, 1 
;ANG_POS_MES_FILT_PIC.c,89 :: 		ADCON1.F0=1;
	BSF         ADCON1+0, 0 
;ANG_POS_MES_FILT_PIC.c,91 :: 		OSCCON.F6=1;
	BSF         OSCCON+0, 6 
;ANG_POS_MES_FILT_PIC.c,92 :: 		OSCCON.F5=1;
	BSF         OSCCON+0, 5 
;ANG_POS_MES_FILT_PIC.c,93 :: 		OSCCON.F4=1;
	BSF         OSCCON+0, 4 
;ANG_POS_MES_FILT_PIC.c,94 :: 		UART1_Init(9600);
	MOVLW       51
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;ANG_POS_MES_FILT_PIC.c,95 :: 		I2C1_Init(200000);
	MOVLW       10
	MOVWF       SSPADD+0 
	CALL        _I2C1_Init+0, 0
;ANG_POS_MES_FILT_PIC.c,96 :: 		INTCON=0b10100000;
	MOVLW       160
	MOVWF       INTCON+0 
;ANG_POS_MES_FILT_PIC.c,97 :: 		T0CON=0b10001000;
	MOVLW       136
	MOVWF       T0CON+0 
;ANG_POS_MES_FILT_PIC.c,98 :: 		aux=1;
	MOVLW       1
	MOVWF       _aux+0 
;ANG_POS_MES_FILT_PIC.c,102 :: 		while(1)
L_main4:
;ANG_POS_MES_FILT_PIC.c,103 :: 		{    }
	GOTO        L_main4
;ANG_POS_MES_FILT_PIC.c,104 :: 		}
	GOTO        $+0
; end of _main
