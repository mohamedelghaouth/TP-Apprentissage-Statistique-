function [S,D]=testPerceptron()
r = randi([2 100],1,1);
plage = sprintf('A%d:E%d',r,r);
[d,d1]=xlsread('Iris.xls',plage);
X1=[d -1];
D=d1;
S=perceptron((X1'));
disp("0:setosa;1:versicolor");
end