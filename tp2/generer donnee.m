function[d,Z,Y]=genererdonn()
Z=[];
Y=[];
nmbdonn=10;%nombre de donnée d'apprentissage
d = -5 + (5+5)*rand(nmbdonn,1);
r= randn(1,nmbdonn);
m=2;%cette variable indique le modéle 0:cst;1:linéaire;2:quadratique
for i=0:m
   l=d.^i;
   Z=[Z l];
end
for j=1:nmbdonn
    don=[];
    don=[(3-2*d(j)+r(j))];
    Y=[Y;don];    
end  
end

        


