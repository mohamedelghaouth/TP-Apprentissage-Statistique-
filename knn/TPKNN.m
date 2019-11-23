
%la fonction IrisKNNclassificator renvoie un vecteur colonne
%contenant les classes des k plus proche viosin 
%V:Iris-versicolor
%s:Iris-setosa
%v:iris-virgignica
function[t]=IrisKNNclassificator(x,k)
[v1,t1]=Mat(2,41,x,k,'s'); 
[v2,t2]=Mat(52,91,x,k,'V');
[v3,t3]=Mat(102,141,x,k,'v');
M=[v1;v2;v3];
T=[t1;t2;t3];
[~,idx]=sort(M(:,1));
M=M(idx,:);
t=T(idx,:);
t=t(1:k,1);
disp('V:Iris-versicolor/////s:Iris-setosa/////v:iris-virgignica');
end


%cette fontion Mat revoie une matrice s=[v,t]
%tq v est un vecteur trier dans l'ordre croissant 
%contenat les distance separant x d'une classe parmis les trois classes
%dont les element sont regrouper entre les indice deb et fin 
%dans le fichier Iris.xls
function[v,t]=Mat(deb,fin,x,k,c)
r = randi([deb fin],1,k);
v1=[];
t=[];
for i=1:k
    j=r(i);
    plage = sprintf('A%d:D%d',j,j);
    d=xlsread('Iris.xls',plage);
    n=sqrt((d-x)*((d-x)'));
    v1=[v1 n]; 
    t=[t,c];
end 
[v,~]=sort(v1(:));
t=t';
end

