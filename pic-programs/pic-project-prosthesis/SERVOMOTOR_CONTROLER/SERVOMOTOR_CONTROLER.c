int servo1;
int servo2;
int servo3;
int servo4;
int servo5;
int i;
void interrupt(void){ /////*/*/******/*/*/*//*/*/*/*/*
if(PIR1.F0==1) {
 TMR1H=462;
 TMR1L=50;
 PORTB.F3=1;
 PORTB.F4=1;
 PORTB.F5=1;
 PORTB.F6=1;
 PORTB.F7=1;
 delay_us(900);
 for(i=0;i<=80;i++){
  if(i>servo1){
  PORTB.F3=0;
  }
  if(i>servo2){
  PORTB.F4=0;
  }
  if(i>servo3){
  PORTB.F5=0;
  }
  if(i>servo4){
  PORTB.F6=0;
  }
  if(i>servo5){
  PORTB.F7=0;
  }
}

 PIR1.F0=0;


}
}


void main() {           //-------******-------
           unsigned char ch;
           int a;
           int j=0;
           int angle_servo[6];
           TRISB= 0b00000011;
           INTCON=0b11000000;
           T1CON= 0b00110001;
           PIE1.F0=1;
           PORTB.F2=1;
           
UART1_Init(9600);
while(1)
{
        if(UART1_Data_Ready()){
        ch=UART1_Read();
        a=ch;
        if(a>185) j=0;
        angle_servo[j]=a;
        j++;
        delay_us(50);
        }
  servo1= angle_servo[1]*0.44;
  servo2= angle_servo[2]*0.44;
  servo3= angle_servo[3]*0.44;
  servo4= angle_servo[4]*0.44;
  servo5= angle_servo[5]*0.44;

}
}