#line 1 "E:/PIC_DSP_EXAMPLES/BRIGHTING_REGULATOR/BRIGHTING_REGULATOR.c"
int reg,i;
void Timer0_Int_Init()
{
 OPTION_REG=0b11010010;
 INTCON.F7=1;
 INTCON.F6=1;
 INTCON.F5=1;

}
void interrupt(void)
{
 if(INTCON.F2)
 {
 INTCON.F2=0;
 GPIO.F1=1;
 reg=ADC_Read(0)>>3;
 if(reg<100)
 {
 for(i=0;i<=reg;i++) delay_us(1);

 GPIO.F1=0;
 }
 }
}
void main()
{
 Timer0_Int_Init();
 ANSEL.F3=0;
 ANSEL.F2=0;
 ANSEL.F1=0;
 TRISIO.F1=0;
 GPIO.F1=0;
 while(1)
 {

 }

}
