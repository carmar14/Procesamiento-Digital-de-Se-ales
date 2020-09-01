syms z n
a=283/288;
b=a;
c=-0.09;
e=0.904;
'funcion en z'
Yz=(a*z/(z-1)-(b*z/(z-e))+(c*z/(z-e)^2));
pretty(Yz)
'funcion en n'
yn=iztrans(Yz,z,n);
pretty(yn)