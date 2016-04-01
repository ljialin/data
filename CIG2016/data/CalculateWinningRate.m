function CalculateWinningRate(fname)
M1=load(sprintf('%s.p1',fname));
M2=load(sprintf('%s.p2',fname));
ind1=FindOne(M1);
ind2=FindOne(M2);
[m,n]=size(M1);
w1=[];
w2=[];
for i=1:m
    if(ind1(i)>=0 && ind2(i)>=0)
        if(ind1(i)<ind2(i))
            w1=[w1 ind1(i)];
            disp(sprintf('p1 wins %d',i));
        elseif(ind1(i)>ind2(i))
            w2=[w2 ind2(i)];
            disp(sprintf('p2 wins %d',i));
        else
            %disp(sprintf('Draw at %d',i));
        end
    elseif(ind1(i)>=0)
        w1=[w1 ind1(i)];
    elseif(ind2(i)>=0)
        w2=[w2 ind2(i)];
    else
        %disp(sprintf('NoWinner at %d',i));
    end
end
mean(w1)
mean(w2)
length(w1)
length(w2)
end
