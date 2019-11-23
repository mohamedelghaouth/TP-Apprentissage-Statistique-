function [M]=MatriceDeDonneeIris(k)
k2=2*k;%nombre de donnée d'entrainement
r1 = randi([2 51],1,k);
r2 = randi([52 100],1,k);
r = [r1 r2];
X=[];
M=[];
for i=1:k2
         j=r(i);
         class=1;
         if (j>1)&&(j<=51)
                class=0;
         else
               class=1;
         end
         plage = sprintf('A%d:D%d',j,j);
         d=xlsread('Iris.xls',plage);
         X=[d  class];
         %X=[d -1 class];
         M=[M X'];
end 
%s=M(2,1:5);
end