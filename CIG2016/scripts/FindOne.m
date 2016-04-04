function [ind]=FindOne(M)
[m,n]=size(M);
ind=-ones(1,m);
for i=1:m
    [idx]=find(M(i,:)==1);
    if(!isnan(idx))
        v=idx(end);
        ind(i)=v-1;
    end
end
end
