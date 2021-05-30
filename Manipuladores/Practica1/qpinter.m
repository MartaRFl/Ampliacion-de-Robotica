function [pr, qr] = qpinter(Pa,Pb,t)
pa = Pa(1:3,4);
pb = Pb(1:3,4);
%% Traslación
% Interpolacion de P2 y P1
pr = pa+ t*(pb-pa);
%% Rotación
% Conversion a cuaternio de las respectivas matrices homogeneas. Se toma la
% solucion positiva
qa = tr2q(Pa);
qb = tr2q(Pb);
% Se multiplica qa inversa por qb
q = qqmul(qinv(qa),qb);
% Angulo de giro de la interpolacion
theta = acos(q(1))*2;
% Parte vectorial
n = q(2:4) /sin(theta/2);
% Cuaternio general
qgen = [cos(theta*t/2), n*sin(theta*t/2)];
% Multipliacion de cuaternios para obtener Taylor
qr = qqmul(qa,qgen);
end