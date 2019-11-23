function [Winitial,w1]=descgradmat(Z,y)
    pas=0.1;
    it=0;
    m=3;%cette variable indique le modéle 1:cst;2:linéaire;3:quadratique
    w0=2*rand(m,1);
    Winitial=w0;
    d=(Z')*(y-(Z*w0));
    w1=w0+pas*d;
    while (it<=50)%(norm(w1-w0)>2)&&(abs(norm(d))>2)
         d=(Z')*(y-(Z*w1));
        w1=w1+pas*d;
        it=it+1;
    end
    end

    
    