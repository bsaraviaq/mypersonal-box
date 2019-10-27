/*
        PROGRAMA PARA LA LECTURA DE LOS REGIDTROS DE TEMPERATURA,
        GIROSCOPIO Y ACELEROMETRO DEL MODULO MPU6050.

        RANGO DE MEDICION:
        TEMPERATURA:  -40 -> 85 [°C]
        GIROSCOPIO:   +/- 250 [dps]
        ACELEROMETRO: +/- 2 [g]
*/

unsigned short W_DATA=0xD0;
unsigned short R_DATA=0xD1;


void  MPU_Write(unsigned short add,unsigned short dato)
{
     I2C1_Start();
     I2C1_Write(W_DATA);
     I2C1_Write(add);
     I2C1_Write(dato);
     I2C1_Stop();
     delay_ms(50);
}
unsigned short MPU_Read(unsigned short add)
{
      unsigned short res;
      I2C1_Start();
      I2C1_Write(W_DATA);
      I2C1_Write(add);
      I2C1_ReStart();
      I2C1_Write(R_DATA);
      res=I2C1_Read(1u);
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
void main()
{
     int gyro[3];
     int accel[3];
     int temp[1];
     unsigned char txt0[7];
     unsigned short aux;
     OSCCON.F13=0;
     OSCCON.F12=1;
     TRISB.F0=0;
     I2C1_Init(100000);
     UART1_Init(9600);
     U1MODE.F10=1;
     MPU6050_Init();
while(1)
{
            PORTB.F0=0;
            delay_ms(500);
            PORTB.F0=1;
            delay_ms(500);



            temp[1]=(MPU_Read(0x41)<<8)+MPU_Read(0x42);
            temp[1]=(temp[1]+11900)/340;
            inttostr(temp[1],txt0);
            UART1_Write_Text(txt0);
            UART1_Write_Text(" [°C]");
            UART1_Write(0x0D);
            UART1_Write(0x0A);

            //                GIRO ALREDEDOR EJE X
            gyro[1]=(MPU_Read(0x43)<<8)+MPU_Read(0x44);
            inttostr(gyro[1],txt0);
            UART1_Write_Text(txt0);
            UART1_Write_Text("  ");

            //                GIRO ALREDEDOR EJE Y
            gyro[2]=(MPU_Read(0x45)<<8)+MPU_Read(0x46);
            inttostr(gyro[2],txt0);
            UART1_Write_Text(txt0);
            UART1_Write_Text("  ");

            //                GIRO ALREDEDOR EJE Z
            gyro[3]=(MPU_Read(0x47)<<8)+MPU_Read(0x48);
            inttostr(gyro[3],txt0);
            UART1_Write_Text(txt0);
            UART1_Write(0x0D);
            UART1_Write(0x0A);

             //                EJE X
            accel[1]=(MPU_Read(0x3B)<<8)+MPU_Read(0x3C);
            inttostr(accel[1],txt0);
            UART1_Write_Text(txt0);
            UART1_Write_Text("  ");

            //                EJE Y
            accel[2]=(MPU_Read(0x3D)<<8)+MPU_Read(0x3E);
            inttostr(accel[2],txt0);
            UART1_Write_Text(txt0);
            UART1_Write_Text("  ");

            //                EJE Z
            accel[3]=(MPU_Read(0x3F)<<8)+MPU_Read(0x40);
            inttostr(accel[3],txt0);
            UART1_Write_Text(txt0);
            UART1_Write(0x0D);
            UART1_Write(0x0A);





}

}


