function angle = getAngles(x,y)

l1=13;
l2=13.5;
c2=(x^2+y^2-l1^2-l2^2)/(2*l1*l2);
s2p=sqrt(1-c2^2);
s2n=-sqrt(1-c2^2);

k1=l1+l2*c2;
k2p=l2*s2p;
k2n=l2*s2n;

 theta2p=atan2(s2p,c2);
     theta2n=atan2(s2n,c2);

     theta1p=atan2(y,x)-atan2(k2p,k1);
    theta1n=atan2(y,x)-atan2(k2n,k1);
    angle=[theta1p,theta2p;theta1n,theta2n];

