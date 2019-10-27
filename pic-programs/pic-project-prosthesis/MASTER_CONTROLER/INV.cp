#line 1 "D:/BRYAN/-----------UMSA-------------/PROTESIS PROY/SIM MIKROC/MASTER_CONTROLER/INV.c"
void main() {
unsigned int dtemp;
unsigned int dtemp1;
unsigned int dhum;
float t;
float t1;
float hum;
float cond_et_max;
float cond_et_min;
float cond_wt_max;
float cond_h_min;
bit day_night;
bit heater;
bit air_bubble;
bit humidify;
bit level;
bit levelout;

TRISA=0b00000111;
TRISD=0b00000011;
TRISB.F3=0;

PWM1_Init(15625);

PWM1_Start();
while(1){
day_night=PORTD.F0;
level=PORTD.F1;
PORTD.F2=heater;
PORTD.F3=air_bubble;
PORTD.F4=humidify;
PORTD.F5=levelout;

dtemp=ADC_read(0);
t=dtemp*0.48875;

dtemp1=ADC_read(1);
t1=dtemp1*0.48875;

dhum=ADC_read(2);
hum=dhum*0.097656;



if(day_night==1)
 {
 cond_et_max=22.0;
 cond_et_min=18.0;
 cond_wt_max=15.0;
 cond_h_min=50.0;
 }
else
 {
 cond_et_max=20.0;
 cond_et_min=16.0;
 cond_wt_max=13.0;
 cond_h_min=40.0;
 }

if (t<cond_et_min)
 {
 heater=0;
 PWM1_Set_Duty( 0.3 );
 }
else if (t>cond_et_max)
 {
 heater=1;
 PWM1_Set_Duty( 1.0 );
 }
else
 {
 heater=1;
 PWM1_Set_Duty( 0.3 );
 }

if (t1>cond_wt_max)
air_bubble=0;
else
air_bubble=1;

if (hum<cond_h_min)
humidify=0;
else
humidify=1;
if (level==1)
levelout=0;
else
levelout=1;

}
}
