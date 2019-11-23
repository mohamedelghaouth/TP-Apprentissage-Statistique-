function [sortie]=perceptron(X)
W=[-0.2000   -0.2000    0.5000];
fonctionEntree=W*X;
sortie=0;
if fonctionEntree>0
    sortie=1;
else
    sortie=0;
end
end