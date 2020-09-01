syms s t ; % forma simbolica (syms)de:(s) v. transformaada de laplace,(t) v.de tiempo. etc               
          %se usan para poder escribir ecuaciones con variables genéricas sin necesidad de crear vectores.
X(s)= (s^2+6*s+7)/(s^2+3*s+2);
xt= ilaplace(X(s));
pretty(xt) %imprimo bonito 
ezplot(xt); % muestra la respuesta en manera de ecuacion(funcion).

figure
X(s)= (2*s+1)/(s+2);
xt= ilaplace(X(s));
pretty(xt)
ezplot(xt);

figure
X(s)= (s^2+6*s+7)/((s+3)*(s+5)^2);
xt= ilaplace(X(s));
pretty(xt);
ezplot(xt);

figure
X(s)= (2+2*s*exp(-2*s)+4*exp(-4*s))/(s^2+4*s+3);
xt= ilaplace(X(s));
pretty(xt);
ezplot(xt);
