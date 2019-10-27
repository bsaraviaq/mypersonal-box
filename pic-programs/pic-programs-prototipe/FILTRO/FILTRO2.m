clear
close all
x=load ('vec2.log')';
N=length(x);
T=0.08;
t=0:T:(N-1)*T;
%--------
e=2;
i=2;
q=0.01;
g=10;
k1=0;
k=0;
%--------
for j=1:N
g=i/(i+e);
k=k+g*(x(j)-k1);
i=(1-g)*i+abs(k1-k)*q;
k1=k;
y(j)=k;
end
hold on
plot(t,y);
plot(t,x)
hold off

