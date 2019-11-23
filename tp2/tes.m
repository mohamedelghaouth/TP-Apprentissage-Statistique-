function [Winitial,W]=tes()
[D,Z,Y]=genererdonn();
[ Winitial,W]=descgradmat(Z,Y);
end