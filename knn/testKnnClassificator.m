function [Class]=testKnnClassificator(x,k)
x=x';
%m,n,Class
[v1,t1]=Mat(2,41,x,k,'s'); 
[v2,t2]=Mat(52,91,x,k,'V');
[v3,t3]=Mat(102,141,x,k,'v');
M=[v1;v2;v3];
T=[t1;t2;t3];
Class = knnclassify(x, M,T, k);
%length(T);
%[m,n]=size(M);
%knnclassify(x, M,T, k);
end

function[v1,t]=Mat(deb,fin,x,k,c)
r = randi([deb fin],1,k);
v1=[];
t=[];
for i=1:k
    j=r(i);
    plage = sprintf('A%d:D%d',j,j);
    d=xlsread('Iris.xls',plage);
   %n=sqrt((d-x)*((d-x)'));
    v1=[v1;d]; 
    t=[t,c];
end 
[v,~]=sort(v1(:));
t=t';
end