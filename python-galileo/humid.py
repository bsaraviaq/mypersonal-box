import mraa
import time

x = mraa.Gpio(12)
h= mraa.Gpio(7)
x.dir(mraa.DIR_OUT)
temp=mraa.Aio(0)


while True:

    x.write(1)
    time.sleep(0.2)
    x.write(0)
    dtemp=temp.read()
    t=dtemp*0.48875	
    print("Temperatura=%.3f"%t)
    h.dir(mraa.DIR_OUT)
    h.write(1)
    time.sleep(0.01)
    h.write(0)
    time.sleep(0.018)
    h.write(1)
    h.dir(mraa.DIR_IN)
    while h.read()==1:
        time.sleep(0.000002)
    while h.read()==0:
        time.sleep(0.000002)
    while h.read()==1:
        time.sleep(0.000002)
    for i in range (0,39):
        while h.read()==0:
            time.sleep(0.000002)
        time.sleep(0.00003)
        if h.read()==0:
            hbit[i]=0
            i=i+1
        if h.read()==1:
            hbit[i]=1
            i=i+1
            while h.read()==1:
                time.sleep(0.000002)
    for n in range (0,39):
        print(hbit[n])
        n=n+1
        
            


    
    time.sleep(3.0)