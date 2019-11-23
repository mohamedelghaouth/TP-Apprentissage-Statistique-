 function[W]=EntrenerPerceptron1()
pas=0.1;
b=0.5;
W=[2;-1;b];
%[[0 0 1];[0 1 1];[1 0 1];[1 1 1]];
M=[[2 0 1];[0 3 1];[3 0 1];[1 1 1]];
y=[1;0;0;1];
nmbIterration=200;
for j=1:nmbIterration
    for i=1:4
         fonctionEntree=(M(i,:))*W;
          if fonctionEntree>0
               sortie=1;
         else
               sortie=0;
         end
         if sortie~=y(i)
               W=W+((pas*(y(i)-sortie))*M(i,:))';  
         end
    end
end
W =(W');
end