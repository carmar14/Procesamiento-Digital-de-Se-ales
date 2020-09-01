X= (s^2+6*s+7)/(s^2+3*s+2);
Xt = ilaplace(X);
fplot(Xt)


figure
syms s
x= (2*s+1)/(s+2);
xt= ilaplace(x);
fplot(xt);

figure
X(s)= (s^2+6*s+7)/((s+3)*(s+5)^2);
xT= ilaplace(X(s));
fplot(xT);

figure
X(s)= (2+2*s*exp(-2*s)+4*exp(-4*s))/(s^2+4*s+3);
xe= ilaplace(X(s));
fplot(x);
