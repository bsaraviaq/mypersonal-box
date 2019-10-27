
_main:

;INV.c,1 :: 		void main() {
;INV.c,19 :: 		TRISA=0b00000111;
	MOVLW       7
	MOVWF       TRISA+0 
;INV.c,20 :: 		TRISD=0b00000011;
	MOVLW       3
	MOVWF       TRISD+0 
;INV.c,21 :: 		TRISB.F3=0;
	BCF         TRISB+0, 3 
;INV.c,23 :: 		PWM1_Init(15625);
	BCF         T2CON+0, 0, 0
	BCF         T2CON+0, 1, 0
	MOVLW       63
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;INV.c,25 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;INV.c,26 :: 		while(1){
L_main0:
;INV.c,27 :: 		day_night=PORTD.F0;
	BTFSC       PORTD+0, 0 
	GOTO        L__main14
	BCF         main_day_night_L0+0, BitPos(main_day_night_L0+0) 
	GOTO        L__main15
L__main14:
	BSF         main_day_night_L0+0, BitPos(main_day_night_L0+0) 
L__main15:
;INV.c,28 :: 		level=PORTD.F1;
	BTFSC       PORTD+0, 1 
	GOTO        L__main16
	BCF         main_level_L0+0, BitPos(main_level_L0+0) 
	GOTO        L__main17
L__main16:
	BSF         main_level_L0+0, BitPos(main_level_L0+0) 
L__main17:
;INV.c,29 :: 		PORTD.F2=heater;
	BTFSC       main_heater_L0+0, BitPos(main_heater_L0+0) 
	GOTO        L__main18
	BCF         PORTD+0, 2 
	GOTO        L__main19
L__main18:
	BSF         PORTD+0, 2 
L__main19:
;INV.c,30 :: 		PORTD.F3=air_bubble;
	BTFSC       main_air_bubble_L0+0, BitPos(main_air_bubble_L0+0) 
	GOTO        L__main20
	BCF         PORTD+0, 3 
	GOTO        L__main21
L__main20:
	BSF         PORTD+0, 3 
L__main21:
;INV.c,31 :: 		PORTD.F4=humidify;
	BTFSC       main_humidify_L0+0, BitPos(main_humidify_L0+0) 
	GOTO        L__main22
	BCF         PORTD+0, 4 
	GOTO        L__main23
L__main22:
	BSF         PORTD+0, 4 
L__main23:
;INV.c,32 :: 		PORTD.F5=levelout;
	BTFSC       main_levelout_L0+0, BitPos(main_levelout_L0+0) 
	GOTO        L__main24
	BCF         PORTD+0, 5 
	GOTO        L__main25
L__main24:
	BSF         PORTD+0, 5 
L__main25:
;INV.c,34 :: 		dtemp=ADC_read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
;INV.c,35 :: 		t=dtemp*0.48875;	            //environment_temp
	CALL        _Word2Double+0, 0
	MOVLW       113
	MOVWF       R4 
	MOVLW       61
	MOVWF       R5 
	MOVLW       122
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       main_t_L0+0 
	MOVF        R1, 0 
	MOVWF       main_t_L0+1 
	MOVF        R2, 0 
	MOVWF       main_t_L0+2 
	MOVF        R3, 0 
	MOVWF       main_t_L0+3 
;INV.c,37 :: 		dtemp1=ADC_read(1);
	MOVLW       1
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
;INV.c,38 :: 		t1=dtemp1*0.48875;               //water_temp
	CALL        _Word2Double+0, 0
	MOVLW       113
	MOVWF       R4 
	MOVLW       61
	MOVWF       R5 
	MOVLW       122
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       main_t1_L0+0 
	MOVF        R1, 0 
	MOVWF       main_t1_L0+1 
	MOVF        R2, 0 
	MOVWF       main_t1_L0+2 
	MOVF        R3, 0 
	MOVWF       main_t1_L0+3 
;INV.c,40 :: 		dhum=ADC_read(2);
	MOVLW       2
	MOVWF       FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
;INV.c,41 :: 		hum=dhum*0.097656;	            //environment_temp
	CALL        _Word2Double+0, 0
	MOVLW       222
	MOVWF       R4 
	MOVLW       255
	MOVWF       R5 
	MOVLW       71
	MOVWF       R6 
	MOVLW       123
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       main_hum_L0+0 
	MOVF        R1, 0 
	MOVWF       main_hum_L0+1 
	MOVF        R2, 0 
	MOVWF       main_hum_L0+2 
	MOVF        R3, 0 
	MOVWF       main_hum_L0+3 
;INV.c,45 :: 		if(day_night==1)
	BTFSS       main_day_night_L0+0, BitPos(main_day_night_L0+0) 
	GOTO        L_main2
;INV.c,47 :: 		cond_et_max=22.0;
	MOVLW       0
	MOVWF       main_cond_et_max_L0+0 
	MOVLW       0
	MOVWF       main_cond_et_max_L0+1 
	MOVLW       48
	MOVWF       main_cond_et_max_L0+2 
	MOVLW       131
	MOVWF       main_cond_et_max_L0+3 
;INV.c,48 :: 		cond_et_min=18.0;
	MOVLW       0
	MOVWF       main_cond_et_min_L0+0 
	MOVLW       0
	MOVWF       main_cond_et_min_L0+1 
	MOVLW       16
	MOVWF       main_cond_et_min_L0+2 
	MOVLW       131
	MOVWF       main_cond_et_min_L0+3 
;INV.c,49 :: 		cond_wt_max=15.0;
	MOVLW       0
	MOVWF       main_cond_wt_max_L0+0 
	MOVLW       0
	MOVWF       main_cond_wt_max_L0+1 
	MOVLW       112
	MOVWF       main_cond_wt_max_L0+2 
	MOVLW       130
	MOVWF       main_cond_wt_max_L0+3 
;INV.c,50 :: 		cond_h_min=50.0;
	MOVLW       0
	MOVWF       main_cond_h_min_L0+0 
	MOVLW       0
	MOVWF       main_cond_h_min_L0+1 
	MOVLW       72
	MOVWF       main_cond_h_min_L0+2 
	MOVLW       132
	MOVWF       main_cond_h_min_L0+3 
;INV.c,51 :: 		}
	GOTO        L_main3
L_main2:
;INV.c,54 :: 		cond_et_max=20.0;
	MOVLW       0
	MOVWF       main_cond_et_max_L0+0 
	MOVLW       0
	MOVWF       main_cond_et_max_L0+1 
	MOVLW       32
	MOVWF       main_cond_et_max_L0+2 
	MOVLW       131
	MOVWF       main_cond_et_max_L0+3 
;INV.c,55 :: 		cond_et_min=16.0;
	MOVLW       0
	MOVWF       main_cond_et_min_L0+0 
	MOVLW       0
	MOVWF       main_cond_et_min_L0+1 
	MOVLW       0
	MOVWF       main_cond_et_min_L0+2 
	MOVLW       131
	MOVWF       main_cond_et_min_L0+3 
;INV.c,56 :: 		cond_wt_max=13.0;
	MOVLW       0
	MOVWF       main_cond_wt_max_L0+0 
	MOVLW       0
	MOVWF       main_cond_wt_max_L0+1 
	MOVLW       80
	MOVWF       main_cond_wt_max_L0+2 
	MOVLW       130
	MOVWF       main_cond_wt_max_L0+3 
;INV.c,57 :: 		cond_h_min=40.0;
	MOVLW       0
	MOVWF       main_cond_h_min_L0+0 
	MOVLW       0
	MOVWF       main_cond_h_min_L0+1 
	MOVLW       32
	MOVWF       main_cond_h_min_L0+2 
	MOVLW       132
	MOVWF       main_cond_h_min_L0+3 
;INV.c,58 :: 		}
L_main3:
;INV.c,60 :: 		if (t<cond_et_min)
	MOVF        main_cond_et_min_L0+0, 0 
	MOVWF       R4 
	MOVF        main_cond_et_min_L0+1, 0 
	MOVWF       R5 
	MOVF        main_cond_et_min_L0+2, 0 
	MOVWF       R6 
	MOVF        main_cond_et_min_L0+3, 0 
	MOVWF       R7 
	MOVF        main_t_L0+0, 0 
	MOVWF       R0 
	MOVF        main_t_L0+1, 0 
	MOVWF       R1 
	MOVF        main_t_L0+2, 0 
	MOVWF       R2 
	MOVF        main_t_L0+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main4
;INV.c,62 :: 		heater=0;
	BCF         main_heater_L0+0, BitPos(main_heater_L0+0) 
;INV.c,63 :: 		PWM1_Set_Duty( 0.3 );   // cooler
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;INV.c,64 :: 		}
	GOTO        L_main5
L_main4:
;INV.c,65 :: 		else if (t>cond_et_max)
	MOVF        main_t_L0+0, 0 
	MOVWF       R4 
	MOVF        main_t_L0+1, 0 
	MOVWF       R5 
	MOVF        main_t_L0+2, 0 
	MOVWF       R6 
	MOVF        main_t_L0+3, 0 
	MOVWF       R7 
	MOVF        main_cond_et_max_L0+0, 0 
	MOVWF       R0 
	MOVF        main_cond_et_max_L0+1, 0 
	MOVWF       R1 
	MOVF        main_cond_et_max_L0+2, 0 
	MOVWF       R2 
	MOVF        main_cond_et_max_L0+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main6
;INV.c,67 :: 		heater=1;
	BSF         main_heater_L0+0, BitPos(main_heater_L0+0) 
;INV.c,68 :: 		PWM1_Set_Duty( 1.0 );
	MOVLW       1
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;INV.c,69 :: 		}
	GOTO        L_main7
L_main6:
;INV.c,72 :: 		heater=1;
	BSF         main_heater_L0+0, BitPos(main_heater_L0+0) 
;INV.c,73 :: 		PWM1_Set_Duty( 0.3 );
	CLRF        FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;INV.c,74 :: 		}
L_main7:
L_main5:
;INV.c,76 :: 		if (t1>cond_wt_max)
	MOVF        main_t1_L0+0, 0 
	MOVWF       R4 
	MOVF        main_t1_L0+1, 0 
	MOVWF       R5 
	MOVF        main_t1_L0+2, 0 
	MOVWF       R6 
	MOVF        main_t1_L0+3, 0 
	MOVWF       R7 
	MOVF        main_cond_wt_max_L0+0, 0 
	MOVWF       R0 
	MOVF        main_cond_wt_max_L0+1, 0 
	MOVWF       R1 
	MOVF        main_cond_wt_max_L0+2, 0 
	MOVWF       R2 
	MOVF        main_cond_wt_max_L0+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main8
;INV.c,77 :: 		air_bubble=0;
	BCF         main_air_bubble_L0+0, BitPos(main_air_bubble_L0+0) 
	GOTO        L_main9
L_main8:
;INV.c,79 :: 		air_bubble=1;
	BSF         main_air_bubble_L0+0, BitPos(main_air_bubble_L0+0) 
L_main9:
;INV.c,81 :: 		if (hum<cond_h_min)
	MOVF        main_cond_h_min_L0+0, 0 
	MOVWF       R4 
	MOVF        main_cond_h_min_L0+1, 0 
	MOVWF       R5 
	MOVF        main_cond_h_min_L0+2, 0 
	MOVWF       R6 
	MOVF        main_cond_h_min_L0+3, 0 
	MOVWF       R7 
	MOVF        main_hum_L0+0, 0 
	MOVWF       R0 
	MOVF        main_hum_L0+1, 0 
	MOVWF       R1 
	MOVF        main_hum_L0+2, 0 
	MOVWF       R2 
	MOVF        main_hum_L0+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main10
;INV.c,82 :: 		humidify=0;
	BCF         main_humidify_L0+0, BitPos(main_humidify_L0+0) 
	GOTO        L_main11
L_main10:
;INV.c,84 :: 		humidify=1;
	BSF         main_humidify_L0+0, BitPos(main_humidify_L0+0) 
L_main11:
;INV.c,85 :: 		if (level==1)
	BTFSS       main_level_L0+0, BitPos(main_level_L0+0) 
	GOTO        L_main12
;INV.c,86 :: 		levelout=0;
	BCF         main_levelout_L0+0, BitPos(main_levelout_L0+0) 
	GOTO        L_main13
L_main12:
;INV.c,88 :: 		levelout=1;
	BSF         main_levelout_L0+0, BitPos(main_levelout_L0+0) 
L_main13:
;INV.c,90 :: 		}
	GOTO        L_main0
;INV.c,91 :: 		}
	GOTO        $+0
; end of _main
