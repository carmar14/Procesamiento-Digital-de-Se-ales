clc
clear
close all

%-------ejemplo señal seno-----
Fs = 1000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 1500;             % Length of signal
t = (0:L-1)*T;        % Time vector
S = 0.7*sin(2*pi*50*t)+ cos(2*pi*20*t+pi/4);
figure
plot(t,S)
xlabel('Tiempo(seg)')
ylabel('S(t)')
title('Señal en el tiempo')

%-----calculo de los coeficientes de Fourier y su espectro---
Y = fft(S);
%Compute the two-sided spectrum P2. Then compute the single-sided spectrum P1 based on P2 and the even-valued signal length L.
Y_= 2*Y(1:L/2+1);
P2 = abs(Y/L);
figure
plot(2*P2);
P1 = 2*P2(1:L/2+1);

%Define the frequency domain f and plot the single-sided amplitude spectrum P1. 
f = Fs*(0:(L/2))/L;
figure
plot(f,P1,'r')%,f,P3,'k') 
title('Espectro de amplitud unilateral de S(t)')
xlabel('f (Hz)')
ylabel('|S(f)|')
grid on
%-----calcular fase----
tol = 1e-6;
Y_(abs(Y_) < tol) = 0;
fase=rad2deg(angle(Y_));

figure
plot(f,fase,'r')
title('Fase de S(t)')
xlabel('f (Hz)')
ylabel('arg {S(f)} °')
grid on
%-------ejemplo señal seno-----