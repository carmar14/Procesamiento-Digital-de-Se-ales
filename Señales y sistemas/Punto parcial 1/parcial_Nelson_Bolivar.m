function[]= parcial()
clc
clear
close
disp('nelson bolivar   2150714')
t=-4:0.005:8;
x=((t<=0)&(t>-1)).*(t+1)+((t>0)&(t<=1)).*(1)+((t>1)&(t<2)).*(2);
y=((t>=0)&(t<1)).*(-t+1)+((t<0)&(t>=-1)).*(1)+((t<-1)&(t>-2)).*(2);
subplot(2,2,1);
plot(t,x,'r', 'LineWidth', 3), grid
title('Señal x(t)');
axis([-2 3 -1 3])
subplot(2,2,2);
plot(t,y,'r', 'LineWidth', 3), grid
title('Señal x(-t)');
axis([-3 2 -1 3])
subplot(2,2,3);
plot(t,0.5*(x-y),'r', 'LineWidth', 3), grid
title('Señal x0(t) impar');
axis([-3 3 -1 1])
subplot(2,2,4);
plot(t,0.5*(x+y),'r', 'LineWidth', 3), grid
title('Señal xe(t) par');
axis([-3 3 -0.5 1.5])