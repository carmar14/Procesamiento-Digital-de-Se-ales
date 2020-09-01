function tarea
t = [-2:0.005:2];
w = (t+1).*((-1<t)&(t<=0));
y = 1.*((0<t)&(t<=1));
z = 2.*((1<t)&(t<=2));
x = (w + y + z);
plot (t, x, 'r')
title ('x(t)')
% axis ([-5 5 -5 5]);
grid on

figure
t = [-2:0.005:2];
a = (-t+1).*((-1<-t)&(-t<=0));
b = 1.*((0<-t)&(-t<=1));
c = 2.*((1<-t)&(-t<=2));
n = (a + b + c);
plot (t, n, 'r')
title ('x(-t)')
axis ([-5 5 -5 5]);
grid on

figure
t = [-2:0.005:2];
v = (x + n)./2;
plot (t, v)
title ('PAR')
axis ([-5 5 -5 5]);
grid on

figure
t = [-2:0.005:2];
s = (x - n)./2;
plot (t, s)
title ('IMPAR')
axis ([-5 5 -5 5]);
grid on





