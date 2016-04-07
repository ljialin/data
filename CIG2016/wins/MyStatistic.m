function [n,stdv,meanv]=MyStatistic(v)
    n=length(v);
    if(n==1)
        if(v(1)==0)
            n=0;
            stdv=-1;
            meanv=-1;
        else
            stdv=0;
            meanv=v(1);
        end
    elseif(n==0)
        stdv=-1;
        meanv=-1;
    else
        stdv=std(v)/sqrt(n);
        meanv=mean(v);
    end
    %disp(sprintf('length=%d,mean=%f, std=%f',n,meanv,stdv));
end
