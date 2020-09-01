syms z n
a=3694/5929;
b=a;
c=-0.6;
e=0.923;
'funcion en z'
Yz=(a*z/(z-1)-(b*z/(z-e))+(c*z/(z-e)^2));
pretty(Yz)
'funcion en n'
yn=iztrans(Yz,z,n);
pretty(yn)
