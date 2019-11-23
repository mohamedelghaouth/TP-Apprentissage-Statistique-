function [sortie]=perceptron1(X)
X=X';
W=[ -0.6000   -6.1000    7.8000    2.3000  -1];

%[0.7327    2.9802   -3.4061   -1.6659    1.0000];
fonctionEntree=W*X;
sortie=0;
if fonctionEntree>0
    sortie=0;
else
    sortie=1;
end
disp("0:setosa;1:versicolor");
end