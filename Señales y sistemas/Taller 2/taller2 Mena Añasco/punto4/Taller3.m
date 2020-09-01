syms s
hold on
R=1000;
c=1/1000000;
T=1/R*c;
Vcs=(1/s)-(1/(s+T))
Vct=ilaplace(Vcs)
Vctnum=subs(Vct,0:0.01:14);
plot(0:0.01:14,Vctnum,'b','LineWidth',2);
pretty(Vcs)
pretty(Vct)
grid on
hold off
