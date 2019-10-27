
__OS_JumpToTask:

;osa_pic18_mikroc.c,64 :: 		
;osa_pic18_mikroc.c,66 :: 		
	CALL        __OS_SET_FSR_CUR_TASK+0, 0
;osa_pic18_mikroc.c,67 :: 		
	MOVF        4078, 0 
	MOVWF       __OS_State+0 
;osa_pic18_mikroc.c,69 :: 		
	PUSH
;osa_pic18_mikroc.c,70 :: 		
	MOVF        4078, 0, 0
;osa_pic18_mikroc.c,71 :: 		
	MOVWF       4093, 0
;osa_pic18_mikroc.c,72 :: 		
	MOVF        4078, 0, 0
;osa_pic18_mikroc.c,73 :: 		
	MOVWF       4094, 0
;osa_pic18_mikroc.c,74 :: 		
	MOVF        4078, 0, 0
;osa_pic18_mikroc.c,75 :: 		
	MOVWF       4095, 0
;osa_pic18_mikroc.c,76 :: 		
	RETURN      0
;osa_pic18_mikroc.c,78 :: 		
	RETURN      0
; end of __OS_JumpToTask

__OS_ReturnSave:

;osa_pic18_mikroc.c,106 :: 		
;osa_pic18_mikroc.c,108 :: 		
	CALL        __OS_SET_FSR_CUR_TASK+0, 0
;osa_pic18_mikroc.c,109 :: 		
	MOVF        4093, 0 
	MOVWF       4076 
	MOVF        4094, 0 
	MOVWF       4076 
	MOVF        4095, 0 
	MOVWF       4076 
;osa_pic18_mikroc.c,110 :: 		
	BSF         __OS_State+0, 3 
;osa_pic18_mikroc.c,111 :: 		
	POP
;osa_pic18_mikroc.c,112 :: 		
	RETURN      0
; end of __OS_ReturnSave

__OS_ReturnNoSave:

;osa_pic18_mikroc.c,132 :: 		
;osa_pic18_mikroc.c,134 :: 		
	POP
;osa_pic18_mikroc.c,135 :: 		
	RETURN      0
; end of __OS_ReturnNoSave

__OS_EnterWaitMode:

;osa_pic18_mikroc.c,156 :: 		
;osa_pic18_mikroc.c,158 :: 		
	CLRF        __OS_Temp+0 
;osa_pic18_mikroc.c,159 :: 		
	CALL        __OS_ClrReadySetClrCanContinue+0, 0
;osa_pic18_mikroc.c,160 :: 		
	RETURN      0
; end of __OS_EnterWaitMode

__OS_EnterWaitModeTO:

;osa_pic18_mikroc.c,181 :: 		
;osa_pic18_mikroc.c,183 :: 		
	MOVLW       255
	MOVWF       __OS_Temp+0 
;osa_pic18_mikroc.c,184 :: 		
	CALL        __OS_ClrReadySetClrCanContinue+0, 0
;osa_pic18_mikroc.c,185 :: 		
	RETURN      0
; end of __OS_EnterWaitModeTO

__OS_ClrReadySetClrCanContinue:

;osa_pic18_mikroc.c,207 :: 		
;osa_pic18_mikroc.c,209 :: 		
	POP
;osa_pic18_mikroc.c,211 :: 		
	BCF         __OS_Flags+0, 0 
;osa_pic18_mikroc.c,213 :: 		
	CALL        __OS_SET_FSR_CUR_TASK+0, 0
;osa_pic18_mikroc.c,214 :: 		
	MOVF        4093, 0 
	MOVWF       4076 
	MOVF        4094, 0 
	MOVWF       4076 
	MOVF        4095, 0 
	MOVWF       4076 
;osa_pic18_mikroc.c,215 :: 		
	BCF         __OS_State+0, 3 
;osa_pic18_mikroc.c,218 :: 		
	BTFSC       __OS_State+0, 4 
	GOTO        L__OS_ClrReadySetClrCanContinue0
	BCF         __OS_State+0, 5 
L__OS_ClrReadySetClrCanContinue0:
;osa_pic18_mikroc.c,219 :: 		
	BTFSS       __OS_Temp+0, 0 
	GOTO        L__OS_ClrReadySetClrCanContinue1
	BSF         __OS_State+0, 5 
L__OS_ClrReadySetClrCanContinue1:
;osa_pic18_mikroc.c,222 :: 		
	RETURN      0
; end of __OS_ClrReadySetClrCanContinue

__OS_SET_FSR_CUR_TASK:

;osa_pic18_mikroc.c,242 :: 		
;osa_pic18_mikroc.c,244 :: 		
	MOVF        __OS_CurTask+0, 0 
	MOVWF       FSR0L 
	MOVF        __OS_CurTask+1, 0 
	MOVWF       FSR0H 
;osa_pic18_mikroc.c,245 :: 		
	RETURN      0
; end of __OS_SET_FSR_CUR_TASK

_OS_DI:

;osa_pic18_mikroc.c,281 :: 		
;osa_pic18_mikroc.c,284 :: 		
	MOVLW       192
	ANDWF       4082, 0 
	MOVWF       R1 
;osa_pic18_mikroc.c,285 :: 		
	BCF         GIE_bit+0, 7 
;osa_pic18_mikroc.c,286 :: 		
	BTFSS       IPEN_bit+0, 7 
	GOTO        L_OS_DI2
	BCF         GIEL_bit+0, 6 
L_OS_DI2:
;osa_pic18_mikroc.c,287 :: 		
	MOVF        R1, 0 
	MOVWF       R0 
;osa_pic18_mikroc.c,288 :: 		
	RETURN      0
; end of _OS_DI

_OS_RI:

;osa_pic18_mikroc.c,326 :: 		
;osa_pic18_mikroc.c,328 :: 		
	BTFSS       FARG_OS_RI_temp+0, 7 
	GOTO        L_OS_RI3
	BSF         GIE_bit+0, 7 
L_OS_RI3:
;osa_pic18_mikroc.c,329 :: 		
	BTFSS       IPEN_bit+0, 7 
	GOTO        L_OS_RI4
;osa_pic18_mikroc.c,331 :: 		
	BTFSS       FARG_OS_RI_temp+0, 6 
	GOTO        L_OS_RI5
	BSF         GIEL_bit+0, 6 
L_OS_RI5:
;osa_pic18_mikroc.c,332 :: 		
L_OS_RI4:
;osa_pic18_mikroc.c,333 :: 		
	RETURN      0
; end of _OS_RI

__OS_CheckEvent:

;osa_pic18_mikroc.c,383 :: 		
;osa_pic18_mikroc.c,421 :: 		
	BCF         __OS_Flags+0, 5 
;osa_pic18_mikroc.c,422 :: 		
	CALL        __OS_SET_FSR_CUR_TASK+0, 0
;osa_pic18_mikroc.c,424 :: 		
	MOVF        FARG__OS_CheckEvent_bEvent+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L__OS_CheckEvent6
;osa_pic18_mikroc.c,426 :: 		
	BTFSS       __OS_State+0, 3 
	GOTO        L__OS_CheckEvent7
;osa_pic18_mikroc.c,430 :: 		
	BCF         __OS_State+0, 4 
;osa_pic18_mikroc.c,431 :: 		
	BCF         4079, 4 
;osa_pic18_mikroc.c,439 :: 		
	RETURN      0
;osa_pic18_mikroc.c,440 :: 		
L__OS_CheckEvent7:
;osa_pic18_mikroc.c,442 :: 		
	BSF         __OS_State+0, 3 
;osa_pic18_mikroc.c,444 :: 		
	GOTO        L__OS_CheckEvent8
L__OS_CheckEvent6:
;osa_pic18_mikroc.c,445 :: 		
	BCF         __OS_State+0, 3 
;osa_pic18_mikroc.c,446 :: 		
L__OS_CheckEvent8:
;osa_pic18_mikroc.c,450 :: 		
	BTFSC       __OS_State+0, 4 
	GOTO        L__OS_CheckEvent11
	BTFSS       __OS_State+0, 5 
	GOTO        L__OS_CheckEvent11
L___OS_CheckEvent18:
;osa_pic18_mikroc.c,452 :: 		
	BSF         __OS_State+0, 3 
;osa_pic18_mikroc.c,453 :: 		
	BSF         __OS_Flags+0, 5 
;osa_pic18_mikroc.c,459 :: 		
	RETURN      0
;osa_pic18_mikroc.c,460 :: 		
L__OS_CheckEvent11:
;osa_pic18_mikroc.c,464 :: 		
	POP
;osa_pic18_mikroc.c,469 :: 		
	RETURN      0
; end of __OS_CheckEvent

__OS_InitDelay:

;osa_ttimer.c,69 :: 		
;osa_ttimer.c,72 :: 		
	BCF         __OS_State+0, 5 
	MOVF        __OS_CurTask+0, 0 
	MOVWF       FSR1L 
	MOVF        __OS_CurTask+1, 0 
	MOVWF       FSR1H 
	BCF         POSTINC1+0, 4 
;osa_ttimer.c,77 :: 		
	MOVF        FARG__OS_InitDelay_Delay+0, 0 
	IORWF       FARG__OS_InitDelay_Delay+1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L__OS_InitDelay12
;osa_ttimer.c,79 :: 		
	MOVLW       255
	XORWF       FARG__OS_InitDelay_Delay+0, 0 
	MOVWF       R0 
	MOVF        FARG__OS_InitDelay_Delay+1, 0 
	XORLW       255
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVF        R1, 0 
	MOVWF       FARG__OS_InitDelay_Delay+1 
;osa_ttimer.c,80 :: 		
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       R2 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       R3 
	MOVF        R2, 0 
	MOVWF       FARG__OS_InitDelay_Delay+0 
	MOVF        R3, 0 
	MOVWF       FARG__OS_InitDelay_Delay+1 
;osa_ttimer.c,81 :: 		
	MOVF        __OS_CurTask+0, 0 
	MOVWF       R0 
	MOVF        __OS_CurTask+1, 0 
	MOVWF       R1 
	MOVLW       5
	ADDWF       R0, 0 
	MOVWF       FSR1L 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVF        R2, 0 
	MOVWF       POSTINC1+0 
	MOVF        R3, 0 
	MOVWF       POSTINC1+0 
;osa_ttimer.c,82 :: 		
	MOVF        __OS_CurTask+0, 0 
	MOVWF       FSR1L 
	MOVF        __OS_CurTask+1, 0 
	MOVWF       FSR1H 
	BSF         POSTINC1+0, 3 
	MOVF        __OS_CurTask+0, 0 
	MOVWF       FSR1L 
	MOVF        __OS_CurTask+1, 0 
	MOVWF       FSR1H 
	BSF         POSTINC1+0, 4 
;osa_ttimer.c,87 :: 		
	BSF         __OS_State+0, 4 
;osa_ttimer.c,88 :: 		
	BSF         __OS_State+0, 3 
;osa_ttimer.c,90 :: 		
L__OS_InitDelay12:
;osa_ttimer.c,91 :: 		
	RETURN      0
; end of __OS_InitDelay

_OS_Init:

;osa_system.c,67 :: 		
;osa_system.c,72 :: 		
	CLRF        __OS_Flags+0 
;osa_system.c,81 :: 		
	MOVLW       __OS_Tasks+0
	MOVWF       R0 
	MOVLW       hi_addr(__OS_Tasks+0)
	MOVWF       R1 
	MOVLW       21
	ADDWF       R0, 0 
	MOVWF       __OS_LastTask+0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       __OS_LastTask+1 
;osa_system.c,260 :: 		
	CLRF        __OS_Bsems+0 
;osa_system.c,326 :: 		
	BCF         __OS_Tasks+0, 6 
;osa_system.c,329 :: 		
	BCF         __OS_Tasks+7, 6 
;osa_system.c,333 :: 		
	BCF         __OS_Tasks+14, 6 
;osa_system.c,337 :: 		
	BCF         __OS_Tasks+21, 6 
;osa_system.c,394 :: 		
	RETURN      0
; end of _OS_Init

__OS_Task_Create:

;osa_tasks.c,75 :: 		
;osa_tasks.c,79 :: 		
	BCF         __OS_Flags+0, 1 
;osa_tasks.c,88 :: 		
	MOVLW       __OS_Tasks+0
	MOVWF       R1 
	MOVLW       hi_addr(__OS_Tasks+0)
	MOVWF       R2 
;osa_tasks.c,89 :: 		
	CLRF        __OS_Temp+0 
;osa_tasks.c,91 :: 		
L__OS_Task_Create13:
;osa_tasks.c,93 :: 		
	MOVFF       R1, FSR0L
	MOVFF       R2, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	BTFSC       R0, 6 
	GOTO        L__OS_Task_Create16
;osa_tasks.c,95 :: 		
	BSF         FARG__OS_Task_Create_priority+0, 6 
;osa_tasks.c,96 :: 		
	BSF         FARG__OS_Task_Create_priority+0, 3 
;osa_tasks.c,98 :: 		
	MOVLW       1
	ADDWF       R1, 0 
	MOVWF       FSR1L 
	MOVLW       0
	ADDWFC      R2, 0 
	MOVWF       FSR1H 
	MOVF        FARG__OS_Task_Create_TaskAddr+0, 0 
	MOVWF       POSTINC1+0 
	MOVF        FARG__OS_Task_Create_TaskAddr+1, 0 
	MOVWF       POSTINC1+0 
	MOVF        FARG__OS_Task_Create_TaskAddr+2, 0 
	MOVWF       POSTINC1+0 
	MOVF        FARG__OS_Task_Create_TaskAddr+3, 0 
	MOVWF       POSTINC1+0 
;osa_tasks.c,101 :: 		
	MOVLW       5
	ADDWF       R1, 0 
	MOVWF       FSR1L 
	MOVLW       0
	ADDWFC      R2, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
	CLRF        POSTINC1+0 
;osa_tasks.c,108 :: 		
	MOVFF       R1, FSR1L
	MOVFF       R2, FSR1H
	MOVF        FARG__OS_Task_Create_priority+0, 0 
	MOVWF       POSTINC1+0 
;osa_tasks.c,111 :: 		
	MOVF        R2, 0 
	XORWF       __OS_CurTask+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L___OS_Task_Create19
	MOVF        __OS_CurTask+0, 0 
	XORWF       R1, 0 
L___OS_Task_Create19:
	BTFSS       STATUS+0, 2 
	GOTO        L__OS_Task_Create17
	MOVF        FARG__OS_Task_Create_priority+0, 0 
	MOVWF       __OS_State+0 
L__OS_Task_Create17:
;osa_tasks.c,126 :: 		
	BCF         __OS_Flags+0, 1 
;osa_tasks.c,128 :: 		
	RETURN      0
;osa_tasks.c,130 :: 		
L__OS_Task_Create16:
;osa_tasks.c,132 :: 		
	MOVLW       7
	ADDWF       R1, 1 
	MOVLW       0
	ADDWFC      R2, 1 
;osa_tasks.c,134 :: 		
	INCF        __OS_Temp+0, 1 
	MOVLW       4
	SUBWF       __OS_Temp+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L__OS_Task_Create13
;osa_tasks.c,137 :: 		
	BSF         __OS_Flags+0, 1 
;osa_tasks.c,139 :: 		
;osa_tasks.c,140 :: 		
	RETURN      0
; end of __OS_Task_Create
