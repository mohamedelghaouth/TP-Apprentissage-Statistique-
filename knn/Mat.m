function[v,t]=Mat(deb,fin,x,k,c)
r = randi([deb fin],1,k);
v1=[];
t=[];
for i=1:k
    j=r(i);
    plage = sprintf('A%d:D%d',j,j);
    d=xlsread('Iris.xls',plage);
    n=sqrt((d-x)*((d-x)'));
    v1=[v1 n]; 
    t=[t,c];
end 
[v,~]=sort(v1(:));
t=t';

%s=length(v1);
end