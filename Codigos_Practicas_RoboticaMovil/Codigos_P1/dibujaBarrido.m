function dibujaBarrido(x, y, x0, y0, phi0, rangos)
% Dibuja barrido 2D
% x, y: lista de puntos del entorno cerrado
% x0, y0, phi0: posici�n y orientaci�n del veh�culo
% rangos: lista ordenada de distancias medidas

% C�lculo de coordenadas locales
paso= 5*pi/180;
alfa= 0:paso:2*pi-paso;
xl= rangos.*cos(alfa);
yl= rangos.*sin(alfa);

% C�lculo de coordenadas globales
xg= x0+cos(phi0)*xl-sin(phi0)*yl;
yg= y0+sin(phi0)*xl+cos(phi0)*yl;

plot(x, y, xg, yg, '*')
axis('equal')
hold on

end