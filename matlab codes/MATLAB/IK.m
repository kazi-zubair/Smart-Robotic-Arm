function [anglep,anglen,flag] = IK(x,y,z)
a1=16.4;
a2=12.95;
a3=13.7;
anglep=[0 0 0];
anglen=[0 0 0];
theta1=atan2(y,x);
x2=sqrt(x^2+y^2);
y2=z-a1;
c2=(x2^2+y2^2-a2^2-a3^2)/(2*a2*a3);
if(c2<=1)
s2p=sqrt(1-c2^2);
s2n=-sqrt(1-c2^2);
k1=a2+a3*c2;
k2p=a3*s2p;
k2n=a3*s2n;
theta2p=atan2(y2,x2)-atan2(k2p,k1);
theta2n=atan2(y2,x2)-atan2(k2n,k1);
theta3p=atan2(s2p,c2);
theta3n=atan2(s2n,c2);

t1=(180/pi)*theta1;
t2p=(180/pi)*theta2p;
t2n=(180/pi)*theta2n;
t3p=(180/pi)*theta3p;
t3n=(180/pi)*theta3n;
anglep=[t1 t2p t3p];
anglen=[t1 t2n t3n];
flag=1;

else 
    flag=0;
end
end
