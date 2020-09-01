function [] = Parcialfinal(n,A)
close all
t = -2*pi:0.1:2*pi;
m = zeros(n,length(t));
for i= 1:n;
    if rem (i,2) == 0 || i<3
    if i == 1
        an=0;
        bn=A/2;
        
    else
        an=(A/pi)*((((-1)^i)+1)/(1-(i^2)));
        bn=0;
    end
    
    m(i,:)=  (an*cos(i*t))+(bn*sin(i*t));
    
    f = (A/pi)+sum(m);
    plot(t,f);
    end
end

%Animacion
l1=0;
l2=0;
l3=0;
k= zeros(1,length(t));
for i= 1:n
      if rem (i,2) == 0 || i<3
        k(1,:)=(k(1,:)+ m(i,:));
        for h=1:length(t)
            z(i,h)= i;
            subplot(1,2,1)
            plot3(z(i,1:h),t(1:h), m(i,1:h));
            grid on
            hold on
            subplot (1,2,2)
                  
           plot(t(1:h),((A/pi)+k(1,1:h)))
           hold on
           grid on
           pause(0.001)
        end
        color=[rand(1) rand(1) rand(1)];
        
        plot((A/pi)+k,'Color',color)
           
    end
end

legend('1','2','4')
figure
plot(t,f)




 

