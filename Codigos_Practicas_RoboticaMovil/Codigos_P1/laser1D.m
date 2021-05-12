function rango= laser1D(x, y, phi, rho, x0, y0, phi0)
% Simulación de un láser 1D
% x, y: lista de puntos del entorno cerrado
% phi, rho: parámetros de las rectas el entorno
% x0, y0, phi0: posición y orientación del láser

    tol=1e-3;
    
    % Parámetro del rayo laser
    rho0=x0*cos(phi0)+y0*sin(phi0);
    
    
    % Cálculo de las intersecciones
    
    xc= ones(size(phi))*100;
    yc= xc;
    for k=1:length(xc)
      den= det([sin(phi(k)) cos(phi(k));sin(phi0) cos(phi0)]); 
      if abs(den)>=tol
        xc(k)= det([rho0 sin(phi0);rho(k) sin(phi(k))])/den;
        yc(k)= det([cos(phi0) rho0;cos(phi(k)) rho(k)])/den;
      end
    end
    % Comprobación de pertenencia al segmento
    for k=1:length(xc)
        Xmax= max(x(k), x(k+1));
        Xmin= min(x(k), x(k+1));
        Ymax= max(y(k), y(k+1));
        Ymin= min(y(k), y(k+1));
        if (xc(k)<Xmin-tol) || (xc(k)>Xmax+tol) || (yc(k)<Ymin-tol) || (yc(k)>Ymax+tol)
          xc(k)= 100;
          yc(k)= 100;
        end
    end
    % Comprobación de la misma orientacion
    xc= xc(xc~=100);
    yc= yc(yc~=100);
    phi= atan2(x0-xc, yc-y0);
    xc= xc(abs(phi-phi0)<tol);
    yc= yc(abs(phi-phi0)<tol);
    d= sqrt((xc-x0).^2+(yc-y0).^2);
    
    % Quedarse con la mínima distancia
    rango= min(d);
    
    % Adición de ruido
    rango= rango+0.05*randn;
end