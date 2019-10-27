#line 1 "E:/PIC_DSP_EXAMPLES/INTERN_CLOCK_PIC/INTERN_CLOCK_PIC.c"
void main() {
OSCCON.F6=1;
OSCCON.F5=1;
OSCCON.F4=1;

TRISD.F0=0;

 while(1)
 {
 PORTD.F0=1;
 delay_ms(500);
 PORTD.F0=0;
 delay_ms(500);

 }
}
