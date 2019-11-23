function [W]=MethodeMatricielle(Z,Y)
W=((Z*(Z'))^-1)*(Z')*Y;
end