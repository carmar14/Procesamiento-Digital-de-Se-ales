% Se realiza la respesta temporal del punto a parte 3 del taller
t=linspace(-5,5,1000);
x1=zeros(1,length(t));
for i=1:1:length(t)
     
              x1(i)=((-2)*exp(-3*(t(i)-4))+(2)*exp(-1*(t(i)-4)))*heaviside(t(i)-4)+exp(-1*t(i))-exp(-3*t(i))+(3*exp(-3*(t(i)-2))-exp(-1*(t(i)-2)))*heaviside(t(i)-2);
             

end
subplot(3,1,1)
plot (t,x1,'y')
title('Punto a')
grid minor
%%-------------------------------------------------------------------------
% Se realiza la respesta temporal punto b 
x2=8*exp(-2*t)- 4*exp(-1*t)+dirac(t);
figure (1)
subplot(3,1,2)
plot (t,x2)
title('Punto b')
grid minor
%%-------------------------------------------------------------------------
% Respuesta temporal punto c
x3=(-4)*exp(-2*t)+ exp(-2*t)+2*heaviside(t);
subplot(3,1,3)
plot (t,x3,'r')
title('Punto c')
grid minor
%%-------------------------------------------------------------------------


