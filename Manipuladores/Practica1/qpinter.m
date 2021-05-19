function [pr, qr] = qpinter(Pa,Pb,t)
pa = Pa(1:3,4);
pb = Pb(1:3,4);
%% Traslación
% Se interpola la posicion
pr = pa+ t*(pb-pa); %Ecuacion 5
%% Rotación
% Se obtienen los cuaternios
qa = tr2q(Pa);
qb = tr2q(Pb);
% Cuaternio de interpolacion en funcion de los cuarternios iniciales y finales
q = qqmul(qinv(qa),qb);
% Se calcula el angulo de giro de q interpolacion
theta = acos(q(1))*2;
% Cálculo de la parte vectorial
n = q(2:4) /sin(theta/2);
% Se crea q guiado
qtemp = [ cos(theta*t/2), n*sin(theta*t/2)];
% Quaterno Taylor interpolacion
qr = qqmul(qa,qtemp);
end