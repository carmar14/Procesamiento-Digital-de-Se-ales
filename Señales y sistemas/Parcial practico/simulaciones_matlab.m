%%
%Desarrolo de la parte continua
clear all
close all
clc

a=1;%input('Digite la amplitud de la señal seno');
f=500;%input('Digite la frecuencia de la señal seno');% frecuencia de la onda senoidal
Fs=10*f;%frecuencia de muestreo (en Hz)
t=0:1/Fs:1;%vector tiempo de 1 segundo
x=sin(2*pi*t*f);%onda senoidal

r1=200*10^3;
r2=40*10^3;
r3=50*10^3;
c1=25*10^-9;
c2=10*10^-9;

num=-1;
den=[(r1*r3*c1*c2) (r1*r3*c2)*((1/r1)+(1/r2)+(1/r3)) (r1/r2)];

sys=tf(num,den);

figure(1);
plot(t,x)
xlabel('Angulo (Radianes)')
ylabel('Amplitud')
title('Funcion seno')
axis([0 2*(1/f) -a-0.5 (a+0.5)])

figure(2);
step(sys)
xlabel('Tiempo')
ylabel('Amplitud')
title('Respuesta al escalon de la FDT')

figure(3);
lsim(sys,x,t)
xlabel('Angulo (Radianes)')
ylabel('Amplitud')
title('Respuesta de la FDT a una onda seno')
axis([0 2*(1/f) -a-0.5 (a+0.5)])
%%
%Desarrollo en tiempo discreto

fn=500;
Ts=1/(10*fn);
n=[0:Ts:6];
xn=sin(2*pi*fn*n);

figure(4);
stem(n,xn)
xlabel('Angulo (Radianes)')
ylabel('Amplitud')
title('Onda seno discreta')
axis([0 3/fn -a-0.5 (a+0.5)])

[numz,denz]=c2dm(num,den,Ts);
sys2=tf(numz,denz,Ts)

figure(5);
step(sys2)
xlabel('Muestreo')
ylabel('Amplitud')
title('Respuesta de la FDT a un escalon discreto')

figure(6);
lsim(sys2,xn,n)
xlabel('Angulo (Radianes)')
ylabel('Amplitud')
title('Respuesta de la FDT a una onda seno discreta')
axis([0 3/fn -a-0.5 (a+0.5)])


%faf
figure
fplot('0.0244-0.0244*((0.8187)^x)*cos(0.1993*x) + ((0.8187)^x)*sin(0.1993*x)',[0 100])
% fplot('-0.2006+0.2006*((0.8187)^x)*cos(0.19927*x) +  1.009*((0.8187)^x)*sin(0.19927*x)',[0 2])
syms z n
yz= (-0.006987*z-0.006113)*z/((z-1)*(z^2-1.605*z+0.6703))
yn=iztrans(yz,z,n)
fplot('(455539062676848968375*(-1)^n*6703^n*cos(n*(pi - acos((321*6703^(1/2))/26812))))/(1888026057384023556096*(100*6703^(1/2))^n) + ((-1)^n*4207^(1/2)*10000^(1 - n)*(- 4207^(1/2)*25i - 8025)^(n - 1)*20585536865835001824305i)/15885851246829174200991744 - ((-1)^n*4207^(1/2)*10000^(1 - n)*(- 8025 + 4207^(1/2)*25i)^(n - 1)*20585536865835001824305i)/15885851246829174200991744 - 73746443898191875/367606319584116736',[0 200])
%(455539062676848968375*(-1)^n*6703^n*cos(n*(pi - acos((321*6703^(1/2))/26812))))/(1888026057384023556096*(100*6703^(1/2))^n) + ((-1)^n*4207^(1/2)*10000^(1 - n)*(- 4207^(1/2)*25i - 8025)^(n - 1)*20585536865835001824305i)/15885851246829174200991744 - ((-1)^n*4207^(1/2)*10000^(1 - n)*(- 8025 + 4207^(1/2)*25i)^(n - 1)*20585536865835001824305i)/15885851246829174200991744 - 73746443898191875/367606319584116736
 