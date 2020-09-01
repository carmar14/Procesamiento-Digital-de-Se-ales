%%
clear all
close all 
clc

%Señal de entrada
x=-2:0.01:2;
fori=((x>-1)&(x<=0)).*(x+1)+((x>0)&(x<=1)).*(1)+((x>1)&(x<2)).*(2);


par=zeros(1,length(fori)); %// arreglo de ceros, se guarda la simetria par
impar=zeros(1,length(fori)); %// arreglo de ceros, se guarda la simetria impar

for i=1:length(fori)
   par(1,i)=(fori(1,i)/2)+(fori(1,(length(fori)+1-i))/2);
   impar(1,i)=(fori(1,i)/2)-(fori(1,(length(fori)+1-i))/2);
end


subplot(3,1,1)
plot(x,fori,'b')
title('Señal original')
subplot(3,1,2)
plot(x,par,'r')
title('Simetria Par')
subplot(3,1,3)
plot(x,impar,'g')
title('Simetria Impar')