clear
x=load ('dato2.txt');
N=length(x);
t=0:0.02:(N-1)*0.02;
No=6;                             % orden del filtro  <-----
n=0:No-1;
fc=8.3;                               % frecuencia de corte   <-----
wc=fc*2*pi;                  % obtencion de la respuesta al impulso
hn=(wc/pi)*sinc(wc*(n-(No-1)/2));   %    de un filtro pasa  bajo
win1=ones(1,No);                          % generamos la ventana rectangular
%win1=hamming(No)';
hw=hn.*win1; 
y=zeros(1,N);
for j=No:N
    %for k=1:No
    %y(j)=y(j)+hw(k)*x(j-k+1);       % x_n--->[-filtro fir-]----> y_n
    %end
    y(j)=hw(1)*x(j)+hw(2)*x(j-1)+hw(3)*x(j-2)+hw(4)*x(j-3)+hw(5)*x(j-4)+hw(6)*x(j-5);
end
%y=y/21.05;
figure (1)
subplot(2,1,1)
plot(t,x)
xlim([1 3.5]);
subplot(2,1,2)
plot(t,y)
xlim([1 3.5]);