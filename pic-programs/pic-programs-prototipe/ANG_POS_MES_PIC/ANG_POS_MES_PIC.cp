#line 1 "E:/PIC_DSP_EXAMPLES/ANG_POS_MES_PIC/ANG_POS_MES_PIC.c"
#line 8 "E:/PIC_DSP_EXAMPLES/ANG_POS_MES_PIC/ANG_POS_MES_PIC.c"
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



 while(1)
 {
 PORTD.F0=0;
 delay_ms(500);
 PORTD.F0=1;
 delay_ms(500);
#line 105 "E:/PIC_DSP_EXAMPLES/ANG_POS_MES_PIC/ANG_POS_MES_PIC.c"
 }
}
