t = -2:0.001:2-0.001;
x = [zeros(1,1000),t(1001:2000) + 1,ones(1,length(t(2001:3000))),2*ones(1,length(t(3001:4000)))];

for n = 1:1:length(t)
    x2(1,n) = x(1,length(x)-n+1);
    t2(1,n) = -t(1,length(t)-n+1);
end
    
xo = (x+x2)/2;
xe = (x-x2)/2;

subplot(1,4,1); plot(t,x);   xlim([-2.1 2.1]);  ylim([-0.1 2.1]); grid on; title('x(t)')

subplot(1,4,2); plot(t2,x2);    xlim([-2.1 2.1]);   ylim([-0.1 2.1]);   grid on;    title('x(-t)')

subplot(1,4,3); plot(t,xo); xlim([-2.1 2.1]);   ylim([-1.1 1.1]);   grid on;    title('xo(t)');

subplot(1,4,4); plot(t,xe); xlim([-2.1 2.1]);   ylim([-1.1 1.1]);   grid on;    title('xe(t)');
