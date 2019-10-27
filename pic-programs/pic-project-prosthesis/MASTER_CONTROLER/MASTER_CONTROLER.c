//------------------------------------------------------------------------------
int angulo=90;                  //      valor inicial del servomotor 0
//------------------------------------------------------------------------------
//                         SERVOMOTOR 0
//------------------------------------------------------------------------------
void interrupt (void){    //interrupcion pra el funcionamiento del servomotor 0
int n,i;
if(INTCON.F2) {           //utilizando la interrupcion del  Timer0
n=angulo*3.2;
     PORTD.F0=1;
     delay_us(500);
     for(i=0;i<=n;i++)
           delay_us(1);
     PORTD.F0=0;
     INTCON.F2=0;
     TMR0H=5;
     TMR0L=0;
}
}
//------------------------------------------------------------------------------
//                          PROGRAMA PRINCIPAL
//------------------------------------------------------------------------------
void main() {                   //     PROGRAMA PRINCIPAL
bit s1,s2,s3,s4,s5,control;
bit control1;
int retraso=0;
int cont=1;
unsigned char dato[20];
dato[0]=189;                  //      caracter de sincronizacion de transmision
            dato[1]=0;        //      meñique
            dato[2]=0;        //
            dato[3]=0;        //
            dato[4]=0;        //
            dato[5]=0;        //      pulgar
INTCON=0b10100000;            //      palabra de control de interrupciones
T0CON=0b10000000;             //      palabra de control del Timer 0
TRISD=0b11111110;
UART1_Init(9600);             //      inicializacion del modulo USART1

while(1){
s1=PORTD.F1;     //   <--|
s2=PORTD.F2;     //      |
s3=PORTD.F3;     //      |-----sensores de presion(pulsadores)
s4=PORTD.F4;     //      |
s5=PORTD.F5;     //   <--|
control=PORTD.F6;  //     mano cerrada o abierta
            if(control1==1)
            {coltrol1=1;
            if 8)
            
            
            }

            
            

            if(control==1) {    //      control de los servomotores 1-5
                 delay_ms(5);
                 angulo=180;
                 cont++;
                 if(s1==1) dato[1]=dato[1];
                 else if((cont>=0)&&(cont<=180))  dato[1]=cont;
                 if(s2==1) dato[2]=dato[2];
                 else if((cont>=10)&&(cont<=190))  dato[2]=cont-10;
                 if(s3==1) dato[3]=dato[3];
                 else if((cont>=20)&&(cont<=200))  dato[3]=cont-20;
                 if(s4==1) dato[4]=dato[4];
                 else if((cont>=30)&&(cont<=210))  dato[4]=cont-30;
                 if(s5==1) dato[5]=dato[5];
                 else if((cont>=40)&&(cont<=220))  dato[5]=cont-40;
                 }
             else{
                 delay_ms(5);
                 cont=0;
                 dato[1]=cont;
                 dato[2]=cont;
                 dato[3]=cont;
                 dato[4]=cont;
                 dato[5]=cont;
                 }
         if(cont>=220) cont=220;
         else cont=cont;




         UART1_Write(dato[0]);  //       envio de los datos por el canal Tx
         delay_us(1500);
         UART1_Write(dato[1]);
         delay_us(1500);
         UART1_Write(dato[2]);
         delay_us(1500);
         UART1_Write(dato[3]);
         delay_us(1500);
         UART1_Write(dato[4]);
         delay_us(1500);
         UART1_Write(dato[5]);
         delay_us(1500);
         if(control==0) {
                        delay_ms(250);
                        angulo=80;
                        }


}
}