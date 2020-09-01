syms s
hold on
R=1000;
c=1/1000000;
Is=(1/R)*(1/(s+(1/R*c)))
it=ilaplace(Is)
itnum=subs(it,0:0.01:14);
plot(0:0.01:14,itnum,'b','LineWidth',2);
pretty(Is)
pretty(it)
grid on
hold off