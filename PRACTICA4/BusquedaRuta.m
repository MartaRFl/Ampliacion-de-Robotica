function (COSTES) = devuelve (coste, ruta)
final= 1;
inicio = 1;
coste=0;
Matriz=G;
A=size(G) %G es la matriz de costes
array=zeros(1, A);
K=1;
encontrado=0;
final=0;
columna=1;

for(i=[1:A]) 
  if (Matriz(i,7)=! 0)
         Introducimos ese valor en la posicion Resultado[K]=Matriz(j,ant)
         ant=i;
         encontrado=1;
  end
  %Primera iteracion i=4, j=1, ant=4
  
  
  while(encontrado==1)
    while(columna=! 7])                         %  c=1               c=2 !!        
          if(Matriz(j, ant) == 0) %1ª iteracion (j=1 ant=4)--> (j=2 ant=4) --> (j=2 ant=1) --> (j=1 ant=1) -->--> (j=2 ant=1)
                    j = j+1; %(j=2) 
          else
               
          if(ant==1)
                     final=1;  
          end
          
                    Introducimos el valor en la posicion Resultado(K)=Matriz(j,ant)
                    ant=j; %1ª iteracion (ant=2) --> (ant=1)
                    j=1;
          end
          
          
          if(final==1)
                      K=K+1;
                      ant=memoria+1;
                      
          end
                    if(columna==7)
                               encontrado=0;             
                    end
      end
  end
end
                    
                              