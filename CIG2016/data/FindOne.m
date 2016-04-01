function [ind]=FindOne(M)
[m,n]=size(M);
ind=-ones(1,m);
for i=1:m
    v=find(M(i,:)==1,1);
    if(!isnan(v))
        ind(i)=v-1;
    end
end
end
