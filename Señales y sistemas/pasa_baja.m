%Diagrama de bode de un pasa baja
close all
clear
clc


w=0:0.02:5;
RC=1;

magG=1./sqrt(1+(w.*RC).^2);
semilogx(w,magG);
grid on
title('Magnitud de G(jw)')
ylabel('|G(jw)|')
xlabel('Frecuencia en rad/s, escala logaritmica')


w=-8:0.02:8;
argG=-atand(w.*RC);
figure
plot(w,argG)
grid on
title('Fase de G(jw)')
ylabel('Tetha(°)')
xlabel('Frecuencia en rad/s, escala lineal')