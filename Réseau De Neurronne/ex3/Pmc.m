
classdef Pmc
    properties(Access= public)
        %on presente le perceptro multicouche par un tableau de
        %multidimension
        tableaudeschouche
    end
    
    methods
        %c'est un constructeur dont le size est le nombre de couche 
        %et l'element i du vecteur s'est le nombre de perceptron dans la
        %couche i
        function obj=Pmc(vec)
            obj.tableaudeschouche=[];
            [~,nmbc]=size(vec);
            for i=1:nmbc
                if(i~=1)           
                objc=couche(vec(i),vec(i-1)+1);
                else
                   % les element de la couche d'entrer n'ont pas des
                   % laisons entrant
                   objc=couche(vec(i),0);
                end
                obj.tableaudeschouche=[obj.tableaudeschouche objc];
             end
        end
        
        %c'est une methode qui renvoeie la sorties du perceptron en
        %propagant la sortie depuis l'entree jusqu'au la sortie
        function s=donnreponse(obj,donn)
            %on commence par initialiser la couche d'entree
            [nmbe,~]=size(obj.tableaudeschouche(1).tableudeselem);
              for j=1:nmbe
                  obj.tableaudeschouche(1).tableudeselem(j,1).Sortie=donn(j,1);
              end
       %puis on cherche le nombre de couche
         [~,nmbc]=size(obj.tableaudeschouche);
         %on initialise la sortie au valeur donne a l'entree
         s=donn;
         %pour chaque couche on calcule le vecteur de  sortie jusqu'au on
         %arrive a la sortie final
        for i=2:nmbc
            %on commence par chercher le nombre d'element dans la couche
               [nmbe,~]=size(obj.tableaudeschouche(i).tableudeselem);
               %on intialise la srtie couche a un vecteur vide
               sorties=[];
               for j=1:nmbe
                   %pour chaque element on calcul la fonction d'entree
                   entree=(obj.tableaudeschouche(i).tableudeselem(j).VecteurPoidEntrant)*s;
                   %puis la sortie 
                   sortie=1/(1+exp((-entree)));
                   obj.tableaudeschouche(i).tableudeselem(j,1).Sortie=sortie;
                   %puis on ajout la sortie de l'elemnt au vecteur des
                   %sorties de la couche 
                   sorties=[sorties;sortie];    
               end
               %puis on affect la sortie de la couche au sortie final
              s=[sorties;1];  
              % et ainsi de suit jusqu'a arriver a la dernier couche
        end
        [si,~]=size(s);
        s=s(1:(si-1),1);
        end
        
        %c'est une methode qui fait la retro propagation du gradiant
        
     
        
    end
end
