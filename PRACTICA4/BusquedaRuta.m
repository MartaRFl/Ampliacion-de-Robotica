function (COSTES) = devuelve (coste, ruta)
final= 1;
inicio = 1;
coste=0;
Matriz=G;
A=size(G) %G es la matriz de costes
array=zeros(1, A);
K=1;
L=1;
encontrado=0;
final=0;
columna=1;
MatrizAux=Matriz;
%Cada vez que introduzcamos un numero en Resultado, L (la columna) debe
%avanzar
%Cada vez que terminemos un posible camino, K aumenta uno (Fila nueva)

for(i=[1:A]) 
  if (MatrizAux(i,A)=! 0)
         ant=i;
         encontrado=1;
  end
 
 while (encontrado==1) % De aqui solo nos podemos salir si hemos terminado todas las combinaciones de la posicion inicial(74-76)
           
          while(columna<=A])   
                    if(MatrizAux(j, ant) == 0)
                              j = j+1; 
                    else
                     Tam=Tam+1;
                     ant=j; 
                     j=1; % Hasta aqui calculamos el tamaño de la columna a la que lleguamos
                    end
          end
   % Una vez sabemos cual es el tamaño de la columna a la que hemos llegado
   %Tenemos que introducir tantas filas en la matriz resultados
   %Como números de posibles destinos tenemos
   ant=i;
   
   for(q=[1:Tam])
             Resultado(K,1)=A;
             K=K+1;
   end
   
   %Aqui lo que tenemos es un array de una columna 5 filas todos los
   %numeros de valor 7
   K=1;
          while(p<Tam])   
               if(MatrizAux(j, ant) == 0)
                              j = j+1; 
               else %Aqui La primera vez L=K=1
                 Resultado(K,L)=i; %Metemos el 7
                 L=L+1; %Ya hemos metido el 7, ahora vamos a meter todos los numeros de la columna
                 Resultado(K,L)=MatrizAux(j,ant); %Introducimos el valor en la posicion Resultado(K)=Matriz(j,ant)
                 L=L+1;
                 p=p+1;
                 ant=j; %1ª iteracion (ant=2) --> (ant=1)
                 j=1;
               end
   
           
           
         
           
           
           
           
           
           
 end