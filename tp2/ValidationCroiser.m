function [moyvalcrois]=ValidationCroiser(Z,Y,D)
moyvalcrois=0;       
for k=1:size(D)
            Zt=[];
            Yt=[];
            for j=1:size(Z)
                if j~=k
                Zt=[Zt;Z(j,:)];
                Yt=[Yt;Y(j)];
                end
            end
          [~,w1]=descgradmat(Zt,Yt);
          moyvalcrois=moyvalcrois+((Y(k)-((Z(k,:))*w1))^2);
 end
        [s1,~]=size(D);
        moyvalcrois=moyvalcrois/(s1);
        moyvalcrois=sqrt(moyvalcrois);
end