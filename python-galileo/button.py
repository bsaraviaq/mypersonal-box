import mraa
import time

x = mraa.Gpio(12)
x.dir(mraa.DIR_OUT)
h = mraa.Gpio(7)
h.dir(mraa.DIR_IN)


while True:
    if h.read()==0:
        x.write(0)
    if h.read()==1:
        x.write(1)
        

