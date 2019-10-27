/*
        PROGRAMA PARA LA MEDICION DE LA POSICION ANGULAR,
        GIROSCOPIO Y ACELEROMETRO DEL MODULO MPU6050.


*/

unsigned short W_DATA=0xD0;
unsigned short R_DATA=0xD1;


void  MPU_Write(unsigned short add,unsigned short dato)
{
     I2C1_Start();
     I2C1_Wr(W_DATA);
     I2C1_Wr(add);
     I2C1_Wr(dato);
     I2C1_Stop();
     delay_ms(50);
}
unsigned short MPU_Read(unsigned short add)
{
      unsigned short res;
      I2C1_Start();
      I2C1_Wr(W_DATA);
      I2C1_Wr(add);
      I2C1_Repeated_Start();
      I2C1_Wr(R_DATA);
      res=I2C1_Rd(0u);
      I2C1_Stop();
      return res;
}
void  MPU6050_Init(void)
{
     MPU_Write(0x6B,0x80);
     MPU_Write(0x6B,0x00);
     MPU_Write(0x1B,0x00);
     MPU_Write(0x1C,0x00);
}
void interrupt()
{
     if(INTCON.F2)
     {
     
     
     }
     INTCON.F2=0;
}


void main()
{
     unsigned char txt0[14];
     int accel[3];
     float grav[3];
     float ang;
     TRISD.F0=0;
     PORTD.F0=0;
     ADCON1.F3=1;
     ADCON1.F2=1;
     ADCON1.F1=1;
     ADCON1.F0=1;
     UART1_Init(115200);
     I2C1_Init(100000);
     //MPU6050_Init();


     while(1)
     {
            PORTD.F0=0;
            delay_ms(500);
            PORTD.F0=1;
            delay_ms(500);

            /*
            //                EJE X
            accel[1]=(MPU_Read(0x3B)<<8)+MPU_Read(0x3C);
            grav[1]=accel[1]*0.000598754882-0.525  ;
            floattostr(grav[1],txt0);
            UART1_Write_Text(txt0);
            UART1_Write_Text(" ");

            //                EJE Y
            accel[2]=(MPU_Read(0x3D)<<8)+MPU_Read(0x3E);
            grav[2]=accel[2]*0.000598754882;
            floattostr(grav[2],txt0);
            UART1_Write_Text(txt0);
            UART1_Write_Text(" ");

            //                EJE Z
            accel[3]=(MPU_Read(0x3F)<<8)+MPU_Read(0x40);
            grav[3]=accel[3]*0.000598754882-1.045;
            floattostr(grav[3],txt0);
            UART1_Write_Text(txt0);
            UART1_Write_Text(" ");
            
            //              ANGULO
            ang=atan((accel[2]*1.0)/(accel[3]*1.0))*57.295779;
            floattostr(ang,txt0);
            UART1_Write_Text(txt0);
            UART1_Write(0x0D);
            UART1_Write(0x0A);
            */

            }
}