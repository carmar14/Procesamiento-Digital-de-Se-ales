syms s
hold on
%punto 3-c
F1=(2*s+1)/(s+2);
f1=ilaplace(F1);
f1num=subs(f1,-14:0.01:14);
plot(-14:0.01:14,f1num,'b','LineWidth',2);
%punto 3-b
F2=(s^2+6*s+7)/(s^2+3*s+2);
f2=ilaplace(F2);
f2num=subs(f2,-14:0.01:14);
plot(-14:0.01:14,f2num,'r','LineWidth',2);
%punto 3-e
F3=(s^2+6*s+7)/(s*(s^2+4*s+13));
f3=ilaplace(F3);
f3num=subs(f3,-14:0.01:14);
plot(-14:0.01:14,f3num,'m','LineWidth',2);
grid on
hold off
%figure(1)
%plot(0:0.01:14,f1num,0:0.01:14,f2num,0:0.01:14,f3num)
%legend('F1','F2','F3','location','NortEastOutside');
%subplot(1,3,1)
%subplot(1,3,2)
%subplot(1,3,3);