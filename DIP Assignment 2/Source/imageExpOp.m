function [enhcImg,counts,binLocs] = imageExpOp(img)

% This function performs exp operation on each pixel value of input image 'img' to 
% produce an output image 'enhcImg' and its histogram

% performing exp operation on the image
img=double(img);
img=img/255;
enhcImg=im2uint8(mat2gray(exp(img)));

% computing the histogram of enhcImg
[counts,binLocs]=myHistGS(enhcImg,256);

end

  

  

