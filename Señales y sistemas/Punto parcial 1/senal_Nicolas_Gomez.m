t=linspace(-2,2,1000);         % Se define el vector del tiempo.
x=zeros(1,length(t));          % Se crea un vector de ceros del tama�o del 
                               %  vector tiempo.
for i=1:1:length(t)            % Se crea el for para crear la se�al a trozos
   if t(i)>-1 && t(i)<=0       %  x(t).
      x(i)=t(i)+1;

   elseif t(i)>0 && t(i)<=1
      x(i)=1;

   elseif t(i)>1 && t(i)<2
      x(i)=2;
      
   end
end

figure(1)
plot(t,x)
title('Se�al Original')
xlim([-3 3])
ylim([0 2])
grid on

x_inv=zeros(1,length(t));

for i=0:1:length(t)-1              % Se invierte la se�al x(t).
    x_inv(i+1)=x(length(t)-i);
end

figure(2)
plot(t,x_inv)
title('Se�al Invertida')
xlim([-3 3])
ylim([0 2])
grid on

x_par=(x + x_inv)/2;               % Se crea la funcion par e impar de las 
x_imp=(x - x_inv)/2;               %  se�al mediante las expresi�nes:
                                   % xe=(x(t)+x(-t))/2, xo=(x(t)-x(-t))/2
figure(3)
subplot(2,1,1)
plot(t,x_par)
title('Se�al Par')
grid minor

subplot(2,1,2)
plot(t,x_imp)
title('Se�al Impar')
grid minor
