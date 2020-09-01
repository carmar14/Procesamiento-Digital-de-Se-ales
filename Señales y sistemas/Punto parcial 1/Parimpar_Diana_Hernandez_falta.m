t1 = -1:0.001:0-0.001;
t2 = 0:0.001:1-0.001;
t3 = 1:0.001:2-0.001;

x1 = t1 + 1;
x2 = ones(1,length(t2));
x3 = 2*ones(1,length(t3));

t = [t1,t2,t3];
x = [x1,x2,x3];

c = zeros(1,length(t1));

for i = 1:1:length(x)
    newx(1,i) = x(1,length(x)-i+1);
    newt(1,i) = -t(1,length(t)-i+1);
end

originalx = [c,x];
originalt = [-2:0.001:-1-0.001,t];
invertidax = [newx,c];
invertidat = [newt,1:0.001:2-0.001];

xo = (originalx+invertidax)/2;
xe = (originalx-invertidax)/2;

subplot(4,1,1)
plot(originalt,originalx)
xlim([-3 3])
ylim([-1 3])
grid on
ylabel('X(t)')
title('Señal Original')

subplot(4,1,2)
plot(invertidat,invertidax)
xlim([-3 3])
ylim([-1 3])
grid on
ylabel('X(-t)')
title('Señal Invertida')

subplot(4,1,3)
plot(originalt,xo)
xlim([-3 3])
ylim([-1 3])
grid on
ylabel('Xo(t)')
title('Señal Par')

subplot(4,1,4)
plot(originalt,xe)
xlim([-3 3])
ylim([-1 3])
grid on
ylabel('Xe(t)')
xlabel('t')
title('Señal Impar')

