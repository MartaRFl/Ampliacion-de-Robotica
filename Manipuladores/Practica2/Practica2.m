%Datos proporcionados en el enunciado
Md = [100 0; 0 100];
Mdinv= inv(Md);
KD = [500 0; 0 500];
Kp = [2500 0; 0 2500];
%% Apartado 2.1
% Se define Kx como 10^3
Kx = [10^3 0;0 0];
chi1 = KD/(2*Md*sqrt((Kp+Kx)/Md))
wn1 = sqrt((Kp+Kx)/Md)

%Se define Kx como 10^4

Kx = [10^4 0;0 0];
chi2 = KD/(2*Md*sqrt((Kp+Kx)/Md))
wn2 = sqrt((Kp+Kx)/Md)
%% APARTADO 3
figure;
for K_D=-1000:1:1000
 K_P = (K_D^2/400) - 1000;
 plot(K_D,K_P,'.');hold on;
end
grid on;
text(-200,1000,'K_{P} = (K_{D}^{2}/4M_{P}) - K_{A} = (K_{D}^{2}/400) - 1000');
title('Kd y Kp para un sistema criticamente amortiguado')
xlabel('Kd');ylabel('Kp');

