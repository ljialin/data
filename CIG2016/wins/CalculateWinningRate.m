function [n1,stdv1,meanv1,n2,stdv2,meanv2]=CalculateWinningRate(fname)
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
            %disp(sprintf('p1 wins at time %d during run %d ',ind1(i),i));
        elseif(ind1(i)>ind2(i))
            w2=[w2 ind2(i)];
            %disp(sprintf('p2 wins at time %d during run %d',ind2(i),i));
        else
            %disp(sprintf('Draw at %d',i));
        end
    elseif(ind1(i)>=0)
        w1=[w1 ind1(i)];
        %disp(sprintf('p1 wins at time %d during run %d ',ind1(i),i));
    elseif(ind2(i)>=0)
        w2=[w2 ind2(i)];
        %disp(sprintf('p2 wins at time %d during run %d',ind2(i),i));
    else
        %disp(sprintf('NoWinner at %d',i));
    end
end
[n1,stdv1,meanv1]=MyStatistic(w1);
[n2,stdv2,meanv2]=MyStatistic(w2);
end
