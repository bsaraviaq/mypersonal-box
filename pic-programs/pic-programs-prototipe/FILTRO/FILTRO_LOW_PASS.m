clear;
%----------------------
% DESIGN OF A LOW-PASS FILTER BY WINDOWING
%---------------------
T=0.02; % period of sample
Fs=1/T; % sample frec. 
fp=15;  % pass frec.
fs=26;  % stop frec.
% normalized frec.
wp=2*pi*(fp/Fs);
ws=2*pi*(fs/Fs);
deltaw=ws-wp;
omegac=(ws+wp)/2;
% using Hamming's window
L=ceil(6.6*pi/deltaw);  % window length
M=L-1;                  % window order
for i=1:L
hd(i)=sin(omegac*(i-M/2))/(pi*(i-M/2));
end
h=hd.*hamming(L)';
% aplicacion del filtro
x=load ('dato2.txt')';
N=length(x);
t=0:0.02:(N-1)*0.02;
for j=L:N
    for k=1:L
    y(j)=h(k)*x(j-k+1);
    end
end
figure (1)
subplot(2,1,1)
plot(t,x)
xlim([1 3.5]);
subplot(2,1,2)
plot(t,y)
xlim([1 3.5]);