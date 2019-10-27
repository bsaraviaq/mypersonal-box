
_InitTimer3:

;RTOS_PIC.c,18 :: 		void InitTimer3(){
;RTOS_PIC.c,19 :: 		T3CON         = 0x01;
	MOVLW       1
	MOVWF       T3CON+0 
;RTOS_PIC.c,20 :: 		TMR3IF_bit         = 0;
	BCF         TMR3IF_bit+0, 1 
;RTOS_PIC.c,21 :: 		TMR3H	 = 0x44;
	MOVLW       68
	MOVWF       TMR3H+0 
;RTOS_PIC.c,22 :: 		TMR3L	 = 0x80;
	MOVLW       128
	MOVWF       TMR3L+0 
;RTOS_PIC.c,23 :: 		TMR3IE_bit         = 1;
	BSF         TMR3IE_bit+0, 1 
;RTOS_PIC.c,24 :: 		INTCON         = 0xC0;
	MOVLW       192
	MOVWF       INTCON+0 
;RTOS_PIC.c,25 :: 		}
	RETURN      0
; end of _InitTimer3

_time:

;RTOS_PIC.c,28 :: 		void time(void)
;RTOS_PIC.c,30 :: 		while(1)
L_time0:
;RTOS_PIC.c,32 :: 		OS_Delay(5);
	MOVLW       5
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVLW       0
	MOVWF       FARG__OS_InitDelay_Delay+1 
	CALL        __OS_InitDelay+0, 0
	CALL        __OS_ReturnSave+0, 0
	NOP
;RTOS_PIC.c,33 :: 		OS_Bsem_Set(BS_MAIN_LOOP);
	BSF         __OS_Bsems+0, 0 
;RTOS_PIC.c,34 :: 		}
	GOTO        L_time0
;RTOS_PIC.c,35 :: 		}
	RETURN      0
; end of _time

_pulse:

;RTOS_PIC.c,38 :: 		void pulse(void)
;RTOS_PIC.c,40 :: 		while(1)
L_pulse2:
;RTOS_PIC.c,42 :: 		OS_Bsem_Wait(BS_PULSE);
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	MOVLW       2
	ANDWF       __OS_Bsems+0, 0 
	MOVWF       FARG__OS_CheckEvent+0 
	MOVF        FARG__OS_CheckEvent+0, 0 
	XORLW       0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       FARG__OS_CheckEvent+0 
	CALL        __OS_CheckEvent+0, 0
	BCF         __OS_Bsems+0, 1 
;RTOS_PIC.c,43 :: 		PORTD.F0=1;
	BSF         PORTD+0, 0 
;RTOS_PIC.c,44 :: 		delay_us(15);
	MOVLW       59
	MOVWF       R13, 0
L_pulse4:
	DECFSZ      R13, 1, 0
	BRA         L_pulse4
	NOP
	NOP
;RTOS_PIC.c,45 :: 		PORTD.F0=0;
	BCF         PORTD+0, 0 
;RTOS_PIC.c,46 :: 		}
	GOTO        L_pulse2
;RTOS_PIC.c,47 :: 		}
	RETURN      0
; end of _pulse

_counting:

;RTOS_PIC.c,48 :: 		void counting(void)
;RTOS_PIC.c,50 :: 		while(1)
L_counting5:
;RTOS_PIC.c,52 :: 		OS_Wait(PORTD.F1);
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	MOVLW       0
	BTFSC       PORTD+0, 1 
	MOVLW       1
	MOVWF       FARG__OS_CheckEvent+0 
	MOVF        FARG__OS_CheckEvent+0, 0 
	XORLW       0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       FARG__OS_CheckEvent+0 
	CALL        __OS_CheckEvent+0, 0
;RTOS_PIC.c,53 :: 		T1CON.F0=1;
	BSF         T1CON+0, 0 
;RTOS_PIC.c,54 :: 		OS_Wait(!PORTD.F1);
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	BTFSC       PORTD+0, 1 
	GOTO        L__counting48
	BSF         4056, 0 
	GOTO        L__counting49
L__counting48:
	BCF         4056, 0 
L__counting49:
	MOVLW       0
	BTFSC       4056, 0 
	MOVLW       1
	MOVWF       FARG__OS_CheckEvent+0 
	MOVF        FARG__OS_CheckEvent+0, 0 
	XORLW       0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       FARG__OS_CheckEvent+0 
	CALL        __OS_CheckEvent+0, 0
;RTOS_PIC.c,55 :: 		T1CON.F0=0;
	BCF         T1CON+0, 0 
;RTOS_PIC.c,56 :: 		cont=(TMR1H<<8)|TMR1L;
	MOVF        TMR1H+0, 0 
	MOVWF       _cont+1 
	CLRF        _cont+0 
	MOVF        TMR1L+0, 0 
	IORWF       _cont+0, 1 
	MOVLW       0
	IORWF       _cont+1, 1 
;RTOS_PIC.c,57 :: 		TMR1H=0;
	CLRF        TMR1H+0 
;RTOS_PIC.c,58 :: 		TMR1L=0;
	CLRF        TMR1L+0 
;RTOS_PIC.c,59 :: 		OS_Bsem_Set(BS_COUNTING_RE);
	BSF         __OS_Bsems+0, 2 
;RTOS_PIC.c,60 :: 		}
	GOTO        L_counting5
;RTOS_PIC.c,61 :: 		}
	RETURN      0
; end of _counting

_main_loop:

;RTOS_PIC.c,62 :: 		void main_loop(void)
;RTOS_PIC.c,64 :: 		while(1)
L_main_loop7:
;RTOS_PIC.c,66 :: 		OS_Bsem_Wait(BS_MAIN_LOOP);
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	MOVLW       1
	ANDWF       __OS_Bsems+0, 0 
	MOVWF       FARG__OS_CheckEvent+0 
	MOVF        FARG__OS_CheckEvent+0, 0 
	XORLW       0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       FARG__OS_CheckEvent+0 
	CALL        __OS_CheckEvent+0, 0
	BCF         __OS_Bsems+0, 0 
;RTOS_PIC.c,67 :: 		OS_Bsem_Set(BS_PULSE);
	BSF         __OS_Bsems+0, 1 
;RTOS_PIC.c,68 :: 		OS_Bsem_Wait(BS_COUNTING_RE);
	CALL        __OS_EnterWaitMode+0, 0
	NOP
	MOVLW       4
	ANDWF       __OS_Bsems+0, 0 
	MOVWF       FARG__OS_CheckEvent+0 
	MOVF        FARG__OS_CheckEvent+0, 0 
	XORLW       0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       FARG__OS_CheckEvent+0 
	CALL        __OS_CheckEvent+0, 0
	BCF         __OS_Bsems+0, 2 
;RTOS_PIC.c,69 :: 		distance=cont*0.0167*(120.0/1328.85);
	MOVF        _cont+0, 0 
	MOVWF       R0 
	MOVF        _cont+1, 0 
	MOVWF       R1 
	CALL        _Word2Double+0, 0
	MOVLW       112
	MOVWF       R4 
	MOVLW       206
	MOVWF       R5 
	MOVLW       8
	MOVWF       R6 
	MOVLW       121
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       30
	MOVWF       R4 
	MOVLW       241
	MOVWF       R5 
	MOVLW       56
	MOVWF       R6 
	MOVLW       123
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _distance+0 
	MOVF        R1, 0 
	MOVWF       _distance+1 
	MOVF        R2, 0 
	MOVWF       _distance+2 
	MOVF        R3, 0 
	MOVWF       _distance+3 
;RTOS_PIC.c,71 :: 		floattostr(distance,txt0);
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
;RTOS_PIC.c,72 :: 		UART1_Write_Text(txt0);
	MOVLW       _txt0+0
	MOVWF       FARG_UART1_Write_Text_uart_text+0 
	MOVLW       hi_addr(_txt0+0)
	MOVWF       FARG_UART1_Write_Text_uart_text+1 
	CALL        _UART1_Write_Text+0, 0
;RTOS_PIC.c,73 :: 		UART1_Write(0x0D);
	MOVLW       13
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;RTOS_PIC.c,74 :: 		UART1_Write(0x0A);
	MOVLW       10
	MOVWF       FARG_UART1_Write_data_+0 
	CALL        _UART1_Write+0, 0
;RTOS_PIC.c,76 :: 		}
	GOTO        L_main_loop7
;RTOS_PIC.c,77 :: 		}
	RETURN      0
; end of _main_loop

_interrupt:

;RTOS_PIC.c,81 :: 		void interrupt (void)
;RTOS_PIC.c,83 :: 		if(TMR3IF_bit)
	BTFSS       TMR3IF_bit+0, 1 
	GOTO        L_interrupt9
;RTOS_PIC.c,85 :: 		TMR3H	 = 0x44;
	MOVLW       68
	MOVWF       TMR3H+0 
;RTOS_PIC.c,86 :: 		TMR3L	 = 0x80;
	MOVLW       128
	MOVWF       TMR3L+0 
;RTOS_PIC.c,87 :: 		OS_Timer();
	CLRF        interrupt__os_i_L3+0 
L_interrupt10:
	MOVLW       4
	SUBWF       interrupt__os_i_L3+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_interrupt11
	MOVF        interrupt__os_i_L3+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       7
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16x16_U+0, 0
	MOVLW       __OS_Tasks+0
	ADDWF       R0, 0 
	MOVWF       FSR0L 
	MOVLW       hi_addr(__OS_Tasks+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	BTFSS       R0, 4 
	GOTO        L_interrupt13
	MOVF        interrupt__os_i_L3+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       7
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16x16_U+0, 0
	MOVLW       __OS_Tasks+0
	ADDWF       R0, 1 
	MOVLW       hi_addr(__OS_Tasks+0)
	ADDWFC      R1, 1 
	MOVLW       5
	ADDWF       R0, 0 
	MOVWF       R2 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       R3 
	MOVFF       R2, FSR0L
	MOVFF       R3, FSR0H
	MOVLW       1
	ADDWF       POSTINC0+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      POSTINC0+0, 0 
	MOVWF       R1 
	MOVFF       R2, FSR1L
	MOVFF       R3, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
	MOVFF       R2, FSR0L
	MOVFF       R3, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt14
	MOVF        interrupt__os_i_L3+0, 0 
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       7
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	CALL        _Mul_16x16_U+0, 0
	MOVLW       __OS_Tasks+0
	ADDWF       R0, 0 
	MOVWF       FSR1L 
	MOVLW       hi_addr(__OS_Tasks+0)
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	BCF         POSTINC1+0, 4 
L_interrupt14:
L_interrupt13:
	INCF        interrupt__os_i_L3+0, 1 
	GOTO        L_interrupt10
L_interrupt11:
;RTOS_PIC.c,88 :: 		TMR3IF_bit = 0;
	BCF         TMR3IF_bit+0, 1 
;RTOS_PIC.c,89 :: 		}
L_interrupt9:
;RTOS_PIC.c,90 :: 		}
L__interrupt50:
	RETFIE      1
; end of _interrupt

_main:

;RTOS_PIC.c,92 :: 		void main()
;RTOS_PIC.c,95 :: 		InitTimer3();
	CALL        _InitTimer3+0, 0
;RTOS_PIC.c,96 :: 		T1CON=0b00000000;
	CLRF        T1CON+0 
;RTOS_PIC.c,97 :: 		TRISD.F0=0;
	BCF         TRISD+0, 0 
;RTOS_PIC.c,98 :: 		TRISD.F1=1;
	BSF         TRISD+0, 1 
;RTOS_PIC.c,100 :: 		UART1_Init(115200);
	MOVLW       25
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;RTOS_PIC.c,101 :: 		OS_Init();
	CALL        _OS_Init+0, 0
;RTOS_PIC.c,102 :: 		OS_Task_Create(0,time);
	CLRF        FARG__OS_Task_Create_priority+0 
	MOVLW       _time+0
	MOVWF       FARG__OS_Task_Create_TaskAddr+0 
	MOVLW       hi_addr(_time+0)
	MOVWF       FARG__OS_Task_Create_TaskAddr+1 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+2 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+3 
	CALL        __OS_Task_Create+0, 0
;RTOS_PIC.c,103 :: 		OS_Task_Create(2,pulse);
	MOVLW       2
	MOVWF       FARG__OS_Task_Create_priority+0 
	MOVLW       _pulse+0
	MOVWF       FARG__OS_Task_Create_TaskAddr+0 
	MOVLW       hi_addr(_pulse+0)
	MOVWF       FARG__OS_Task_Create_TaskAddr+1 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+2 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+3 
	CALL        __OS_Task_Create+0, 0
;RTOS_PIC.c,104 :: 		OS_Task_Create(3,counting);
	MOVLW       3
	MOVWF       FARG__OS_Task_Create_priority+0 
	MOVLW       _counting+0
	MOVWF       FARG__OS_Task_Create_TaskAddr+0 
	MOVLW       hi_addr(_counting+0)
	MOVWF       FARG__OS_Task_Create_TaskAddr+1 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+2 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+3 
	CALL        __OS_Task_Create+0, 0
;RTOS_PIC.c,105 :: 		OS_Task_Create(1,main_loop);
	MOVLW       1
	MOVWF       FARG__OS_Task_Create_priority+0 
	MOVLW       _main_loop+0
	MOVWF       FARG__OS_Task_Create_TaskAddr+0 
	MOVLW       hi_addr(_main_loop+0)
	MOVWF       FARG__OS_Task_Create_TaskAddr+1 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+2 
	MOVLW       0
	MOVWF       FARG__OS_Task_Create_TaskAddr+3 
	CALL        __OS_Task_Create+0, 0
;RTOS_PIC.c,106 :: 		OS_Run();
L_main15:
	BCF         __OS_Flags+0, 4 
	BSF         __OS_Flags+0, 3 
	MOVLW       8
	MOVWF       __OS_Best_Priority+0 
	MOVF        __OS_LastTask+0, 0 
	MOVWF       __OS_CurTask+0 
	MOVF        __OS_LastTask+1, 0 
	MOVWF       __OS_CurTask+1 
L_main18:
	MOVLW       __OS_Tasks+0
	MOVWF       R0 
	MOVLW       hi_addr(__OS_Tasks+0)
	MOVWF       R1 
	MOVLW       21
	ADDWF       R0, 0 
	MOVWF       R2 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       R3 
	MOVF        R3, 0 
	SUBWF       __OS_CurTask+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main51
	MOVF        R2, 0 
	SUBWF       __OS_CurTask+0, 0 
L__main51:
	BTFSS       STATUS+0, 0 
	GOTO        L_main21
	MOVLW       __OS_Tasks+0
	MOVWF       __OS_CurTask+0 
	MOVLW       hi_addr(__OS_Tasks+0)
	MOVWF       __OS_CurTask+1 
	GOTO        L_main22
L_main21:
	MOVLW       7
	ADDWF       __OS_CurTask+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      __OS_CurTask+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       __OS_CurTask+0 
	MOVF        R1, 0 
	MOVWF       __OS_CurTask+1 
L_main22:
	MOVF        __OS_CurTask+0, 0 
	MOVWF       FSR0L 
	MOVF        __OS_CurTask+1, 0 
	MOVWF       FSR0H 
	MOVLW       1
	MOVWF       R0 
	MOVLW       __OS_State+0
	MOVWF       FSR1L 
	MOVLW       hi_addr(__OS_State+0)
	MOVWF       FSR1H 
L_main23:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main23
	BTFSS       __OS_State+0, 6 
	GOTO        L__main47
	BTFSC       __OS_State+0, 7 
	GOTO        L__main47
	GOTO        L_main26
L__main47:
	GOTO        ___main__OS_SCHED_CONTINUE
L_main26:
	MOVF        __OS_State+0, 0 
	MOVWF       R0 
	MOVLW       7
	ANDWF       R0, 1 
	MOVF        R0, 0 
	MOVWF       __OS_Temp+0 
	MOVF        __OS_Best_Priority+0, 0 
	SUBWF       __OS_Temp+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_main27
	GOTO        ___main__OS_SCHED_CONTINUE
L_main27:
	BTFSC       __OS_State+0, 3 
	GOTO        L_main28
___main__OS_SCHED_RUN:
	CALL        __OS_JumpToTask+0, 0
	CALL        __OS_SET_FSR_CUR_TASK+0, 0
	MOVLW       215
	ANDWF       __indf+0, 1 
	MOVLW       40
	ANDWF       __OS_State+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	IORWF       __indf+0, 1 
	BTFSC       __OS_Flags+0, 3 
	GOTO        L_main29
	GOTO        ___main_SCHED_END
L_main29:
L_main28:
	BTFSS       __OS_State+0, 4 
	GOTO        L_main32
	BTFSC       __OS_State+0, 5 
	GOTO        L_main32
L__main46:
	GOTO        ___main__OS_SCHED_CONTINUE
L_main32:
	BTFSS       __OS_State+0, 3 
	GOTO        L_main33
	BSF         __OS_Flags+0, 4 
	MOVF        __OS_CurTask+0, 0 
	MOVWF       __OS_BestTask+0 
	MOVF        __OS_CurTask+1, 0 
	MOVWF       __OS_BestTask+1 
	MOVF        __OS_State+0, 0 
	MOVWF       R0 
	MOVLW       7
	ANDWF       R0, 1 
	MOVF        R0, 0 
	MOVWF       __OS_Best_Priority+0 
	MOVF        __OS_Best_Priority+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main34
	GOTO        L_main19
L_main34:
L_main33:
___main__OS_SCHED_CONTINUE:
	MOVF        __OS_CurTask+1, 0 
	XORWF       __OS_LastTask+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main52
	MOVF        __OS_LastTask+0, 0 
	XORWF       __OS_CurTask+0, 0 
L__main52:
	BTFSC       STATUS+0, 2 
	GOTO        L__main45
	GOTO        L_main18
L__main45:
L_main19:
	BTFSS       __OS_Flags+0, 4 
	GOTO        L_main37
	BCF         __OS_Flags+0, 3 
	MOVF        __OS_BestTask+0, 0 
	MOVWF       __OS_CurTask+0 
	MOVF        __OS_BestTask+1, 0 
	MOVWF       __OS_CurTask+1 
	MOVF        __OS_CurTask+0, 0 
	MOVWF       __OS_LastTask+0 
	MOVF        __OS_CurTask+1, 0 
	MOVWF       __OS_LastTask+1 
	MOVF        __OS_CurTask+0, 0 
	MOVWF       FSR0L 
	MOVF        __OS_CurTask+1, 0 
	MOVWF       FSR0H 
	MOVLW       1
	MOVWF       R0 
	MOVLW       __OS_State+0
	MOVWF       FSR1L 
	MOVLW       hi_addr(__OS_State+0)
	MOVWF       FSR1H 
L_main38:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main38
	BTFSS       __OS_State+0, 6 
	GOTO        L_main41
	BTFSC       __OS_State+0, 7 
	GOTO        L_main41
L__main44:
	GOTO        ___main__OS_SCHED_RUN
L_main41:
L_main37:
___main_SCHED_END:
	GOTO        L_main15
;RTOS_PIC.c,111 :: 		}
	GOTO        $+0
; end of _main
