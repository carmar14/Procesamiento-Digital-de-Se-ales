%datos=xlsread('Base brillo solar.xlsx'); %Se leen los datos del archivo en excel
%x=datos(1:180,4); 

x=Temp;
figure(1)
subplot(2,2,1), plot(x);
ylabel('Xn')
title('Trayectoria')
[fac_y,m]=autocorr(x,[],2);
subplot(2,2,2), autocorr(x,[],2)
title('fac');
[facp_y, mp] = parcorr(x,[],2);
subplot(2,2,3), parcorr(x,[],2)
title('facp');
v = (fac_y(1)-fac_y)/(fac_y(1)-fac_y(2));
subplot(2,2,4), stem(m,v);
grid
title('Variograma')

% eliminar la media
xt = x -mean(x);
% explora el orden
pvec = [1 2 3 4 5 6];
qvec = [1 2 3 4 5 6];
[mbest,minaic,pbest,qbest]=armabat(xt,pvec,qvec);
pbest
qbest

armapq = armax(xt,[pbest qbest]);
present(armapq)
armapq.a
armapq.c

tcrit = armapq.ParameterVector./sqrt(diag(armapq.CovarianceMatrix))

dato = iddata(xt);
rarmapq = resid(armapq,dato);
et = rarmapq.OutputData;
[H,P,Qstat,CV] = lbqtest(et, [20 25]', 0.05);
[H,P,Qstat,CV]
figure(3)

subplot(2,2,1), plot(et);
title('Residuos')
[fac_x,m] = autocorr(et,30,[],2);
subplot(2,2,2), autocorr(et,30,[],2);
title('fac muestral')
subplot(2,2,3), parcorr(et,30,[],2);
title('facp muestral')
v = (fac_x(1)-fac_x)/(fac_x(1)-fac_x(2));
subplot(2,2,4), stem(m,v);
grid
title('Variograma')

figure(4)
% uso de la funcion "compare"
mitad = floor(length(xt)/2);
ye = xt(1:mitad);
yv = xt(mitad+1:end);
model= armax(ye,[pbest qbest]);
compare(yv,model,1);