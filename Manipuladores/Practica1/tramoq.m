function [P, Q] = tramoq(P1, P2, P3, tau, T, t)
% Orientación
R1 = P1(1:3, 1:3);
R2 = P2(1:3, 1:3);
R3 = P3(1:3, 1:3);
%Posición
p1 = P1(1:3,4);
p2 = P2(1:3,4);
p3 = P3(1:3,4);
if (t<=-tau)%Este tramo es el lineal y corresponde a la izquierda de -tau
 [P, Qgen] = qpinter(P1,P2,(t+T)/T);
elseif (t>= tau)%Este tramo es el lineal y corresponde a la derecha de +tau
 [P, Qgen] = qpinter(P2,P3,t/T);
else %Este es el intervalo que esta entre - tau y tau. No es lineal y calculamos su suavizado
 inc_p1 = p2 - p1; %Restando cuanto ha variado p1 respecto de p2 vemos cual ha sido el incremento
 inc_p2 = p3 - p2; %Restando cuanto ha variado p2 respecto de p3 vemos cual ha sido el incremento
 P = p2 - ((tau-t)^2/(4*tau*T))*inc_p1 + ((tau+t)^2/(4*tau*T))*inc_p2; %Amplicamos la formula vista en clase para
 %calcular posicion respecto del tiempo
 
 %Se interpola la posicion mediante cuaternios auxiliares
 R01 = R1\R2; %Relacionamos la orientacion del punto P0 y P1
 q01 = tr2q(R01); %Calculamos el cuaternio de la relacion entre el punto P0 y P1
 theta01 = acos(q01(1))*2; %Calculamos el ángulo de giro
 n01 = q01(2:4)/sin(theta01/2); %parte vectorial del cuaternio
 
 R12 = R2\R3;%Relacionamos la orientacion del punto P1 y P2
 q12 = tr2q(R12);%Calculamos el cuaternio de la relacion entre el punto P1 y P2
 theta12 = acos(q12(1))*2;%Calculamos el ángulo de giro
 n12 = q12(2:4)/sin(theta12/2);%parte vectorial del cuaternio
 
 theta1p = (theta01*(-(tau-t)^2)/(4*tau*T));
 theta2p = (theta12*((tau+t)^2)/(4*tau*T));
 
 q1p = [cos(theta1p/2),n01*sin(theta1p/2)]; 
 q2p = [cos(theta1p/2),n12*sin(theta2p/2)]; 
 q2 = tr2q(R2);
 Qgen = qqmul(q2,qqmul(q1p,q2p));
end
Q = Qgen;
end