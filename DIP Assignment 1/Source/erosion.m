function [eImg] = erosion(img,sE,loc)

r=loc(1);    c=loc(2);
s=size(sE); 
eImg=zeros(size(img));

rPad=s(1)-r;   cPad=s(2)-c;

imP=padarray(img,[rPad cPad],1);

for i=1:size(img,1)
    for j=1:size(img,2)
        W=imP(i:i+s(1)-1,j:j+s(2)-1);
        temp=W.*sE;
        if any(temp==0)
        else
            eImg(i,j)=1;
        end
    end
end
        
end

