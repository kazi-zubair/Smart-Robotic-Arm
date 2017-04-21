function  [obj_list,pos_2,pos_3,pos_4,pos_5,pos_6] = Untitled( pic,net )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
negetive=1;
blue_I=2;
blue_O=3;
orange=4;
green=5;
indigo=6;

object_list=[0;0;0;0;0;0];
pos=zeros(1500,2,5);


s=size(pic);
RGB=zeros(20,20,3);
picB=pic;
count=[0 0 0 0 0];
length=65;
for x=1:10:s(2)-length
        for y=1:10:s(1)-length
            croped=imcrop(pic,[x,y,length,length]);
            RGB(:,:,1)=imresize(croped(:,:,1),[20 20]);
            RGB(:,:,2)=imresize(croped(:,:,2),[20 20]);
            RGB(:,:,3)=imresize(croped(:,:,3),[20 20]);
            n=net(RGB(:));
            maxm=max(n);
            n=(n>=0.8);
            object_list=object_list+n;
            object_list=object_list>=1;
            if (n(2)>=1)
                count(1)=count(1)+1;
                pos_x=x+(length/2);
                pos_y=y+(length/2);
                pos(count(1),:,1)=[pos_x pos_y];
            end
            if (n(3)>=1)
                count(2)=count(2)+1;
                pos_x=x+(length/2);
                pos_y=y+(length/2);
                pos(count(2),:,2)=[pos_x pos_y];
            end
            if (n(4)>=1)
                count(3)=count(3)+1;
                pos_x=x+(length/2);
                pos_y=y+(length/2);
                pos(count(3),:,3)=[pos_x pos_y];
            end
            if (n(5)>=1)
                count(4)=count(4)+1;
                pos_x=x+(length/2);
                pos_y=y+(length/2);
                pos(count(4),:,4)=[pos_x pos_y];
            end
            if (n(6)>=1)
                count(5)=count(5)+1;
                pos_x=x+(length/2);
                pos_y=y+(length/2);
                pos(count(5),:,5)=[pos_x pos_y];
            end
            
           % picB(y:(y+length),x:(x+length),:)=picB(y:(y+length),x:(x+length),:)-150;
           % no_of_ocr=no_of_ocr+1;
           % set(handles.text3,'String',num2str(no_of_ocr));
            
        end
end
for o=1:5
for i=1:size(pos,1)
    for j=i+1:size(pos,1)
        abs(pos(i,2,o)-pos(j,2,o))<(length*.3)&&abs(pos(i,1,o)-pos(j,1,o))<(length*.3);
        if (abs(pos(i,2,o)-pos(j,2,o))<(length*.5)&&abs(pos(i,1,o)-pos(j,1,o))<(length*.5))
            pos(i,:,o)=[(pos(i,1,o)+pos(j,1,o))/2 (pos(i,2,o)+pos(j,2,o))/2];
            pos(j,:,o)=[0 0];
        end
    end
end
end
pos_2=pos(:,:,1);
pos_3=pos(:,:,2);
pos_4=pos(:,:,3);
pos_5=pos(:,:,4);
pos_6=pos(:,:,5);

pos_2=remove_zero(pos_2);
pos_3=remove_zero(pos_3);
pos_4=remove_zero(pos_4);
pos_5=remove_zero(pos_5);
pos_6=remove_zero(pos_6);


obj_list=object_list;

end

