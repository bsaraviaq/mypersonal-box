
_MPU_Write:

;GYROS_ACCEL_PIC.c,15 :: 		void  MPU_Write(unsigned short add,unsigned short dato)
;GYROS_ACCEL_PIC.c,17 :: 		I2C1_Start();
	CALL        _I2C1_Start+0, 0
;GYROS_ACCEL_PIC.c,18 :: 		I2C1_Wr(W_DATA);
	MOVF        _W_DATA+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;GYROS_ACCEL_PIC.c,19 :: 		I2C1_Wr(add);
	MOVF        FARG_MPU_Write_add+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;GYROS_ACCEL_PIC.c,20 :: 		I2C1_Wr(dato);
	MOVF        FARG_MPU_Write_dato+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;GYROS_ACCEL_PIC.c,21 :: 		I2C1_Stop();
	CALL        _I2C1_Stop+0, 0
;GYROS_ACCEL_PIC.c,22 :: 		delay_ms(50);
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
;GYROS_ACCEL_PIC.c,23 :: 		}
	RETURN      0
; end of _MPU_Write

_MPU_Read:

;GYROS_ACCEL_PIC.c,24 :: 		unsigned short MPU_Read(unsigned short add)
;GYROS_ACCEL_PIC.c,27 :: 		I2C1_Start();
	CALL        _I2C1_Start+0, 0
;GYROS_ACCEL_PIC.c,28 :: 		I2C1_Wr(W_DATA);
	MOVF        _W_DATA+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;GYROS_ACCEL_PIC.c,29 :: 		I2C1_Wr(add);
	MOVF        FARG_MPU_Read_add+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;GYROS_ACCEL_PIC.c,30 :: 		I2C1_Repeated_Start();
	CALL        _I2C1_Repeated_Start+0, 0
;GYROS_ACCEL_PIC.c,31 :: 		I2C1_Wr(R_DATA);
	MOVF        _R_DATA+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;GYROS_ACCEL_PIC.c,32 :: 		res=I2C1_Rd(0u);
	CLRF        FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVF        R0, 0 
	MOVWF       MPU_Read_res_L0+0 
;GYROS_ACCEL_PIC.c,33 :: 		I2C1_Stop();
	CALL        _I2C1_Stop+0, 0
;GYROS_ACCEL_PIC.c,34 :: 		return res;
	MOVF        MPU_Read_res_L0+0, 0 
	MOVWF       R0 
;GYROS_ACCEL_PIC.c,35 :: 		}
	RETURN      0
; end of _MPU_Read

_MPU6050_Init:

;GYROS_ACCEL_PIC.c,36 :: 		void  MPU6050_Init(void)
;GYROS_ACCEL_PIC.c,38 :: 		MPU_Write(0x6B,0x80);
	MOVLW       107
	MOVWF       FARG_MPU_Write_add+0 
	MOVLW       128
	MOVWF       FARG_MPU_Write_dato+0 
	CALL        _MPU_Write+0, 0
;GYROS_ACCEL_PIC.c,39 :: 		MPU_Write(0x6B,0x00);
	MOVLW       107
	MOVWF       FARG_MPU_Write_add+0 
	CLRF        FARG_MPU_Write_dato+0 
	CALL        _MPU_Write+0, 0
;GYROS_ACCEL_PIC.c,40 :: 		MPU_Write(0x1B,0x00);
	MOVLW       27
	MOVWF       FARG_MPU_Write_add+0 
	CLRF        FARG_MPU_Write_dato+0 
	CALL        _MPU_Write+0, 0
;GYROS_ACCEL_PIC.c,41 :: 		MPU_Write(0x1C,0x00);
	MOVLW       28
	MOVWF       FARG_MPU_Write_add+0 
	CLRF        FARG_MPU_Write_dato+0 
	CALL        _MPU_Write+0, 0
;GYROS_ACCEL_PIC.c,42 :: 		}
	RETURN      0
; end of _MPU6050_Init

_main:

;GYROS_ACCEL_PIC.c,44 :: 		void main()
;GYROS_ACCEL_PIC.c,50 :: 		TRISD.F0=0;
	BCF         TRISD+0, 0 
;GYROS_ACCEL_PIC.c,51 :: 		PORTD.F0=0;
	BCF         PORTD+0, 0 
;GYROS_ACCEL_PIC.c,52 :: 		ADCON1.F3=1;
	BSF         ADCON1+0, 3 
;GYROS_ACCEL_PIC.c,53 :: 		ADCON1.F2=1;
	BSF         ADCON1+0, 2 
;GYROS_ACCEL_PIC.c,54 :: 		ADCON1.F1=1;
	BSF         ADCON1+0, 1 
;GYROS_ACCEL_PIC.c,55 :: 		ADCON1.F0=1;
	BSF         ADCON1+0, 0 
;GYROS_ACCEL_PIC.c,56 :: 		UART1_Init(9600);
	MOVLW       77
	MOVWF       SPBRG+0 
	BCF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;GYROS_ACCEL_PIC.c,57 :: 		I2C1_Init(100000);
	MOVLW       120
	MOVWF       SSPADD+0 
	CALL        _I2C1_Init+0, 0
;GYROS_ACCEL_PIC.c,58 :: 		MPU6050_Init();
	CALL        _MPU6050_Init+0, 0
;GYROS_ACCEL_PIC.c,61 :: 		while(1)
L_main1:
;GYROS_ACCEL_PIC.c,63 :: 		PORTD.F0=0;
	BCF         PORTD+0, 0 
;GYROS_ACCEL_PIC.c,64 :: 		delay_ms(500);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 0
	BRA         L_main3
	DECFSZ      R12, 1, 0
	BRA         L_main3
	DECFSZ      R11, 1, 0
	BRA         L_main3
	NOP
;GYROS_ACCEL_PIC.c,65 :: 		PORTD.F0=1;
	BSF         PORTD+0, 0 
;GYROS_ACCEL_PIC.c,66 :: 		delay_ms(500);
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
;GYROS_ACCEL_PIC.c,68 :: 		temp[1]=(MPU_Read(0x41)<<8)+MPU_Read(0x42);
	MOVLW       65
	MOVWF       FARG_MPU_Read_add+0 
	CALL        _MPU_Read+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+1 
	CLRF        FLOC__main+0 
	MOVLW       66
	MOVWF       FARG_MPU_Read_add+0 
	CALL        _MPU_Read+0, 0
	MOVLW       0
	MOVWF       R1 
	MOVF        FLOC__main+0, 0 
	ADDWF       R0, 1 
	MOVF        FLOC__main+1, 0 
	ADDWFC      R1, 1 
;GYROS_ACCEL_PIC.c,69 :: 		temp[1]=(temp[1]+11900)/340;
	MOVLW       124
	ADDWF       R0, 1 
	MOVLW       46
	ADDWFC      R1, 1 
	MOVLW       84
	MOVWF       R4 
	MOVLW       1
	MOVWF       R5 
	CALL        _Div_16x16_S+0, 0
;GYROS_ACCEL_PIC.c,70 :: 		inttostr(temp[1],txt0);
	MOVF        R0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       main_txt0_L0+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(main_txt0_L0+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;GYROS_ACCEL_PIC.c,71 :: 		UART1_Write_Text(txt0);
	MOVLW       main_txt0_L0+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(main_txt0_L0+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;GYROS_ACCEL_PIC.c,72 :: 		UART1_Write_Text(" [°C]");
	MOVLW       ?lstr1_GYROS_ACCEL_PIC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr1_GYROS_ACCEL_PIC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;GYROS_ACCEL_PIC.c,73 :: 		UART1_Write(0x0D);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GYROS_ACCEL_PIC.c,74 :: 		UART1_Write(0x0A);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GYROS_ACCEL_PIC.c,77 :: 		gyro[1]=(MPU_Read(0x43)<<8)+MPU_Read(0x44);
	MOVLW       67
	MOVWF       FARG_MPU_Read_add+0 
	CALL        _MPU_Read+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+1 
	CLRF        FLOC__main+0 
	MOVLW       68
	MOVWF       FARG_MPU_Read_add+0 
	CALL        _MPU_Read+0, 0
	MOVF        R0, 0 
	ADDWF       FLOC__main+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVLW       0
	ADDWFC      FLOC__main+1, 0 
	MOVWF       FARG_IntToStr_input+1 
;GYROS_ACCEL_PIC.c,78 :: 		inttostr(gyro[1],txt0);
	MOVLW       main_txt0_L0+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(main_txt0_L0+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;GYROS_ACCEL_PIC.c,79 :: 		UART1_Write_Text(txt0);
	MOVLW       main_txt0_L0+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(main_txt0_L0+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;GYROS_ACCEL_PIC.c,80 :: 		UART1_Write_Text("  ");
	MOVLW       ?lstr2_GYROS_ACCEL_PIC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr2_GYROS_ACCEL_PIC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;GYROS_ACCEL_PIC.c,83 :: 		gyro[2]=(MPU_Read(0x45)<<8)+MPU_Read(0x46);
	MOVLW       69
	MOVWF       FARG_MPU_Read_add+0 
	CALL        _MPU_Read+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+1 
	CLRF        FLOC__main+0 
	MOVLW       70
	MOVWF       FARG_MPU_Read_add+0 
	CALL        _MPU_Read+0, 0
	MOVF        R0, 0 
	ADDWF       FLOC__main+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVLW       0
	ADDWFC      FLOC__main+1, 0 
	MOVWF       FARG_IntToStr_input+1 
;GYROS_ACCEL_PIC.c,84 :: 		inttostr(gyro[2],txt0);
	MOVLW       main_txt0_L0+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(main_txt0_L0+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;GYROS_ACCEL_PIC.c,85 :: 		UART1_Write_Text(txt0);
	MOVLW       main_txt0_L0+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(main_txt0_L0+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;GYROS_ACCEL_PIC.c,86 :: 		UART1_Write_Text("  ");
	MOVLW       ?lstr3_GYROS_ACCEL_PIC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr3_GYROS_ACCEL_PIC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;GYROS_ACCEL_PIC.c,89 :: 		gyro[3]=(MPU_Read(0x47)<<8)+MPU_Read(0x48);
	MOVLW       71
	MOVWF       FARG_MPU_Read_add+0 
	CALL        _MPU_Read+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+1 
	CLRF        FLOC__main+0 
	MOVLW       72
	MOVWF       FARG_MPU_Read_add+0 
	CALL        _MPU_Read+0, 0
	MOVF        R0, 0 
	ADDWF       FLOC__main+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVLW       0
	ADDWFC      FLOC__main+1, 0 
	MOVWF       FARG_IntToStr_input+1 
;GYROS_ACCEL_PIC.c,90 :: 		inttostr(gyro[3],txt0);
	MOVLW       main_txt0_L0+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(main_txt0_L0+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;GYROS_ACCEL_PIC.c,91 :: 		UART1_Write_Text(txt0);
	MOVLW       main_txt0_L0+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(main_txt0_L0+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;GYROS_ACCEL_PIC.c,92 :: 		UART1_Write(0x0D);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GYROS_ACCEL_PIC.c,93 :: 		UART1_Write(0x0A);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GYROS_ACCEL_PIC.c,96 :: 		accel[1]=(MPU_Read(0x3B)<<8)+MPU_Read(0x3C);
	MOVLW       59
	MOVWF       FARG_MPU_Read_add+0 
	CALL        _MPU_Read+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+1 
	CLRF        FLOC__main+0 
	MOVLW       60
	MOVWF       FARG_MPU_Read_add+0 
	CALL        _MPU_Read+0, 0
	MOVF        R0, 0 
	ADDWF       FLOC__main+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVLW       0
	ADDWFC      FLOC__main+1, 0 
	MOVWF       FARG_IntToStr_input+1 
;GYROS_ACCEL_PIC.c,97 :: 		inttostr(accel[1],txt0);
	MOVLW       main_txt0_L0+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(main_txt0_L0+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;GYROS_ACCEL_PIC.c,98 :: 		UART1_Write_Text(txt0);
	MOVLW       main_txt0_L0+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(main_txt0_L0+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;GYROS_ACCEL_PIC.c,99 :: 		UART1_Write_Text("  ");
	MOVLW       ?lstr4_GYROS_ACCEL_PIC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr4_GYROS_ACCEL_PIC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;GYROS_ACCEL_PIC.c,102 :: 		accel[2]=(MPU_Read(0x3D)<<8)+MPU_Read(0x3E);
	MOVLW       61
	MOVWF       FARG_MPU_Read_add+0 
	CALL        _MPU_Read+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+1 
	CLRF        FLOC__main+0 
	MOVLW       62
	MOVWF       FARG_MPU_Read_add+0 
	CALL        _MPU_Read+0, 0
	MOVF        R0, 0 
	ADDWF       FLOC__main+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVLW       0
	ADDWFC      FLOC__main+1, 0 
	MOVWF       FARG_IntToStr_input+1 
;GYROS_ACCEL_PIC.c,103 :: 		inttostr(accel[2],txt0);
	MOVLW       main_txt0_L0+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(main_txt0_L0+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;GYROS_ACCEL_PIC.c,104 :: 		UART1_Write_Text(txt0);
	MOVLW       main_txt0_L0+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(main_txt0_L0+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;GYROS_ACCEL_PIC.c,105 :: 		UART1_Write_Text("  ");
	MOVLW       ?lstr5_GYROS_ACCEL_PIC+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr5_GYROS_ACCEL_PIC+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;GYROS_ACCEL_PIC.c,108 :: 		accel[3]=(MPU_Read(0x3F)<<8)+MPU_Read(0x40);
	MOVLW       63
	MOVWF       FARG_MPU_Read_add+0 
	CALL        _MPU_Read+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__main+1 
	CLRF        FLOC__main+0 
	MOVLW       64
	MOVWF       FARG_MPU_Read_add+0 
	CALL        _MPU_Read+0, 0
	MOVF        R0, 0 
	ADDWF       FLOC__main+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVLW       0
	ADDWFC      FLOC__main+1, 0 
	MOVWF       FARG_IntToStr_input+1 
;GYROS_ACCEL_PIC.c,109 :: 		inttostr(accel[3],txt0);
	MOVLW       main_txt0_L0+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(main_txt0_L0+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;GYROS_ACCEL_PIC.c,110 :: 		UART1_Write_Text(txt0);
	MOVLW       main_txt0_L0+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(main_txt0_L0+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;GYROS_ACCEL_PIC.c,111 :: 		UART1_Write(0x0D);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GYROS_ACCEL_PIC.c,112 :: 		UART1_Write(0x0A);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;GYROS_ACCEL_PIC.c,114 :: 		}
	GOTO        L_main1
;GYROS_ACCEL_PIC.c,115 :: 		}
	GOTO        $+0
; end of _main
