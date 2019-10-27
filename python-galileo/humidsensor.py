import mraa
import time

d= mraa.Gpio(4)
x= mraa.Gpio(3)
h= mraa.Gpio(2)
d.dir(mraa.DIR_OUT)
x.dir(mraa.DIR_OUT)
h.dir(mraa.DIR_IN)

while True:


    x.write(1)	
    d.write(1)
    time.sleep(0.01)
    d.write(0)
    time.sleep(0.018)
    x.write(0)
    d.write(1)

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





   
    time.sleep(0.5)