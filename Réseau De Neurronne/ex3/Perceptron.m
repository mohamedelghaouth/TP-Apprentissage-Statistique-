classdef Perceptron
    properties  
        VecteurPoidEntrant%contient les poids des laison entrant dans le perceptron
        Sortie %la sortie du perceptron  
    end
    methods
        %le constructeur un nombre de laison pour genrer les poids entrant
        %d'une facon aléatoire
        function obj=Perceptron(nmblaison)
            if(nmblaison==0)
                obj.VecteurPoidEntrant=[];
                obj.Sortie=0;
            else
            obj.VecteurPoidEntrant=rand(1,nmblaison);
            obj.Sortie=0;
            end
        end
        %les foction qui vient sont des getters and setters 
       
    end
end