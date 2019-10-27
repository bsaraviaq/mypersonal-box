#include <osa.h>
#pragma funcall main pulse
#pragma funcall main counting
#pragma funcall main time
#pragma funcall main main_loop

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
  T3CON         = 0x01;
  TMR3IF_bit         = 0;
  TMR3H         = 0x44;
  TMR3L         = 0x80;
  TMR3IE_bit         = 1;
  INTCON         = 0xC0;
}


void time(void)
{
     while(1)
     {
     OS_Delay(5);
     OS_Bsem_Set(BS_MAIN_LOOP);
     }
}


void pulse(void)
{
     while(1)
     {
     OS_Bsem_Wait(BS_PULSE);
     PORTD.F0=1;
     delay_us(15);
     PORTD.F0=0;
     }
}
void counting(void)
{
     while(1)
     {
     OS_Wait(PORTD.F1);
     T1CON.F0=1;
     OS_Wait(!PORTD.F1);
     T1CON.F0=0;
     cont=(TMR1H<<8)|TMR1L;
     TMR1H=0;
     TMR1L=0;
     OS_Bsem_Set(BS_COUNTING_RE);
     }
}
void main_loop(void)
{
     while(1)
     {
     OS_Bsem_Wait(BS_MAIN_LOOP);
     OS_Bsem_Set(BS_PULSE);
     OS_Bsem_Wait(BS_COUNTING_RE);
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
    TMR3H         = 0x44;
    TMR3L         = 0x80;
    OS_Timer();
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
     OS_Task_Create(0,time);
     OS_Task_Create(2,pulse);
     OS_Task_Create(3,counting);
     OS_Task_Create(1,main_loop);
     OS_Run();
     while(1)
     {

     }
}