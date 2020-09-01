function grafico
t= -2:0.005:2;
x =((t>-1)&(t<=0)).*(t+1)+((t>0)&(t<=1)).*(1)+((t>1)&(t<2)).*(2);
plot (t,x,'r'), grid 
axis ([-3 3 -3 3]);

figure
t= -2:0.005:2;
y =((t>0)&(t<=1)).*(-t+1)+((t>=-1)&(t<=0)).*(1)+((t>-2)&(t<-1)).*(2);
plot(t,y,'m'),grid
axis ([-3 3 -3 3]);

figure
p=(x+y)./2;
plot(t,p,'b'),grid
axis ([-3 3 -3 3]);

figure
i=(x-y)./2;
plot(t,i,'g'),grid
axis ([-3 3 -3 3]);


