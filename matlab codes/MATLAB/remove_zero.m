function pos=remove_zero(x)
i=1;
while(i<=size(x,1))
if(~x(i)&&~x(i+size(x,1)))
x(i,:)=[];
i=i-1;
end
i=i+1;
end
pos=x;