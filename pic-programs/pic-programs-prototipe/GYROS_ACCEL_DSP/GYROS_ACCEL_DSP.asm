
_MPU_Write:

;GYROS_ACCEL_DSP.c,15 :: 		void  MPU_Write(unsigned short add,unsigned short dato)
;GYROS_ACCEL_DSP.c,17 :: 		I2C1_Start();
	PUSH	W10
	CALL	_I2C1_Start
;GYROS_ACCEL_DSP.c,18 :: 		I2C1_Write(W_DATA);
	MOV	#lo_addr(_W_DATA), W0
	PUSH	W10
	MOV.B	[W0], W10
	CALL	_I2C1_Write
	POP	W10
;GYROS_ACCEL_DSP.c,19 :: 		I2C1_Write(add);
	CALL	_I2C1_Write
;GYROS_ACCEL_DSP.c,20 :: 		I2C1_Write(dato);
	MOV.B	W11, W10
	CALL	_I2C1_Write
;GYROS_ACCEL_DSP.c,21 :: 		I2C1_Stop();
	CALL	_I2C1_Stop
;GYROS_ACCEL_DSP.c,22 :: 		delay_ms(50);
	MOV	#4, W8
	MOV	#53392, W7
L_MPU_Write0:
	DEC	W7
	BRA NZ	L_MPU_Write0
	DEC	W8
	BRA NZ	L_MPU_Write0
;GYROS_ACCEL_DSP.c,23 :: 		}
L_end_MPU_Write:
	POP	W10
	RETURN
; end of _MPU_Write

_MPU_Read:

;GYROS_ACCEL_DSP.c,24 :: 		unsigned short MPU_Read(unsigned short add)
;GYROS_ACCEL_DSP.c,27 :: 		I2C1_Start();
	PUSH	W10
	CALL	_I2C1_Start
;GYROS_ACCEL_DSP.c,28 :: 		I2C1_Write(W_DATA);
	MOV	#lo_addr(_W_DATA), W0
	PUSH	W10
	MOV.B	[W0], W10
	CALL	_I2C1_Write
	POP	W10
;GYROS_ACCEL_DSP.c,29 :: 		I2C1_Write(add);
	CALL	_I2C1_Write
;GYROS_ACCEL_DSP.c,30 :: 		I2C1_ReStart();
	CALL	_I2C1_Restart
;GYROS_ACCEL_DSP.c,31 :: 		I2C1_Write(R_DATA);
	MOV	#lo_addr(_R_DATA), W0
	MOV.B	[W0], W10
	CALL	_I2C1_Write
;GYROS_ACCEL_DSP.c,32 :: 		res=I2C1_Read(1u);
	MOV	#1, W10
	CALL	_I2C1_Read
; res start address is: 2 (W1)
	MOV.B	W0, W1
;GYROS_ACCEL_DSP.c,33 :: 		I2C1_Stop();
	CALL	_I2C1_Stop
;GYROS_ACCEL_DSP.c,34 :: 		return res;
	MOV.B	W1, W0
; res end address is: 2 (W1)
;GYROS_ACCEL_DSP.c,35 :: 		}
;GYROS_ACCEL_DSP.c,34 :: 		return res;
;GYROS_ACCEL_DSP.c,35 :: 		}
L_end_MPU_Read:
	POP	W10
	RETURN
; end of _MPU_Read

_MPU6050_Init:

;GYROS_ACCEL_DSP.c,36 :: 		void  MPU6050_Init(void)
;GYROS_ACCEL_DSP.c,38 :: 		MPU_Write(0x6B,0x80);
	PUSH	W10
	PUSH	W11
	MOV.B	#128, W11
	MOV.B	#107, W10
	CALL	_MPU_Write
;GYROS_ACCEL_DSP.c,39 :: 		MPU_Write(0x6B,0x00);
	CLR	W11
	MOV.B	#107, W10
	CALL	_MPU_Write
;GYROS_ACCEL_DSP.c,40 :: 		MPU_Write(0x1B,0x00);
	CLR	W11
	MOV.B	#27, W10
	CALL	_MPU_Write
;GYROS_ACCEL_DSP.c,41 :: 		MPU_Write(0x1C,0x00);
	CLR	W11
	MOV.B	#28, W10
	CALL	_MPU_Write
;GYROS_ACCEL_DSP.c,42 :: 		}
L_end_MPU6050_Init:
	POP	W11
	POP	W10
	RETURN
; end of _MPU6050_Init

_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 52
	MOV	#4, W0
	IOR	68
	LNK	#30

;GYROS_ACCEL_DSP.c,43 :: 		void main()
;GYROS_ACCEL_DSP.c,50 :: 		OSCCON.F13=0;
	PUSH	W10
	PUSH	W11
	BCLR	OSCCON, #13
;GYROS_ACCEL_DSP.c,51 :: 		OSCCON.F12=1;
	BSET	OSCCON, #12
;GYROS_ACCEL_DSP.c,52 :: 		TRISB.F0=0;
	BCLR	TRISB, #0
;GYROS_ACCEL_DSP.c,53 :: 		I2C1_Init(100000);
	MOV	#34464, W10
	MOV	#1, W11
	CALL	_I2C1_Init
;GYROS_ACCEL_DSP.c,54 :: 		UART1_Init(9600);
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART1_Init
;GYROS_ACCEL_DSP.c,55 :: 		U1MODE.F10=1;
	BSET	U1MODE, #10
;GYROS_ACCEL_DSP.c,56 :: 		MPU6050_Init();
	CALL	_MPU6050_Init
;GYROS_ACCEL_DSP.c,57 :: 		while(1)
L_main2:
;GYROS_ACCEL_DSP.c,59 :: 		PORTB.F0=0;
	BCLR	PORTB, #0
;GYROS_ACCEL_DSP.c,60 :: 		delay_ms(500);
	MOV	#39, W8
	MOV	#9643, W7
L_main4:
	DEC	W7
	BRA NZ	L_main4
	DEC	W8
	BRA NZ	L_main4
	NOP
	NOP
;GYROS_ACCEL_DSP.c,61 :: 		PORTB.F0=1;
	BSET	PORTB, #0
;GYROS_ACCEL_DSP.c,62 :: 		delay_ms(500);
	MOV	#39, W8
	MOV	#9643, W7
L_main6:
	DEC	W7
	BRA NZ	L_main6
	DEC	W8
	BRA NZ	L_main6
	NOP
	NOP
;GYROS_ACCEL_DSP.c,66 :: 		temp[1]=(MPU_Read(0x41)<<8)+MPU_Read(0x42);
	ADD	W14, #12, W0
	MOV	W0, [W14+26]
	INC2	W0
	MOV	W0, [W14+24]
	MOV.B	#65, W10
	CALL	_MPU_Read
	ZE	W0, W0
	SL	W0, #8, W0
	MOV	W0, [W14+22]
	MOV.B	#66, W10
	CALL	_MPU_Read
	ZE	W0, W1
	MOV	[W14+22], W0
	ADD	W0, W1, W1
	MOV	[W14+24], W0
	MOV	W1, [W0]
;GYROS_ACCEL_DSP.c,67 :: 		temp[1]=(temp[1]+11900)/340;
	MOV	[W14+26], W1
	ADD	W1, #2, W0
	MOV	W0, [W14+22]
	ADD	W1, #2, W0
	MOV	[W0], W1
	MOV	#11900, W0
	ADD	W1, W0, W1
	MOV	#340, W2
	REPEAT	#17
	DIV.S	W1, W2
	MOV	W0, W1
	MOV	[W14+22], W0
	MOV	W1, [W0]
;GYROS_ACCEL_DSP.c,68 :: 		inttostr(temp[1],txt0);
	ADD	W14, #14, W1
	MOV	[W14+26], W0
	MOV	W1, [W14+28]
	INC2	W0
	MOV	W1, W11
	MOV	[W0], W10
	CALL	_IntToStr
;GYROS_ACCEL_DSP.c,69 :: 		UART1_Write_Text(txt0);
	ADD	W14, #14, W0
	MOV	W0, W10
	CALL	_UART1_Write_Text
;GYROS_ACCEL_DSP.c,70 :: 		UART1_Write_Text(" [°C]");
	MOV	#lo_addr(?lstr1_GYROS_ACCEL_DSP), W10
	CALL	_UART1_Write_Text
;GYROS_ACCEL_DSP.c,71 :: 		UART1_Write(0x0D);
	MOV	#13, W10
	CALL	_UART1_Write
;GYROS_ACCEL_DSP.c,72 :: 		UART1_Write(0x0A);
	MOV	#10, W10
	CALL	_UART1_Write
;GYROS_ACCEL_DSP.c,75 :: 		gyro[1]=(MPU_Read(0x43)<<8)+MPU_Read(0x44);
	ADD	W14, #0, W0
	MOV	W0, [W14+26]
	INC2	W0
	MOV	W0, [W14+24]
	MOV.B	#67, W10
	CALL	_MPU_Read
	ZE	W0, W0
	SL	W0, #8, W0
	MOV	W0, [W14+22]
	MOV.B	#68, W10
	CALL	_MPU_Read
	ZE	W0, W1
	MOV	[W14+22], W0
	ADD	W0, W1, W1
	MOV	[W14+24], W0
	MOV	W1, [W0]
;GYROS_ACCEL_DSP.c,76 :: 		inttostr(gyro[1],txt0);
	MOV	[W14+26], W0
	ADD	W0, #2, W1
	MOV	[W14+28], W0
	MOV	W0, W11
	MOV	[W1], W10
	CALL	_IntToStr
;GYROS_ACCEL_DSP.c,77 :: 		UART1_Write_Text(txt0);
	ADD	W14, #14, W0
	MOV	W0, W10
	CALL	_UART1_Write_Text
;GYROS_ACCEL_DSP.c,78 :: 		UART1_Write_Text("  ");
	MOV	#lo_addr(?lstr2_GYROS_ACCEL_DSP), W10
	CALL	_UART1_Write_Text
;GYROS_ACCEL_DSP.c,81 :: 		gyro[2]=(MPU_Read(0x45)<<8)+MPU_Read(0x46);
	ADD	W14, #0, W0
	ADD	W0, #4, W0
	MOV	W0, [W14+24]
	MOV.B	#69, W10
	CALL	_MPU_Read
	ZE	W0, W0
	SL	W0, #8, W0
	MOV	W0, [W14+22]
	MOV.B	#70, W10
	CALL	_MPU_Read
	ZE	W0, W1
	MOV	[W14+22], W0
	ADD	W0, W1, W1
	MOV	[W14+24], W0
	MOV	W1, [W0]
;GYROS_ACCEL_DSP.c,82 :: 		inttostr(gyro[2],txt0);
	MOV	[W14+26], W0
	ADD	W0, #4, W1
	MOV	[W14+28], W0
	MOV	W0, W11
	MOV	[W1], W10
	CALL	_IntToStr
;GYROS_ACCEL_DSP.c,83 :: 		UART1_Write_Text(txt0);
	ADD	W14, #14, W0
	MOV	W0, W10
	CALL	_UART1_Write_Text
;GYROS_ACCEL_DSP.c,84 :: 		UART1_Write_Text("  ");
	MOV	#lo_addr(?lstr3_GYROS_ACCEL_DSP), W10
	CALL	_UART1_Write_Text
;GYROS_ACCEL_DSP.c,87 :: 		gyro[3]=(MPU_Read(0x47)<<8)+MPU_Read(0x48);
	ADD	W14, #0, W0
	ADD	W0, #6, W0
	MOV	W0, [W14+24]
	MOV.B	#71, W10
	CALL	_MPU_Read
	ZE	W0, W0
	SL	W0, #8, W0
	MOV	W0, [W14+22]
	MOV.B	#72, W10
	CALL	_MPU_Read
	ZE	W0, W1
	MOV	[W14+22], W0
	ADD	W0, W1, W1
	MOV	[W14+24], W0
	MOV	W1, [W0]
;GYROS_ACCEL_DSP.c,88 :: 		inttostr(gyro[3],txt0);
	MOV	[W14+26], W0
	ADD	W0, #6, W1
	MOV	[W14+28], W0
	MOV	W0, W11
	MOV	[W1], W10
	CALL	_IntToStr
;GYROS_ACCEL_DSP.c,89 :: 		UART1_Write_Text(txt0);
	ADD	W14, #14, W0
	MOV	W0, W10
	CALL	_UART1_Write_Text
;GYROS_ACCEL_DSP.c,90 :: 		UART1_Write(0x0D);
	MOV	#13, W10
	CALL	_UART1_Write
;GYROS_ACCEL_DSP.c,91 :: 		UART1_Write(0x0A);
	MOV	#10, W10
	CALL	_UART1_Write
;GYROS_ACCEL_DSP.c,94 :: 		accel[1]=(MPU_Read(0x3B)<<8)+MPU_Read(0x3C);
	ADD	W14, #6, W0
	MOV	W0, [W14+26]
	INC2	W0
	MOV	W0, [W14+24]
	MOV.B	#59, W10
	CALL	_MPU_Read
	ZE	W0, W0
	SL	W0, #8, W0
	MOV	W0, [W14+22]
	MOV.B	#60, W10
	CALL	_MPU_Read
	ZE	W0, W1
	MOV	[W14+22], W0
	ADD	W0, W1, W1
	MOV	[W14+24], W0
	MOV	W1, [W0]
;GYROS_ACCEL_DSP.c,95 :: 		inttostr(accel[1],txt0);
	MOV	[W14+26], W0
	ADD	W0, #2, W1
	MOV	[W14+28], W0
	MOV	W0, W11
	MOV	[W1], W10
	CALL	_IntToStr
;GYROS_ACCEL_DSP.c,96 :: 		UART1_Write_Text(txt0);
	ADD	W14, #14, W0
	MOV	W0, W10
	CALL	_UART1_Write_Text
;GYROS_ACCEL_DSP.c,97 :: 		UART1_Write_Text("  ");
	MOV	#lo_addr(?lstr4_GYROS_ACCEL_DSP), W10
	CALL	_UART1_Write_Text
;GYROS_ACCEL_DSP.c,100 :: 		accel[2]=(MPU_Read(0x3D)<<8)+MPU_Read(0x3E);
	ADD	W14, #6, W0
	ADD	W0, #4, W0
	MOV	W0, [W14+24]
	MOV.B	#61, W10
	CALL	_MPU_Read
	ZE	W0, W0
	SL	W0, #8, W0
	MOV	W0, [W14+22]
	MOV.B	#62, W10
	CALL	_MPU_Read
	ZE	W0, W1
	MOV	[W14+22], W0
	ADD	W0, W1, W1
	MOV	[W14+24], W0
	MOV	W1, [W0]
;GYROS_ACCEL_DSP.c,101 :: 		inttostr(accel[2],txt0);
	MOV	[W14+26], W0
	ADD	W0, #4, W1
	MOV	[W14+28], W0
	MOV	W0, W11
	MOV	[W1], W10
	CALL	_IntToStr
;GYROS_ACCEL_DSP.c,102 :: 		UART1_Write_Text(txt0);
	ADD	W14, #14, W0
	MOV	W0, W10
	CALL	_UART1_Write_Text
;GYROS_ACCEL_DSP.c,103 :: 		UART1_Write_Text("  ");
	MOV	#lo_addr(?lstr5_GYROS_ACCEL_DSP), W10
	CALL	_UART1_Write_Text
;GYROS_ACCEL_DSP.c,106 :: 		accel[3]=(MPU_Read(0x3F)<<8)+MPU_Read(0x40);
	ADD	W14, #6, W0
	ADD	W0, #6, W0
	MOV	W0, [W14+24]
	MOV.B	#63, W10
	CALL	_MPU_Read
	ZE	W0, W0
	SL	W0, #8, W0
	MOV	W0, [W14+22]
	MOV.B	#64, W10
	CALL	_MPU_Read
	ZE	W0, W1
	MOV	[W14+22], W0
	ADD	W0, W1, W1
	MOV	[W14+24], W0
	MOV	W1, [W0]
;GYROS_ACCEL_DSP.c,107 :: 		inttostr(accel[3],txt0);
	MOV	[W14+26], W0
	ADD	W0, #6, W1
	MOV	[W14+28], W0
	MOV	W0, W11
	MOV	[W1], W10
	CALL	_IntToStr
;GYROS_ACCEL_DSP.c,108 :: 		UART1_Write_Text(txt0);
	ADD	W14, #14, W0
	MOV	W0, W10
	CALL	_UART1_Write_Text
;GYROS_ACCEL_DSP.c,109 :: 		UART1_Write(0x0D);
	MOV	#13, W10
	CALL	_UART1_Write
;GYROS_ACCEL_DSP.c,110 :: 		UART1_Write(0x0A);
	MOV	#10, W10
	CALL	_UART1_Write
;GYROS_ACCEL_DSP.c,116 :: 		}
	GOTO	L_main2
;GYROS_ACCEL_DSP.c,118 :: 		}
L_end_main:
	POP	W11
	POP	W10
	ULNK
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
