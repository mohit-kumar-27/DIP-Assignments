function rOut = rotation( im, angle, method )
% This function rotates image 'im' by angle degrees clockwise and uses 'method' 
% for interpolation
% method can be 'nearest' or'bilinear'
sinangle = sind(-angle);
cosangle = cosd(-angle); 
[ri,ci] = size(im);
ro=ceil(ri*abs(cosangle)+ci*abs(sinangle));   %size of output image                   
co=ceil(ri*abs(sinangle)+ci*abs(cosangle));  
rOut=zeros(ro,co);
rOut=double(rOut);

cxi=ceil(ri/2); %centre of input image
cyi=ceil(ci/2);
cxo=ceil(ro/2); %centre of output image
cyo=ceil(co/2);

for i=1:ro
    for j=1:co
        x=(i-cxo)*cosangle+(j-cyo)*sinangle+cxi;%corresponding input image coordinates 
        y=-(i-cxo)*sinangle+(j-cyo)*cosangle+cyi;
        rOut(i,j)=pixelValue(im,x,y,method);%interpolation for pixel value calculation
    end
end
rOut=cast(rOut, class(im));
end
