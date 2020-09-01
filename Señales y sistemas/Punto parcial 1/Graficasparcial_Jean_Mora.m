x= linspace(-2,4,1000);
t=zeros(1,length(x));
f=zeros(1,length(x));
k=zeros(1,length(x));
b=zeros(1,length(x));
%%-------------------------------------------------------------------------
% Lo primero es realizar la funcion original x(t)
for i=1:1:length(x)
    if  (x(i)>-1)&&(x(i)<=0)
        t(i)=x(i)+1;
     
    elseif (x(i)>0)&&(x(i)<=1)
        t(i)=1;
     
    elseif (x(i)>1)&&(x(i)<2)
        t(i)=2;
    end 
end 
figure (1)
subplot(4,1,1)
plot(x,t,'b')
title('Funcion original')
grid minor
%%-------------------------------------------------------------------------
% Se realizar la parte Invertida de la señal x(t),se denomina como x(-t)
for i=1:1:length(x)
    if  (x(i)>-2)&&(x(i)<-1)
        b(i)=2;
     
    elseif (x(i)>=-1)&&(x(i)<0)
        b(i)=1;
     
    elseif (x(i)>=0)&&(x(i)<1)
        b(i)=(-1)*x(i)+1;
    end 
end 

subplot(4,1,2)
plot(x,b,'y')
title('Funcion invertida')
grid minor
%%-------------------------------------------------------------------------
% Para poder realizar la parte par se hace la siguiente expresion
% (x(t)+x(-t))/2

for i=1:1:length(x)
    if  (x(i)>-2)&&(x(i)<-1)
        f(i)=1;
     
    elseif (x(i)>=-1)&&(x(i)<0)
        f(i)=(x(i)/2)+1;
     
    elseif (x(i)>=0)&&(x(i)<1)
        f(i)=(-1)*(x(i)/2)+1;
        
    elseif (x(i)>1)&&(x(i)<2)
        f(i)=1;
    end 
end 
 %%----------------------------------------------------------------------
 % Para realizar la parte impar se hace la siguiente expresion 
 % (x(t)-x(-t))/2
subplot(4,1,3)
plot(x,f,'r')
title('Funcion par')
grid minor
for i=1:1:length(x)
    if  (x(i)>-2)&&(x(i)<-1)
        k(i)=-1;
     
    elseif (x(i)>=-1)&&(x(i)<0)
        k(i)=x(i)/2;
     
    elseif (x(i)>=0)&&(x(i)<1)
        k(i)=x(i)/2;
    elseif (x(i)>1)&&(x(i)<2)
        k(i)=1;
    end 
end 
 
subplot(4,1,4)
plot(x,k,'g')
title('Funcion impar')
grid minor

