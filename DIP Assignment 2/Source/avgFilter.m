function [filtImg] = avgFilter(img,maskSize)
% This function performs average filtering on input image 'img' with a filter of
% size 'maskSize'

mask=1/(maskSize^2)*ones(maskSize);
img=double(img);
filtImg=conv2(img,mask);
filtImg=uint8(filtImg);
filtImg=imresize(filtImg,size(img));

end

