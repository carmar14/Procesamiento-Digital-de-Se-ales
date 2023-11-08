clc
clear
close all

%-------ejemplo señal audio-----
[y,Fs] = audioread("prueba.mp3");
y=y(:,1);
%------vector de tiempo----
t=0:1/Fs:length(y)*(1/Fs)-(1/Fs);
t=t';
plot(t,y)

sound(y,Fs)

%-----calculo de los coeficientes de Fourier
%Compute the Fourier transform of the signal.
L=length(y);
Y = fft(y);
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
title('Espectro de amplitud unilateral de y(t)')
xlabel('f (Hz)')
ylabel('|Y(f)|')
%-----calcular fase----
tol = 1e-6;
Y_(abs(Y_) < tol) = 0;
fase=rad2deg(angle(Y_));
figure
plot(f,fase,'r')
title('Fase de y(t)')
xlabel('f (Hz)')
ylabel('arg{Y(f)} °')
grid on
%-------ejemplo señal audio-----