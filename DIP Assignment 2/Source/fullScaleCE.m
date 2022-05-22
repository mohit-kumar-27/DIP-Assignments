function [enhcImg,counts,binLocs] = fullScaleCE(img)

% This function performs full scale contrast enhancement of input image 'img' to 
% produce an output image 'enhcImg' and its histogram

% performing full scale contrast enhancement
img=double(img);
H=max(img(:));
L=min(img(:));
enhcImg=255/(H-L)*(img-L);
enhcImg(enhcImg>255)=255;
enhcImg(enhcImg<0)=0;
enhcImg=uint8(enhcImg);

% computing the histogram of enhcImg
[counts,binLocs]=myHistGS(enhcImg,256);

end

  

  

