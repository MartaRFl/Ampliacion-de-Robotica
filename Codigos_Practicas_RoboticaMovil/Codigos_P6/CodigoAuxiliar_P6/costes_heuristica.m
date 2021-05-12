function [costes, h] = costes_heuristica(nodos, adj)

costes = zeros(size(adj));
h = zeros(size(adj));

for i = 1:size(nodos,1)
    for j = 1:size(nodos,1)
        
        dij=sqrt((nodos(i,2) - nodos(j,2))^2 + (nodos(i,3) - nodos(j,3))^2);
        h(i,j) = dij;
  
        if(adj(i,j) ~= 0)
            costes(i,j) = dij;
        end 
        
    end
end
end