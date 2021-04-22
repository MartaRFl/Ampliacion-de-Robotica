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
  if (MatrizAux(i,7)=! 0)
         Resultado(K,L)=A;%Introducimos el INICIO Resultado[K]=A;
         L=L+1;
         Resultado(K,L)=MatrizAux(i,A)%Introducimos ese valor en la posicion Resultado[K]=Matriz(j,ant);
         ant=i;
         encontrado=1;
  end
  %Primera iteracion i=4, j=1, ant=4
  
  
  while(encontrado==1)
    while(columna<=A])                         %  c=1               c=2 !!        
          if(MatrizAux(j, ant) == 0) %1ª iteracion (j=1 ant=4)--> (j=2 ant=4) --> (j=2 ant=1) --> (j=1 ant=1) --> (j=2 ant=1)
                    j = j+1; %(j=2) 
          else
                    Resultado(K,L)=MatrizAux(j,ant); %Introducimos el valor en la posicion Resultado(K)=Matriz(j,ant)
                    L=L+1;
                    MatrizAux(j,ant)=0;
                    ant=j; %1ª iteracion (ant=2) --> (ant=1)
                    j=1;
          end
          if(ant==1 && j==1)
                    Columna=8;
          end
          
          Columna=Columna+1; %C=2 - C=3 - C=4 - 
          end
    if(columna>7)
              K=K+1;
              encontrado=0;
    end
          
      end
  end
                    
                              