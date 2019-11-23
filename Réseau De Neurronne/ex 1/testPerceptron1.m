function [S]=testPerceptron1()
M=[[2 0 1];[3 0 1];[0 3 1];[1 1 1]];
S=[];
[s,~]=size(M);
 for i=1:s
    j=perceptron((M(i,:))');
    S=[S;[M(i,1:2) j]];
 end
end