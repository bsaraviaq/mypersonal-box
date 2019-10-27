#line 1 "E:/PIC_DSP_EXAMPLES/RTOS_PIC/RTOS_PIC.c"
#line 1 "e:/pic_dsp_examples/rtos_config/osa/osa.h"
#line 1 "e:/pic_dsp_examples/rtos_pic/osacfg.h"
#line 1068 "e:/pic_dsp_examples/rtos_config/osa/osa.h"
typedef  unsigned char  _OST_SMSG;
#line 1 "e:/pic_dsp_examples/rtos_config/osa/port/osa_include.h"
#line 1 "e:/pic_dsp_examples/rtos_config/osa/port/pic18/osa_pic18_mikroc.h"
#line 41 "e:/pic_dsp_examples/rtos_config/osa/port/pic18/osa_pic18_mikroc.h"
typedef unsigned char OST_UINT8;
typedef unsigned int OST_UINT16;
typedef unsigned long OST_UINT32;
typedef unsigned char OST_BOOL;

typedef OST_UINT8 OST_UINT;
#line 93 "e:/pic_dsp_examples/rtos_config/osa/port/pic18/osa_pic18_mikroc.h"
extern volatile unsigned int _fsr;
extern volatile char _indf;
extern volatile char _postinc;
extern volatile char _postdec;
extern volatile char _preinc;

extern volatile unsigned char _fsr1l;

extern volatile char _pcl;
extern volatile char _pclath;
extern volatile char _pclatu;
extern volatile char _status;
extern volatile char _tosl;
extern volatile char _tosh;
extern volatile char _tosu;
extern volatile char _bsr;
extern volatile char _wreg;
extern volatile char _intcon;
extern volatile char _rcon;
extern volatile char _stkptr;
#line 251 "e:/pic_dsp_examples/rtos_config/osa/port/pic18/osa_pic18_mikroc.h"
void _OS_JumpToTask (void);
#line 288 "e:/pic_dsp_examples/rtos_config/osa/port/pic18/osa_pic18_mikroc.h"
extern void _OS_ReturnSave (void);
extern void _OS_ReturnNoSave (void);
extern void _OS_EnterWaitMode (void);
extern void _OS_EnterWaitModeTO (void);

extern void _OS_SET_FSR_CUR_TASK (void);
#line 397 "e:/pic_dsp_examples/rtos_config/osa/port/pic18/osa_pic18_mikroc.h"
char OS_DI (void);
void OS_RI (char);
#line 419 "e:/pic_dsp_examples/rtos_config/osa/port/pic18/osa_pic18_mikroc.h"
extern void _OS_CheckEvent (OST_UINT);
#line 1092 "e:/pic_dsp_examples/rtos_config/osa/osa.h"
typedef  unsigned char  OST_SMSG;
#line 1110 "e:/pic_dsp_examples/rtos_config/osa/osa.h"
typedef  void *  OST_MSG;







typedef

 volatile

 struct _OST_MSG_CB
{
 OST_UINT status;
 OST_MSG msg;

} OST_MSG_CB;
#line 1139 "e:/pic_dsp_examples/rtos_config/osa/osa.h"
typedef struct
{
 OST_UINT cSize;
 OST_UINT cFilled;
 OST_UINT cBegin;

} OST_QUEUE_CONTROL;




typedef struct
{
 OST_QUEUE_CONTROL Q;
 OST_MSG *pMsg;

} OST_QUEUE;




typedef struct
{
 OST_QUEUE_CONTROL Q;
 OST_SMSG *pSMsg;

} OST_SQUEUE;
#line 1190 "e:/pic_dsp_examples/rtos_config/osa/osa.h"
typedef struct
{
 OST_UINT bEventError : 1;
 OST_UINT bError : 1;

 OST_UINT bInCriticalSection : 1;

 OST_UINT bCheckingTasks : 1;


 OST_UINT bBestTaskFound : 1;





  OST_UINT bTimeout : 1; OST_UINT bGIE_CTemp : 1; OST_UINT bGIEL_CTemp : 1; 
#line 1218 "e:/pic_dsp_examples/rtos_config/osa/osa.h"
} OST_SYSTEM_FLAGS;
#line 1235 "e:/pic_dsp_examples/rtos_config/osa/osa.h"
typedef struct
{
 OST_UINT cPriority : 3;
 OST_UINT bReady : 1;
 OST_UINT bDelay : 1;


 OST_UINT bCanContinue: 1;
 OST_UINT bEnable : 1;
 OST_UINT bPaused : 1;


  


} OST_TASK_STATE;
#line 1270 "e:/pic_dsp_examples/rtos_config/osa/osa.h"
typedef struct
{
 OST_TASK_STATE State;
  unsigned long  pTaskPointer;




  



  OST_UINT16  Timer;


} OST_TCB;
#line 1477 "e:/pic_dsp_examples/rtos_config/osa/osa.h"
typedef OST_UINT8 OST_CSEM;
#line 1506 "e:/pic_dsp_examples/rtos_config/osa/osa.h"
extern volatile   OST_SYSTEM_FLAGS _OS_Flags;
extern   OST_UINT _OS_Temp;


extern volatile   OST_UINT _OS_TempH;




extern volatile   OST_TASK_STATE _OS_State;
#line 1527 "e:/pic_dsp_examples/rtos_config/osa/osa.h"
extern   OST_TCB *    volatile _OS_CurTask;





 extern   OST_UINT _OS_Best_Priority;






 extern   OST_TCB *    volatile _OS_BestTask;
 extern   OST_TCB *    volatile _OS_LastTask;
#line 1 "e:/pic_dsp_examples/rtos_config/osa/kernel/osa_oldnames.h"
#line 1 "e:/pic_dsp_examples/rtos_config/osa/kernel/system/osa_system.h"
#line 48 "e:/pic_dsp_examples/rtos_config/osa/kernel/system/osa_system.h"
extern void OS_Init (void);



extern void OS_EnterCriticalSection (void);
extern void OS_LeaveCriticalSection (void);
#line 1 "e:/pic_dsp_examples/rtos_config/osa/kernel/system/osa_tasks.h"
#line 37 "e:/pic_dsp_examples/rtos_config/osa/kernel/system/osa_tasks.h"
extern   OST_TCB _OS_Tasks[ 4 ];






void _OS_Task_Create(OST_UINT priority,  unsigned long  TaskAddr);
#line 1 "e:/pic_dsp_examples/rtos_config/osa/kernel/events/osa_bsem.h"
#line 56 "e:/pic_dsp_examples/rtos_config/osa/kernel/events/osa_bsem.h"
extern volatile   OST_UINT _OS_Bsems[( 4 + 8 -1)/ 8 ];
#line 1 "e:/pic_dsp_examples/rtos_config/osa/kernel/events/osa_csem.h"
#line 1 "e:/pic_dsp_examples/rtos_config/osa/kernel/events/osa_flag.h"
#line 1 "e:/pic_dsp_examples/rtos_config/osa/kernel/events/osa_msg.h"
#line 1 "e:/pic_dsp_examples/rtos_config/osa/kernel/events/osa_queue.h"
#line 1 "e:/pic_dsp_examples/rtos_config/osa/kernel/events/osa_smsg.h"
#line 1 "e:/pic_dsp_examples/rtos_config/osa/kernel/events/osa_squeue.h"
#line 1 "e:/pic_dsp_examples/rtos_config/osa/kernel/timers/osa_stimer.h"
#line 1 "e:/pic_dsp_examples/rtos_config/osa/kernel/timers/osa_stimer_old.h"
#line 1 "e:/pic_dsp_examples/rtos_config/osa/kernel/timers/osa_dtimer.h"
#line 1 "e:/pic_dsp_examples/rtos_config/osa/kernel/timers/osa_qtimer.h"
#line 1 "e:/pic_dsp_examples/rtos_config/osa/kernel/timers/osa_ttimer.h"
#line 53 "e:/pic_dsp_examples/rtos_config/osa/kernel/timers/osa_ttimer.h"
void _OS_InitDelay( OST_UINT16  Delay);
#line 1 "e:/pic_dsp_examples/rtos_config/osa/kernel/timers/osa_timer.h"
#pragma funcall main pulse
#pragma funcall main counting
#pragma funcall main time
#pragma funcall main main_loop
#line 7 "E:/PIC_DSP_EXAMPLES/RTOS_PIC/RTOS_PIC.c"
unsigned int cont;
unsigned float distance;
unsigned char txt0[14];

enum OSA_BINSEMS_ENUM
{
 BS_MAIN_LOOP,
 BS_PULSE,
 BS_COUNTING_RE
};

void InitTimer3(){
 T3CON = 0x01;
 TMR3IF_bit = 0;
 TMR3H = 0x44;
 TMR3L = 0x80;
 TMR3IE_bit = 1;
 INTCON = 0xC0;
}


void time(void)
{
 while(1)
 {
  { _OS_InitDelay(5); { _OS_ReturnSave(); asm{ nop } ; } ; } ;
   { ; _OS_Bsems[ ((BS_MAIN_LOOP) >> 3 ) ] |= (1 << ((BS_MAIN_LOOP) & 7 )) ; ; } ;
 }
}


void pulse(void)
{
 while(1)
 {
   { { { _OS_EnterWaitMode(); asm{ nop } ; } ; _OS_CheckEvent(((_OS_Bsems[((BS_PULSE) >> 3)] & (1 << ((BS_PULSE) & 7)))) != 0) ; } ; _OS_Bsems[ ((BS_PULSE) >> 3 ) ] &= ~ (1 << ((BS_PULSE) & 7 )) ; } ;
 PORTD.F0=1;
 delay_us(15);
 PORTD.F0=0;
 }
}
void counting(void)
{
 while(1)
 {
  { { _OS_EnterWaitMode(); asm{ nop } ; } ; _OS_CheckEvent((PORTD.F1) != 0) ; } ;
 T1CON.F0=1;
  { { _OS_EnterWaitMode(); asm{ nop } ; } ; _OS_CheckEvent((!PORTD.F1) != 0) ; } ;
 T1CON.F0=0;
 cont=(TMR1H<<8)|TMR1L;
 TMR1H=0;
 TMR1L=0;
   { ; _OS_Bsems[ ((BS_COUNTING_RE) >> 3 ) ] |= (1 << ((BS_COUNTING_RE) & 7 )) ; ; } ;
 }
}
void main_loop(void)
{
 while(1)
 {
   { { { _OS_EnterWaitMode(); asm{ nop } ; } ; _OS_CheckEvent(((_OS_Bsems[((BS_MAIN_LOOP) >> 3)] & (1 << ((BS_MAIN_LOOP) & 7)))) != 0) ; } ; _OS_Bsems[ ((BS_MAIN_LOOP) >> 3 ) ] &= ~ (1 << ((BS_MAIN_LOOP) & 7 )) ; } ;
   { ; _OS_Bsems[ ((BS_PULSE) >> 3 ) ] |= (1 << ((BS_PULSE) & 7 )) ; ; } ;
   { { { _OS_EnterWaitMode(); asm{ nop } ; } ; _OS_CheckEvent(((_OS_Bsems[((BS_COUNTING_RE) >> 3)] & (1 << ((BS_COUNTING_RE) & 7)))) != 0) ; } ; _OS_Bsems[ ((BS_COUNTING_RE) >> 3 ) ] &= ~ (1 << ((BS_COUNTING_RE) & 7 )) ; } ;
 distance=cont*0.0167*(120.0/1328.85);

 floattostr(distance,txt0);
 UART1_Write_Text(txt0);
 UART1_Write(0x0D);
 UART1_Write(0x0A);

 }
}



void interrupt (void)
{
 if(TMR3IF_bit)
 {
 TMR3H = 0x44;
 TMR3L = 0x80;
  { { ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ;  { ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; ; } } ; { OST_UINT _os_i; ; ; for (_os_i = 0; _os_i < 4 ; _os_i++) { if (_OS_Tasks[_os_i].State.bDelay){ if (!++_OS_Tasks[_os_i].Timer) _OS_Tasks[_os_i].State.bDelay = 0; } } } ; ; ; ; } ;
 TMR3IF_bit = 0;
 }
}

void main()
{

 InitTimer3();
 T1CON=0b00000000;
 TRISD.F0=0;
 TRISD.F1=1;

 UART1_Init(115200);
 OS_Init();
  { _OS_Task_Create(0, ( unsigned long )&(time)); } ;
  { _OS_Task_Create(2, ( unsigned long )&(pulse)); } ;
  { _OS_Task_Create(3, ( unsigned long )&(counting)); } ;
  { _OS_Task_Create(1, ( unsigned long )&(main_loop)); } ;
  for(;;) { _OS_Flags.bBestTaskFound = 0; _OS_Flags.bCheckingTasks = 1; _OS_Best_Priority = 7  + 1; ; _OS_CurTask = _OS_LastTask; do { if (_OS_CurTask >= (  OST_TCB * )_OS_Tasks + ( 4 -1)) _OS_CurTask = (  OST_TCB * )_OS_Tasks; else _OS_CurTask++;  _OS_State = _OS_CurTask->State ; if (! _OS_State.bEnable  || _OS_State.bPaused ) goto _OS_SCHED_CONTINUE; ; if (_OS_Best_Priority <= (_OS_Temp = _OS_State.cPriority )) goto _OS_SCHED_CONTINUE; if (! _OS_State.bReady )  { _OS_SCHED_RUN:; _OS_JumpToTask() ; _OS_SET_FSR_CUR_TASK(); _indf &= ~( 0x08  | 0x20 ); _indf |= *((char*)&_OS_State) & ( 0x08  | 0x20 ); ; if (!_OS_Flags.bCheckingTasks) goto SCHED_END; ; } if ( _OS_State.bDelay  && ! _OS_State.bCanContinue ) goto _OS_SCHED_CONTINUE; ; if ( _OS_State.bReady )  { _OS_Flags.bBestTaskFound = 1; _OS_BestTask = _OS_CurTask; _OS_Best_Priority = _OS_State.cPriority ; if (_OS_Best_Priority == 0 ) break; } _OS_SCHED_CONTINUE:;  } while ( 1  && _OS_CurTask != _OS_LastTask); if (_OS_Flags.bBestTaskFound) { _OS_Flags.bCheckingTasks = 0; _OS_LastTask = _OS_CurTask = _OS_BestTask; _OS_State = _OS_CurTask->State ; if ( _OS_State.bEnable  && ! _OS_State.bPaused ) goto _OS_SCHED_RUN; } SCHED_END:; } ;
 while(1)
 {

 }
}
