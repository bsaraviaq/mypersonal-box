#!/usr/bin/env python

# Author: Ing. German Pereira Munoz
# Copyright (c) 2016 
#
import mraa
import time
dp0 = mraa.Gpio(0)
dp1 = mraa.Gpio(1)
dp2 = mraa.Gpio(2)
dp3 = mraa.Gpio(3) 
dp4 = mraa.Gpio(4)
dp5 = mraa.Gpio(5)
dp6 = mraa.Gpio(6)
dp7 = mraa.Gpio(7) 

def init_port(conf):
	print "Iniciando el puerto",conf 

	if conf & 0x01:
		dp0.dir(mraa.DIR_OUT)
	else:
		dp0.dir(mraa.DIR_IN)
	if conf & 0x02:
		dp1.dir(mraa.DIR_OUT)
	else:
		dp1.dir(mraa.DIR_IN)
	if conf & 0x04:
		dp2.dir(mraa.DIR_OUT)
	else:
		dp2.dir(mraa.DIR_IN)
	if conf & 0x08:
		dp3.dir(mraa.DIR_OUT)
	else:
		dp3.dir(mraa.DIR_IN)
	if conf & 0x10:
		dp4.dir(mraa.DIR_OUT)
	else:
		dp4.dir(mraa.DIR_IN)
	if conf & 0x20:
		dp5.dir(mraa.DIR_OUT)
	else:
		dp5.dir(mraa.DIR_IN)
	if conf & 0x40:
		dp6.dir(mraa.DIR_OUT)
	else:
		dp6.dir(mraa.DIR_IN)		
	if conf & 0x80:
		dp7.dir(mraa.DIR_OUT)
	else:
		dp7.dir(mraa.DIR_IN)		
		
def out_port(dato_out):
	print "Sacando datos por el puerto",dato_out 
	if dato_out & 0x01 :
		dp0.write(1)
	else :
		dp0.write(0)
	if dato_out & 0x02 :
		dp1.write(1)
	else :
		dp1.write(0)
	if dato_out & 0x04 :
		dp2.write(1)
	else : 
		dp2.write(0)
	if dato_out & 0x08 :
		dp3.write(1)
	else :
		dp3.write(0)
	if dato_out & 0x10 :
		dp4.write(1)
	else :
		dp4.write(0)
	if dato_out & 0x20 :
		dp5.write(1)
	else :
		dp5.write(0)
	if dato_out & 0x40 :
		dp6.write(1)
	else :
		dp6.write(0)		
	if dato_out & 0x80 :
		dp7.write(1)
	else :
		dp7.write(0)
		
# testBit() returns a nonzero result, 2**offset, if the bit at 'offset' is one.
def testBit(int_type, offset):
	mask = 1 << offset
	return(int_type & mask)
# setBit() returns an integer with the bit at 'offset' set to 1.
def setBit(int_type, offset):
	mask = 1 << offset
	return(int_type | mask)
# clearBit() returns an integer with the bit at 'offset' cleared.
def clearBit(int_type, offset):
	mask = ~(1 << offset)
	return(int_type & mask)
# toggleBit() returns an integer with the bit at 'offset' inverted, 0 -> 1 and 1 -> 0.
def toggleBit(int_type, offset):
	mask = 1 << offset
	return(int_type ^ mask)
	
#configurando los pines 0 --> 7 como salida
init_port(0xFF)
#inicializando las lineas 0 --> 7 
out_port(0)
#inicailizacion de variables
mot1 = 0x01
time.sleep(0.2)
time.sleep(0.2)
time.sleep(0.2)
while True:
	out_port(mot1)
	mot1=mot1<<1
	if mot1==0x10:
		mot1=0x01
	time.sleep(0.2)

