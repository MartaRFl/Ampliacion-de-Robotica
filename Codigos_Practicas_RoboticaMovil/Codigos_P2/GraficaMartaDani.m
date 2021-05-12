% Error cuadratico medio para la x
Resultado=0;

for(i=1:3251)
subplot(1,1,1);
hold on;
Resultado=Resultado+(data.true(1,i)-data.path(1,i))^2;
RMSEx=sqrt(Resultado/3251);
i=i+1;

end

% Error cuadratico medio para la y
Resultado=0;

for(i=1:3251)
Resultado=Resultado+(data.true(2,i)-data.path(2,i))^2;
RMSEy=sqrt(Resultado/3251);
i=i+1;
end

% Error cuadratico medio para la theta
Resultado=0;

for(i=1:3251)
Resultado=Resultado+(data.true(3,i)-data.path(3,i))^2;
RMSEtheta=sqrt(Resultado/3251);
i=i+1;
end

%Mostramos los resultados
RMSEx
RMSEy
RMSEtheta