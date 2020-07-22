%%% d=ft de función 1 de longitud L, donde N >= L
close all
clear all
clc


N = 100;  
L = 10;

for k = 0:N-1
if (k == 0)
    Xk(k+1) = L;
else
    Xk(k+1) = (1- exp(-j*2*pi*k*L/N))/(1- exp(-j*2*pi*k/N));
end
end

k = 0:N-1;

subplot(211)
title('Magnitud')
stem(k,abs(Xk),'.')
subplot(212)
title('Fase')
stem(k,-atan2(imag(Xk),real(Xk)),'.')


    