clear
close all
clc
% Punto 1
t=linspace(-2,2,1000);  %Vector de tiempo
%Grafica de x(t) que esta compuesta de tres funciones
subplot(3,2,1)
x=((t>-1)&(t<=0)).*(t+1)+((t>0)&(t<=1)).*1+((t>1)&(t<=2)).*2;
plot(t,x)
axis([-2 2 -2 3])
grid on
title('Grafica de x(t)')
xlabel('Tiempo(s)')
ylabel('x(t)')

%Grafica de x(-t) que esta compuesta de tres funciones
subplot(3,2,3)
xinv=((t>-1)&(t<=0)).*1+((t>0)&(t<=1)).*(-t+1)+((t>-2)&(t<=-1)).*2;
plot(t,xinv)
axis([-2 2 -2 3])
grid on
title('Grafica de x(-t)')
xlabel('Tiempo(s)')
ylabel('x(-t)')

%Grafica de xo(t) que esta compuesta de cuatro funciones
subplot(3,2,4)
xo=(x-xinv)/2;
plot(t,xo)
axis([-2 2 -2 3])
grid on
title('Grafica de xo(t)')
xlabel('Tiempo(s)')
ylabel('xo(t)')

%Grafica de xe(t)) que esta compuesta de cuatro funciones
subplot(3,2,2)
xe=((t>-1)&(t<=0)).*(2+t)/2+((t>0)&(t<=1)).*(2-t)/2+((t>-2)&(t<=-1)).*1+((t>1)&(t<=2)).*1;
plot(t,xe)
axis([-2 2 -2 3])
grid on
title('Grafica de xe(t)')
xlabel('Tiempo(s)')
ylabel('xe(t)')

%Grafica de x(-t) que esta compuesta de tres funciones
subplot(3,2,6)
xr=xo+xe;  %Construccion de x(t) a partir de la parte par e impar
plot(t,xr)
axis([-2 2 -2 3])
grid on
title('Grafica de x(t) formada con la suma de xe y xo')
xlabel('Tiempo(s)')
ylabel('x(t)')

