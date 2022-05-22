 function [mse] = meanSquareError(img1,img2)
 
%  This function computes the mean square error between the images 'img1' and 'img2'

[r,c]=size(img1);
img2=imresize(img2,size(img1));
squaredErrorImage = (double(img1) - double(img2)) .^ 2;
mse = sum(squaredErrorImage(:)) / (r * c);

 end
