function Reshaped= Reshape(pic, x,y)


x1=x(1);
x2=x(2);
x3=x(3);
x4=x(4);
y1=y(1);
y2=y(2);
y3=y(3);
y4=y(4);
m12=(y1-y2)/(x1-x2);
m23=(y2-y3)/(x2-x3);
m34=(y3-y4)/(x3-x4);
m41=(y4-y1)/(x4-x1);
d12=sqrt((x1-x2)^2+(y1-y2)^2);
d23=sqrt((x2-x3)^2+(y2-y3)^2);
d34=sqrt((x3-x4)^2+(y3-y4)^2);
d41=sqrt((x4-x1)^2+(y4-y1)^2);

m_incr_l=(m23-m41)/d12;
x_incr_h=(x2-x1)/(d12);
x_incr_l=(x4-x1)/(d41);
h_incr=0;
count_l=1;
count_h=1;
count=1;
array1 = zeros(1,5000);
array2 = zeros(1,5000);
array3 = zeros(1,5000);
image1=zeros(1,300);
image2=zeros(1,300);
image3=zeros(1,300);
reshaped=zeros(300,300,3);
Reshaped=zeros(300,300,3);
X=int64(x1);
Y=int64(y1);

X_=int64(x1);
Y_=int64(y1);

m_l=m41;


sign((Y-y2)-(y2-y3)*(X-x2)/(x2-x3));
(sign(((Y-y3)-(y3-y4)*(X-x3)/(x3-x4))*m34));
while((sign((Y_-y2)-(y2-y3)*(X_-x2)/(x2-x3)))<0)
    while(1)
       
        sn=(sign(((Y-y3)-(y3-y4)*(X-x3)/(x3-x4))*m34));
        (sign(((Y-y3-4)-(y3-y4)*(X-x3-4)/(x3-x4))*m34));
        if(sn==-1)
            break
        end
        X;
        Y;
        array1(count)=pic(int64(Y),int64(X),1);
        array2(count)=pic(int64(Y),int64(X),2);
        array3(count)=pic(int64(Y),int64(X),3);
        
       %pic(int64(Y),int64(X),1)=100;
      % pic(int64(Y),int64(X),2)=100;
      % pic(int64(Y),int64(X),3)=100;
        size(pic);
        count=count+1;
        x_incr_l;
        X=X+x_incr_l;
        Y=m_l*(X-X_)+Y_;
        X=int64(X);
        Y=int64(Y);
    end
    ab=12;
    cut1=imresize(array1(1:count),[1 300]);
    cut2=imresize(array2(1:count),[1 300]);
    cut3=imresize(array3(1:count),[1 300]);
    count=1;
    image1=[image1;cut1];
    image2=[image2;cut2];
    image3=[image3;cut3];
    m_l = m_l + m_incr_l;
    
    x_incr_h;
    X_=x1+h_incr;
    Y_=m12*(X_-x1)+y1;
     X=X_;
        Y=Y_;
    h_incr=h_incr+x_incr_h;
    sign((Y-y2)-(y2-y3)*(X-x2)/(x2-x3));
end
imshow(pic);
Reshaped1=imresize(image1,[300 300]);
Reshaped2=imresize(image2,[300 300]);
Reshaped3=imresize(image3,[300 300]);
K1 = filter2(fspecial('average',3),Reshaped1)/255;
K2 = filter2(fspecial('average',3),Reshaped2)/255;
K3 = filter2(fspecial('average',3),Reshaped3)/255;


reshaped(:,:,1)=Reshaped1;
reshaped(:,:,2)=Reshaped2;
reshaped(:,:,3)=Reshaped3;
Reshaped=cat(3,K1,K2,K3);