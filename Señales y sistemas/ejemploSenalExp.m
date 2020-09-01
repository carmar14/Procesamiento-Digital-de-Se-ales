clear 
clc 
close all
%Señales exponenciales
t=-1:0.01:1; %Definicion del vector de tiempo continuo
n=-10:10; %Definicion del vector de tiempo discreto
%Exponencial real
C=5;
a=3;
x=C*exp(a*t);
subplot(2,1,1)
plot(t,x)
title('x(t)=C*exp(at),   a>0')
x=C*exp(-a*t);
subplot(2,1,2)
plot(t,x)
title('x(t)=C*exp(at),   a<0')

%Exponencial Periodica Compleja y senoidal
t=-0.2:0.0001:0.2; %Definicion del vector de tiempo continuo
A=1; %Amplitud de la señal
f=60;
w0=2*pi*f;
x=A*exp(i*w0*t);
figure
plot(t,real(x),'r')
hold on  
plot(t,imag(x),'k')
title('x(t)=A*exp(jw0t)')

%Exponenciales complejas generales
tetha=pi/2; %Angulo de fase
C=2*exp(j*pi/2);
r=5;
a=r+w0*j; %a=r+jw0
x=C*exp(a.*t);
%x=2*exp(r*t).*cos(w0*t+tetha);
figure
subplot(2,1,1)
plot(t,real(x))
title('x=2*exp(r*t).*cos(w0*t+tetha),  r>0')
r=-5;
a=r+w0*j;
x=C*exp(a.*t);
subplot(2,1,2)
plot(t,real(x))
title('x=2*exp(r*t).*cos(w0*t+tetha),  r<0')

%Exponenciales reales discretas
alpha=-0.5;
C=1;
x=C*alpha.^n;
figure
stem(n,x)

