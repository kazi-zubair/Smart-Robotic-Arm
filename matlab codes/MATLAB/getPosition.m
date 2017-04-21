function position=getPosition(X);

x=25*(X(1)/300)
y=300-X(2);
y=25*(y/300);

position=[x y]
end
