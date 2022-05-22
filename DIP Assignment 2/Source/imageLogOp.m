function [enhcImg,counts,binLocs] = imageLogOp(img)

% This function performs exp operation on each pixel value of input image 'img' to 
% produce an output image 'enhcImg' and its histogram

% performing log operation on the image
img=double(img);
img=img/255;
enhcImg=im2uint8(mat2gray(log(1+img)));

% computing the histogram of enhcImg
[counts,binLocs]=myHistGS(enhcImg,256);

end

  

  

