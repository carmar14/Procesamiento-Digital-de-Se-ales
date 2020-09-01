function [] = seno (n,A) %aqui se crean los parametros n van a ser los armonicos y A sera la amplitud
close all
t = -2*pi:0.1:2*pi; % se crea un vector t 
m = zeros(n,length(t)); % se crea un vector de ceros que se va a llenar con n y con el tamaño de t
for i= 1:n;           % se crea i que va desde 1 hasta todos los nueros de n
    if rem (i,2) == 0  % rem es el residuo como la funcion es par pues tiene que dar cero entonces es una condicion 
        m(i,:)=  (1/((i^(2))-1)* cos(i.*t)); % aqui se crea m que son los armonicos es decir lo que va dentro de la sumatoria
%  p = ((2*A)/pi)-(((4*A)/pi)*sum(m));
    end
end

p = ((2*A)/pi)-(((4*A)/pi)*sum(m)); % esta ya es toda la funcion 

%Animacion
l1=0;
l2=0;
l3=0;
k= zeros(1,length(t)); % se crea un vector de ceros igual al de arriba 
for i= 1:n
      if rem (i,2) == 0
        k(1,:)=(k(1,:)+ m(i,:)); % aqui se crea una variales que me suma los armonicos con los numeros desde 1 hasta todos los que sean necesarios
        for f=1:length(t)    % se crea f que es la variable que recorre la señal 
            z(i,f)= i;       % z es un posicionador en 3d (ver imagen)
            subplot(1,2,1)
            plot3(z(i,1:f),t(1:f), m(i,1:f)); 
            grid on
            hold on
            subplot (1,2,2)
                  
           plot(t(1:f),2*A/pi-4*A/pi*k(1,1:f)) % aqui se agrega la parte dc de la funcion que se multiplica con k para que me muestre la grafica
           hold on
           grid on
           pause(0.001)
        end
        color=[rand(1) rand(1) rand(1)]; % esto es para darle colores a las lineas 
        
        plot(t,2*A/pi-4*A/pi*k,'Color',color)
           
    end
end

legend('2','4','6')
figure(2)
plot(t,p)







 
 




