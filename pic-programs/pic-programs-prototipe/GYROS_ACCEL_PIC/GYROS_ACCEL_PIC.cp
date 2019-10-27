#line 1 "E:/PIC_DSP_EXAMPLES/GYROS_ACCEL_PIC/GYROS_ACCEL_PIC.c"
#line 11 "E:/PIC_DSP_EXAMPLES/GYROS_ACCEL_PIC/GYROS_ACCEL_PIC.c"
unsigned short W_DATA=0xD0;
unsigned short R_DATA=0xD1;


void MPU_Write(unsigned short add,unsigned short dato)
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
void MPU6050_Init(void)
{
 MPU_Write(0x6B,0x80);
 MPU_Write(0x6B,0x00);
 MPU_Write(0x1B,0x00);
 MPU_Write(0x1C,0x00);
}

void main()
{
 unsigned char txt0[7];
 int gyro[3];
 int accel[3];
 int temp[1];
 TRISD.F0=0;
 PORTD.F0=0;
 ADCON1.F3=1;
 ADCON1.F2=1;
 ADCON1.F1=1;
 ADCON1.F0=1;
 UART1_Init(9600);
 I2C1_Init(100000);
 MPU6050_Init();


 while(1)
 {
 PORTD.F0=0;
 delay_ms(500);
 PORTD.F0=1;
 delay_ms(500);

 temp[1]=(MPU_Read(0x41)<<8)+MPU_Read(0x42);
 temp[1]=(temp[1]+11900)/340;
 inttostr(temp[1],txt0);
 UART1_Write_Text(txt0);
 UART1_Write_Text(" [°C]");
 UART1_Write(0x0D);
 UART1_Write(0x0A);


 gyro[1]=(MPU_Read(0x43)<<8)+MPU_Read(0x44);
 inttostr(gyro[1],txt0);
 UART1_Write_Text(txt0);
 UART1_Write_Text("  ");


 gyro[2]=(MPU_Read(0x45)<<8)+MPU_Read(0x46);
 inttostr(gyro[2],txt0);
 UART1_Write_Text(txt0);
 UART1_Write_Text("  ");


 gyro[3]=(MPU_Read(0x47)<<8)+MPU_Read(0x48);
 inttostr(gyro[3],txt0);
 UART1_Write_Text(txt0);
 UART1_Write(0x0D);
 UART1_Write(0x0A);


 accel[1]=(MPU_Read(0x3B)<<8)+MPU_Read(0x3C);
 inttostr(accel[1],txt0);
 UART1_Write_Text(txt0);
 UART1_Write_Text("  ");


 accel[2]=(MPU_Read(0x3D)<<8)+MPU_Read(0x3E);
 inttostr(accel[2],txt0);
 UART1_Write_Text(txt0);
 UART1_Write_Text("  ");


 accel[3]=(MPU_Read(0x3F)<<8)+MPU_Read(0x40);
 inttostr(accel[3],txt0);
 UART1_Write_Text(txt0);
 UART1_Write(0x0D);
 UART1_Write(0x0A);

 }
}
