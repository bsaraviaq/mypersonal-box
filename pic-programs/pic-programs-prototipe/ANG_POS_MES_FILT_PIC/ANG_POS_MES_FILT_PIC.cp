#line 1 "E:/PIC_DSP_EXAMPLES/ANG_POS_MES_FILT_PIC/ANG_POS_MES_FILT_PIC.c"
#line 12 "E:/PIC_DSP_EXAMPLES/ANG_POS_MES_FILT_PIC/ANG_POS_MES_FILT_PIC.c"
unsigned short W_DATA=0xD0;
unsigned short R_DATA=0xD1;
unsigned char txt0[14];
int accel[3];
float grav[3];
float ang,ang_1,ang_2,ang_3,ang_4,ang_5,angf;
short aux;


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
 TMR0H=0x63;
 TMR0L=0xC0;

 if (aux==1) {MPU6050_Init();aux=0;}

 accel[1]=(MPU_Read(0x3B)<<8)+MPU_Read(0x3C);
 accel[3]=(MPU_Read(0x3F)<<8)+MPU_Read(0x40);
 ang=atan((accel[1]*1.0)/(accel[3]*1.0))*57.295779+90.0;
 angf=3.88*(0.0375*ang+0.0440*ang_1+0.0474*ang_2+0.0474*ang_3+0.0440*ang_4+0.0375*ang_5);
 floattostr(angf,txt0);
 UART1_Write_Text(txt0);
 UART1_Write(0x0D);
 UART1_Write(0x0A);
 PORTD.F0=1;
 delay_ms(1);
 PORTD.F0=0;

 ang_1=ang;
 ang_2=ang_1;
 ang_3=ang_2;
 ang_4=ang_3;
 ang_5=ang_4;
 }
 INTCON.F2=0;
}


void main()
{

 TRISD.F0=0;
 PORTD.F0=0;

 ADCON1.F3=1;
 ADCON1.F2=1;
 ADCON1.F1=1;
 ADCON1.F0=1;

 OSCCON.F6=1;
 OSCCON.F5=1;
 OSCCON.F4=1;
 UART1_Init(9600);
 I2C1_Init(200000);
 INTCON=0b10100000;
 T0CON=0b10001000;
 aux=1;



 while(1)
 { }
}
