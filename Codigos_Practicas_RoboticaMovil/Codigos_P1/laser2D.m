function rangos= laser2D(x, y, x0, y0, phi0)
% Simulación de un laser 2D de 360 grados y 5 grados de resolución
% x, y: lista de puntos del entorno cerrado
% x0, y0, phi0: posición y orientación del vehículo

% Parámetros de las rectas del entorno
for k=1:length(x)-1 
    phi(k)=atan2(x(k)-x(k+1),y(k+1)-y(k));
    rho(k)=x(k)*cos(phi(k))+y(k)*sin(phi(k));
end

% Dirección de los rayos láser
paso= 5*pi/180;
orient= (phi0-pi/2:paso:phi0+3*pi/2-paso);
orient(orient>pi)= orient(orient>pi)-2*pi;
orient(orient<-pi)= orient(orient<-pi)+2*pi;

% Cálculo de distancias
for k=1:length(orient)
    rangos(k)= laser1D(x,y,phi,rho,x0,y0,orient(k));
end

end