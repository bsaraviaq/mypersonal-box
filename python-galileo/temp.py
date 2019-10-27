import mraa
import time

x = mraa.Gpio(13)

temp=mraa.Aio(0)


while True:
    x.dir(mraa.DIR_OUT)
    x.write(1)
    time.sleep(0.2)
    x.write(0)
    dtemp=temp.read()
    t=dtemp*0.48875	
    print("Temperatura=%.3f"%t)    
    time.sleep(3.0)
