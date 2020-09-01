clear all

t = -3:0.1:3;

x1 = 2*dirac(t) - 3*exp(-5*t);
x2 = dirac(t) + exp(-2*t) + 2*exp(-t);
x3 =  t.*exp(t);
x4 = 1 - exp(-2*t).*cos(3*t) - exp(-2*t).*sin(3*t);

subplot(1,4,1)
plot(t,x1)
xlim([-4 4])
ylim([-10 10])

subplot(1,4,2)
plot(t,x2)
xlim([-4 4])
ylim([-10 10])

subplot(1,4,3)
plot(t,x3)
xlim([-4 4])
ylim([-10 10])

subplot(1,4,4)
plot(t,x4)
xlim([-4 4])
ylim([-10 10])

