classdef couche
properties
    tableudeselem
end
methods
    function obj=couche(nmbe,nmbelmcp)
       obj.tableudeselem=[];
        for j=1:nmbe
          p=Perceptron(nmbelmcp); 
         obj.tableudeselem =[obj.tableudeselem;p];
        end
    end
    
end
end