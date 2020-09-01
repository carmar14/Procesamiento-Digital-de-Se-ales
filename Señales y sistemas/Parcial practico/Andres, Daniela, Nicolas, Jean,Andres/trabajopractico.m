close all
clear 
clc

%Velocidad angular del motor continua
%parametros

R=1000;
J=7.95*10^-6;
Kp=0.04913;
Kb=Kp;
b=40.923*10^-6;
L=0;
nw=1;
denw=[R*J/Kp Kb/Kp+Kb];
ftcont=tf(nw,denw);
tao=0.6/5;
tao1=1;
tao2=0.4/5;
figure 
step(ftcont)
title('Velocidad angular')
%%-------------------------------------------------------------------------
%Movimiento angular del motor continua
num=1;
den=[R*J/Kp Kb/Kp+Kb 0];
ftc=tf(num,den);
figure 
step(ftc)
title('Movimiento angular')
%%-------------------------------------------------------------------------
%Corriente del motor continua
num1=[J b 0];
den1=[R*J Kp*Kb+Kb 0];
ftc1=tf(num1,den1);
figure
step(ftc1)
title('Corriente')
%%-------------------------------------------------------------------------
%Dsicretizacion  W(z)/V(z)
ftwd=c2d(ftcont,tao/10,'zoh');
figure 
step(ftwd)
title('Velocidad angular discreta')
%%-------------------------------------------------------------------------
% Discretizacion O(Z)/V(Z)
ftOd=c2d(ftc,tao1/10,'zoh');
figure
step(ftOd)
title('Movimiento angular discreta')
%%-------------------------------------------------------------------------
% Discretizacion I(Z)/V(z)
ftid=c2d(ftc1,tao2/10,'zoh');
figure 
step(ftid)
title('Corriente discreta')
%%-------------------------------------------------------------------------
%Estabalidad Continua del Sistema 
%Velocidad angular 
figure
pole(ftcont)
pzmap(ftcont);
title('Estabilidad velocidad angular Continua')
%Movimiento angular
figure
pole(ftc)
pzmap(ftc);
title('Estabilidad Movimiento angular Continua')
%corriente 
figure 
pole(ftc1)
pzmap(ftc1);
title('Estabilidad Corriente Continua')
%%-------------------------------------------------------------------------
% Estabilidad Discreta del Sistema 
% Velocidad angular 
figure
pzmap(ftwd);
title('Estabilidad velocidad angular Discreta')
%Movimiento angular
figure
pzmap(ftOd);
title('Estabilidad Movimiento angular Discreta')
%corriente 
figure 
pzmap(ftid);
title('Estabilidad Corriente Discreta')

%%-------------------------------------------------------------------------
% Velocidad angular en tiempo discreto 
syms z n
ftdw=(0.07135/(z - 0.9251))*z/(z-1);
wn=iztrans(ftdw,z,n);

i=1;
for n=0:tao/10:100

        w_n(i)=-0.9526*(0.9251)^n+0.9526;
     
    i=i+1;
end
figure 
n=0:tao/10:100;
stairs(n,w_n)

