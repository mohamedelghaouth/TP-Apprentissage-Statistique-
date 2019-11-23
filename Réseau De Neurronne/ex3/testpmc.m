function [l,s1]=testpmc()
M=[];
D=[];
for i=1:3
    for j=1:40
        r = randi([2 100],1,1);
        plage = sprintf('A%d:D%d',r,r);
        [d]=xlsread('Iris.xls',plage);
        X1=[d -1];
        d1=[0 0 0];
        d1(i)=1;
        D=[D;d1];
        M=[M;X1];
    end
end
    obj=Pmc([4 10 3]);
    donn=M(1,:);
    l=donnreponse(obj,donn');
   % obj1=entrenairperceptron(obj,100,0.5,M,D);
 
        %nmbepq c'est le nombre d'epoque
        %M matrice des donnees 
        %S vecteur contenant les vecteur des sortie entandu
        [nmbd,~]=size(M);
        s=[];
        [~,nmbc]=size(obj.tableaudeschouche);
        %le  traitement qui suit est pour chaque epoque
        for i=1:50
            sorties=[];
            %pour chaque donee on fait...
            for j=1:nmbd
               % on commence par propage la donnee vers la fin
                s=obj.donnreponse((M(j,:)'));
                %pius on met la difference entre la sortie entandue et la
                %sortie donnee par le perceptron dans un vecteur appeler sortie 
                [nmbe,~]=size(obj.tableaudeschouche(nmbc).tableudeselem);
                sorties=(D(j,:)')-s;
                %puis on injecte les valeur du vecteur sortie dans les
                %perceptrons du derniere couche du reseau
               for k=1:nmbe
                   obj.tableaudeschouche(nmbc).tableudeselem(k).Sortie=sorties(k);
               end
               sorties=[];
               %puis on commence la propagation en arriere
               %          sens de propagation
               %suivant <--------------------- precedent
               % k-1             k               k+1
              
               % pour chaque couche on fait...
               for k=(nmbc-1):1
                   %on comence par chercher le nombre d'element dans 
                   %la couche qui est en cours de traitement ,c'est donc la couche k,
                   %celle qui
                   %la precede et si necessaire celle qui la suit
                [nmbe,~]=size(obj.tableaudeschouche(k).tableudeselem);
                [nmbe1,~]=size(obj.tableaudeschouche(k+1).tableudeselem);                
                %si on est a la couche d'entree il y a plus de couche
                %suivnte 
                if(k~=1)
                [nmbe2,~]=size(obj.tableaudeschouche(k-1).tableudeselem);
                end
                %on commence par mettre les sorties de la couche k dans un 
                %un vecteur
                for t=1:nmbe
                  sorties=[sorties;obj.tableaudeschouche(k).tableudeselem(t).Sortie];
                end
                %on commence par modifier les poid entranr de chaque element  
                %de la couche precedente
                for z=1:nmbe1
                W=[];
                variance=0;
                W=obj.tableaudeschouche(k+1).tableudeselem(k).VecteurPoidEntrant;
                variance=obj.tableaudeschouche(k+1).tableudeselem(z).Sortie;
                W=W+(00.5)*variance*sorties;
                obj.tableaudeschouche(k+1).tableudeselem(z).VecteurPoidEntrant=W;  
                end   
                sorties=[];
               %puis ,si on est pas a la derniere couche ,on remplace les
               %sorties des elements de la couche en cours par leur
               %variance, car c'est leur variances qui comptes dans la
               %retropropagation de gradiant
                if(k~=1)
                    %pour chaque element de la couche k on fait...
                for t=1:nmbe
                    W1=[];
                    V=[];
                    %pour chaque laison liant l'element en cour avec la
                    %couche precedante, on met le poid dans le vecteur W1
                    %et pour chaque sortie de la couche precedente ,qui est
                    %en faite un variance ,on la met dans un vecteur V
                  for z=1:nmbe1
                   w=obj.tableaudeschouche(k+1).tableudeselem(z,1).VecteurPoidEntrant(t);
                   W1=[W1 w];
                   variance=obj.tableaudeschouche(k+1).tableudeselem(z,1).Sortie; 
                   V=[V;variance];
                  end
                  %pour calculer les variances des elements de la couche en
                  %cour de traitement on a besoin des sorties de la couche
                  %suivante
                  for l=1:nmbe2
                  sorties=[sorties;obj.tableaudeschouche(k-1).tableudeselem(l,1).Sortie];
                  end
                  %puis on calcul l'entree de l'element en cours de
                  %traitement
                  entree=0;
                  entree=obj.tableaudeschouche(k).tableudeselem(t,1).VecteurPoidEntrant*sorties;
                  %et on calcule la variance de l'element en cour de
                  %traitement
                  sort=0;
                  sort=1/(1+exp((-entree)));
                  sort=sort(1-sort);
                  v=0;
                  v=sort*(W1*V);
                  %puis on remplace la sortie de l'element en cours de
                  %traitement par s variane
                  obj.tableaudeschouche(k).tableudeselem(t,1).Sortie=v;
                end
               % et on repaite sa pour chaque element de la couche k
                end
               end
                % et on repaite sa pour chaque  couche k
            end
          % et on repaite sa pour chaque donee
        end
       % et on repaite sa pour chaque epoque
          obj1=obj;
        
     s1=donnreponse(obj1,donn'); 
end
