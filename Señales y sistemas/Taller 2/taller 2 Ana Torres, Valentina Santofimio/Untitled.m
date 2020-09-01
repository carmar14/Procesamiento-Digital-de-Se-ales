syms z k;
Yz= ((0.02909*z+0.02721)/(z^2-1.753*z+0.8187))*(z/(z-1));
yk=iztrans(Yz);
pretty(yk)
ezplot(Yz);


figure
Yz1= ((0.06727)/(z-0.9231))*(z/(z-1));
yk0 = iztrans(Yz1);
pretty(yk0)
ezplot(Yz1);

figure
Yz2= ((0.001847*z+0.001847)/(z^2-1.8147*z+0.8521))*(z/(z-1));
yk1=iztrans(Yz2);
pretty(yk1)
ezplot(Yz2);









