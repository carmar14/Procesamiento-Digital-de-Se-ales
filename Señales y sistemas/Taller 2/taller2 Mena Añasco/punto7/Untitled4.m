syms z n
'funcion en z'
Yz=((0.06727)*z)/((z-0.9231)*(z-1));
pretty(Yz)
'funcion en n'
yn=iztrans(Yz,z,n);
pretty(yn)
