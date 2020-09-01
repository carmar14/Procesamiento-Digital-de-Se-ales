close all
clear 
clc
a=17;
A=1;
t=-2*pi:0.01:2*pi;
for n=1:a
        bn=2*A*sin(n*pi/2)/(n*pi);
        f(n,:)=bn*cos(n.*t);
        
    end

    
fr=sum(f)+1/2;

plot(t,fr)



for n=1:a
        an=2*A*(cos(n*pi)-1)/((pi^2)*(n^2));
%         bn=4*A/((pi^2)*(n^2));
        f(n,:)=an*cos(n.*t);
        
end

    
fr=sum(f)+A/2;

plot(t,fr)


for n=1:a
        an=4*A*sin(pi*n/2)/(pi*n);
%         bn=4*A/((pi^2)*(n^2));
        f(n,:)=an*cos(n.*t);
        
end

    
fr=sum(f);

plot(t,fr)

% 
% for n=1:a
%         bn=(1/n^2+2*pi/n);
%         f(n,:)=-bn*sin(n.*t);
%         
% end
% 
%     
% fr=sum(f)+A/pi^2;
% 
% plot(t,fr)