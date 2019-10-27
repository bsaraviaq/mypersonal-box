import mraa
import time
#####  PIN_SIGNAL_WORK
x = mraa.Gpio(12)
x.dir(mraa.DIR_OUT)
#####  PIN_IN
day_night = mraa.Gpio(11)           #0->night 1->day
day_night.dir(mraa.DIR_IN)
water_level = mraa.Gpio(10)         #0->low_level 1->high_level
water_level.dir(mraa.DIR_IN)
temp=mraa.Aio(0)                    #temperature sensor LM35
w_temp=mraa.Aio(1)                  #temperature sensor LM35
humid= mraa.Aio(2)                  #humid
#####  PIN_OUT
cooler = mraa.Pwm(9)                #PWM signal
cooler.period_us(700)
cooler.enable(True)
heater = mraa.Gpio(8)
heater.dir(mraa.DIR_OUT)
air_bubble =mraa.Gpio(7)
air_bubble.dir(mraa.DIR_OUT)
turbine = mraa.Gpio(6)
turbine.dir(mraa.DIR_OUT)
humidify=mraa.Gpio(5)
humidify.dir(mraa.DIR_OUT)
print("Configuracion de inicio...")
ete = int(input("Ingrese temperatura de equilibrio del ambiente:"))
wte = int(input("Ingrese temperatura de equilibrio del agua:"))
shu = int(input("Ingrese humedad de equilibrio:"))

while True:

    x.write(1)
    time.sleep(0.2)
    x.write(0)
    if day_night.read()==1:
        print("Condicion: DIA")        
    else:
        print("Condicion: NOCHE")
    
    dtemp=temp.read()
    t=dtemp*0.48875	            #environment_temp
    print("Temperatura ambiente: %.3f"%t)
    dtemp1=w_temp.read()
    t1=dtemp1*0.48875               #water_temp
    print("Temperatura del agua: %.3f"%t1)
    dhum=humid.read()
    hum=dhum*0.097656	            #environment_temp
    print("Humedad relativa del ambiente: %.3f"%hum)
    print("*************************************************")
#update the information
    if day_night.read()==1:
        cond_et_max=ete
        cond_et_min=ete-2
        cond_wt_max=wte
        cond_h_min=shu
    else:
        cond_et_max=ete-4
        cond_et_min=ete-6
        cond_wt_max=wte-4
        cond_h_min=shu-15
#environment temperature       
    if t<cond_et_min:
        heater.write(0)
        cooler.write(0.3)
    elif t>cond_et_max:
        heater.write(1)
        cooler.write(1.0)
    else:
        heater.write(1)
        cooler.write(0.3)
#water temperature        
    if t1>cond_wt_max:
        air_bubble.write(0)
    else:
        air_bubble.write(1)
#water level        
    if water_level.read()==1:
        turbine.write(1)
    else:
        turbine.write(0)

#humid
    if hum<cond_h_min:
        humidify.write(0)
    if hum>cond_h_min:
        humidify.write(1)
    
                


    time.sleep(0.9)