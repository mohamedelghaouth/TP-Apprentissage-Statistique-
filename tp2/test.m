function [ mvs,mvc]=test()
[D,Z,Y]=genererdonn();
Zv=[];
nmbdonn=10;%nombre de donnée d'apprentissage
%r= randn(1,nmbdonn);
r1= -5 + (5+5)*rand(nmbdonn,1);
m=2;%cette variable indique le modéle 0:cst;1:linéaire;2:quadratique
for i=0:m
   l=r1.^i;
   Zv=[Zv l];
end
sorti=[];
for j=1:nmbdonn
    don=[];
    don=[(3-2*r1(j))];
    sorti=[sorti;don];    
end  
[~,W]=descgradmat(Z,Y);
mvs=ValidationSimple(Zv,W,sorti);
mvc=ValidationCroiser(Z,Y,D);
disp("mvc: moyenne de la Validation croiser ");
disp("moyvaldsimple: moyenne de la Validation simple ");
end
