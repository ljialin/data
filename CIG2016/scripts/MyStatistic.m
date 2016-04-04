function [n,stdv,meanv]=MyStatistic(v)
    n=length(v);
    if(n==1)
        stdv=0;
        meanv=v(1);
    elseif(n==0)
        stdv=-1;
        meanv=-1;
    else
        stdv=std(v);
        meanv=mean(v)/sqrt(n);
    end
    %disp(sprintf('length=%d,mean=%f, std=%f',n,meanv,stdv));
end
