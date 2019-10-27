#line 1 "E:/PIC_DSP_EXAMPLES/USB_PIC/USB_PIC.c"


unsigned short Br[64];
unsigned short Bw[64];



void interrupt( void )
{
 USB_Interrupt_Proc();
}
void main( void )
{

 unsigned short n;
 char DATO;

 INTCON = 0;
 INTCON2 = 0xF5;
 INTCON3 = 0xC0;
 RCON.IPEN = 0;
 PIE1 = 0;
 PIE2 = 0;
 PIR1 = 0;
 PIR2 = 0;

 TRISD.F0 = 0;

 hid_Enable(&Br,&Bw);

 for(n=0; n<64; n++)Bw[n]=0;
 while(1)
 {
 PORTD.F0=1;
 delay_ms(500);
 PORTD.F0=0;
 delay_ms(500);
#line 59 "E:/PIC_DSP_EXAMPLES/USB_PIC/USB_PIC.c"
 }
}
