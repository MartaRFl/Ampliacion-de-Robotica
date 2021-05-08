function [inicio, final] = InicioFinal(mapa)

%Devuelve le punto inicial y el final seleccionados mediante raton

figure 
imshow(mapa,'InitialMagnification','fit') %Hasta aquí como en el ejemplo dado por el profe
hold on

xlabel('Seleccione un punto de origen');
inicio=ginput(1);
round(inicio);
plot(inicio(1), inicio(2), 'go');

xlabel('Seleccione un punto final');
final=ginput(1);
round(final);
plot(final(1),final(2), 'ro');

end