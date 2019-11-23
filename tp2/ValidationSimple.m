function [moyvalsimple]=ValidationSimple(Z,W,Y)
moyvalsimple=(norm(Y-(Z*W)));
[s,~]=size(Y);
moyvalsimple=moyvalsimple/(sqrt(s));
end