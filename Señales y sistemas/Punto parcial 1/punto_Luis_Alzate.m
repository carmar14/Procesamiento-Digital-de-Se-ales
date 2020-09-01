

function punto
close all;
clear all;

N='Luis Miguel Alzate';
C='2127244';
disp(N)
disp(C)

x=-4:0.0001:4;
f=((x>=-1)&(x<0)).*(x+1)+((x>0)&(x<=1)).*(1)+((x>1)&(x<=2)).*(2);
subplot(2,2,1)
plot(x,f,'b','linewidth',3)
 title([ ' X(t)']) 
grid on

y=-4:0.0001:4;
f=((y>=-1)&(y<0)).*(1)+((y>0)&(y<=1)).*(-y+1)+((y<-1)&(y>=-2)).*(2);
subplot(2,2,2)
plot(y,f,'c','linewidth',3)
 title([ ' X(-t)']) 
grid on

z=-4:0.005:4;
f=((z>-2)&(z<=-1)).*(1)+((z>-1)&(z<=0)).*(1/2*(z+2))+((z>0)&(z<=1)).*(1/2*(-z+2))+((z>1)&(z<=2)).*(1);
subplot(2,2,3)
plot(z,f,'r','linewidth',3)
 title([ ' Xe(t)']) 
grid on

 w=-4:0.005:4;
 f=((w>-2)&(w<=-1)).*(-1)+((w>-1)&(w<=0)).*(1/2*(z-0))+((z>0)&(z<=1)).*(1/2*(z+1))+((w>1)&(w<=2)).*(1);
 subplot(2,2,4)
 plot(w,f,'g','linewidth',3)
 title([ ' Xo(t)']) 
 grid on







