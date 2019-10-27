
_MPU_Write:

;ANG_POS_MES_PIC.c,12 :: 		void  MPU_Write(unsigned short add,unsigned short dato)
;ANG_POS_MES_PIC.c,14 :: 		I2C1_Start();
	CALL        _I2C1_Start+0, 0
;ANG_POS_MES_PIC.c,15 :: 		I2C1_Wr(W_DATA);
	MOVF        _W_DATA+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;ANG_POS_MES_PIC.c,16 :: 		I2C1_Wr(add);
	MOVF        FARG_MPU_Write_add+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;ANG_POS_MES_PIC.c,17 :: 		I2C1_Wr(dato);
	MOVF        FARG_MPU_Write_dato+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;ANG_POS_MES_PIC.c,18 :: 		I2C1_Stop();
	CALL        _I2C1_Stop+0, 0
;ANG_POS_MES_PIC.c,19 :: 		delay_ms(50);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_MPU_Write0:
	DECFSZ      R13, 1, 0
	BRA         L_MPU_Write0
	DECFSZ      R12, 1, 0
	BRA         L_MPU_Write0
	DECFSZ      R11, 1, 0
	BRA         L_MPU_Write0
	NOP
	NOP
;ANG_POS_MES_PIC.c,20 :: 		}
	RETURN      0
; end of _MPU_Write

_MPU_Read:

;ANG_POS_MES_PIC.c,21 :: 		unsigned short MPU_Read(unsigned short add)
;ANG_POS_MES_PIC.c,24 :: 		I2C1_Start();
	CALL        _I2C1_Start+0, 0
;ANG_POS_MES_PIC.c,25 :: 		I2C1_Wr(W_DATA);
	MOVF        _W_DATA+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;ANG_POS_MES_PIC.c,26 :: 		I2C1_Wr(add);
	MOVF        FARG_MPU_Read_add+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;ANG_POS_MES_PIC.c,27 :: 		I2C1_Repeated_Start();
	CALL        _I2C1_Repeated_Start+0, 0
;ANG_POS_MES_PIC.c,28 :: 		I2C1_Wr(R_DATA);
	MOVF        _R_DATA+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;ANG_POS_MES_PIC.c,29 :: 		res=I2C1_Rd(0u);
	CLRF        FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVF        R0, 0 
	MOVWF       MPU_Read_res_L0+0 
;ANG_POS_MES_PIC.c,30 :: 		I2C1_Stop();
	CALL        _I2C1_Stop+0, 0
;ANG_POS_MES_PIC.c,31 :: 		return res;
	MOVF        MPU_Read_res_L0+0, 0 
	MOVWF       R0 
;ANG_POS_MES_PIC.c,32 :: 		}
	RETURN      0
; end of _MPU_Read

_MPU6050_Init:

;ANG_POS_MES_PIC.c,33 :: 		void  MPU6050_Init(void)
;ANG_POS_MES_PIC.c,35 :: 		MPU_Write(0x6B,0x80);
	MOVLW       107
	MOVWF       FARG_MPU_Write_add+0 
	MOVLW       128
	MOVWF       FARG_MPU_Write_dato+0 
	CALL        _MPU_Write+0, 0
;ANG_POS_MES_PIC.c,36 :: 		MPU_Write(0x6B,0x00);
	MOVLW       107
	MOVWF       FARG_MPU_Write_add+0 
	CLRF        FARG_MPU_Write_dato+0 
	CALL        _MPU_Write+0, 0
;ANG_POS_MES_PIC.c,37 :: 		MPU_Write(0x1B,0x00);
	MOVLW       27
	MOVWF       FARG_MPU_Write_add+0 
	CLRF        FARG_MPU_Write_dato+0 
	CALL        _MPU_Write+0, 0
;ANG_POS_MES_PIC.c,38 :: 		MPU_Write(0x1C,0x00);
	MOVLW       28
	MOVWF       FARG_MPU_Write_add+0 
	CLRF        FARG_MPU_Write_dato+0 
	CALL        _MPU_Write+0, 0
;ANG_POS_MES_PIC.c,39 :: 		}
	RETURN      0
; end of _MPU6050_Init

_interrupt:

;ANG_POS_MES_PIC.c,40 :: 		void interrupt()
;ANG_POS_MES_PIC.c,42 :: 		if(INTCON.F2)
	BTFSS       INTCON+0, 2 
	GOTO        L_interrupt1
;ANG_POS_MES_PIC.c,46 :: 		}
L_interrupt1:
;ANG_POS_MES_PIC.c,47 :: 		INTCON.F2=0;
	BCF         INTCON+0, 2 
;ANG_POS_MES_PIC.c,48 :: 		}
L__interrupt6:
	RETFIE      1
; end of _interrupt

_main:

;ANG_POS_MES_PIC.c,51 :: 		void main()
;ANG_POS_MES_PIC.c,57 :: 		TRISD.F0=0;
	BCF         TRISD+0, 0 
;ANG_POS_MES_PIC.c,58 :: 		PORTD.F0=0;
	BCF         PORTD+0, 0 
;ANG_POS_MES_PIC.c,59 :: 		ADCON1.F3=1;
	BSF         ADCON1+0, 3 
;ANG_POS_MES_PIC.c,60 :: 		ADCON1.F2=1;
	BSF         ADCON1+0, 2 
;ANG_POS_MES_PIC.c,61 :: 		ADCON1.F1=1;
	BSF         ADCON1+0, 1 
;ANG_POS_MES_PIC.c,62 :: 		ADCON1.F0=1;
	BSF         ADCON1+0, 0 
;ANG_POS_MES_PIC.c,63 :: 		UART1_Init(115200);
	MOVLW       25
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;ANG_POS_MES_PIC.c,64 :: 		I2C1_Init(100000);
	MOVLW       120
	MOVWF       SSPADD+0 
	CALL        _I2C1_Init+0, 0
;ANG_POS_MES_PIC.c,68 :: 		while(1)
L_main2:
;ANG_POS_MES_PIC.c,70 :: 		PORTD.F0=0;
	BCF         PORTD+0, 0 
;ANG_POS_MES_PIC.c,71 :: 		delay_ms(500);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_main4:
	DECFSZ      R13, 1, 0
	BRA         L_main4
	DECFSZ      R12, 1, 0
	BRA         L_main4
	DECFSZ      R11, 1, 0
	BRA         L_main4
	NOP
;ANG_POS_MES_PIC.c,72 :: 		PORTD.F0=1;
	BSF         PORTD+0, 0 
;ANG_POS_MES_PIC.c,73 :: 		delay_ms(500);
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
;ANG_POS_MES_PIC.c,105 :: 		}
	GOTO        L_main2
;ANG_POS_MES_PIC.c,106 :: 		}
	GOTO        $+0
; end of _main
