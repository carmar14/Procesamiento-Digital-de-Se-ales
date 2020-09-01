%Funcion de transferencia---> H(s)=Vc(s)/U(s)=3/(s^2+4s+3)
close all
clear
clc

fplot('0.5*exp(-3*x)-1.5*exp(-x)+1',[0 7])
title('Usando la respuesta en el tiempo')
figure
step(tf(3,[1 4 3]));
title('Usando el comando step')