function [x,t,y,w,b]=testPerceptron2(k)
M = MatriceDeDonneeIris(k);
%M=M';
[m,n]=size(M);
x= M(1:m-1,:);
t=M(m,:);
net = perceptron;
net = train(net,x,t);
view(net)
%v=v';
y = net(x);
%s=size(y);

w = net.iw{1,1};
b = net.b{1};
end
function []=percrptronentrainer()

end