t = -2:0.0001:2;
s = ((t>-1)& (t<= 0)).*(t+1) + (((t>0) & (t<=1).*(1)))+ (((t>1) & (t<2)).*(2));
subplot (3,2,1)
plot (t,s)
axis ([-3 3 -3 3]);
title ('señal x(t)')
xlabel('t')
ylabel('Y[t]')
set(gca,'xtick', [-5 -4 -3 -2 -1 0 1 2 3 4 5]);
set(gca,'ytick', [-5 -4 -3 -2 -1 0 1 2 3 4 5]);
grid on
subplot (3,2,2)
plot (-1.*t,s)
axis ([-3 3 -3 3]);
title ('señal x(-t)')
xlabel('t')
ylabel('Y[t]')
set(gca,'xtick', [-5 -4 -3 -2 -1 0 1 2 3 4 5]);
set(gca,'ytick', [-5 -4 -3 -2 -1 0 1 2 3 4 5]);
grid on
u = ((t<1)& (t>= 0)).*(-t+1) + (((t<0) & (t>=-1).*(1)))+ (((t<-1) & (t>-2)).*(2));
e = (s+u)/2;
subplot (3,2,3)
plot (t,e)
axis ([-3 3 -3 3]);
title ('señal xe(t)')
xlabel('t')
ylabel('Y[t]')
set(gca,'xtick', [-5 -4 -3 -2 -1 0 1 2 3 4 5]);
set(gca,'ytick', [-5 -4 -3 -2 -1 0 1 2 3 4 5]);
grid on
o = (s-u)/2;
subplot (3,2,4)
plot (t,o)
axis ([-3 3 -3 3]);
title ('señal xo(t)')
xlabel('t')
ylabel('Y[t]')
set(gca,'xtick', [-5 -4 -3 -2 -1 0 1 2 3 4 5]);
set(gca,'ytick', [-5 -4 -3 -2 -1 0 1 2 3 4 5]);
grid on
h = o+e;
subplot (3,2,[5,6])
plot(t,h)
axis ([-3 3 -3 3]);
title ('señal xo(t) + xe(t)')
xlabel('t')
ylabel('Y[t]')
set(gca,'xtick', [-5 -4 -3 -2 -1 0 1 2 3 4 5]);
set(gca,'ytick', [-5 -4 -3 -2 -1 0 1 2 3 4 5]);
grid on
