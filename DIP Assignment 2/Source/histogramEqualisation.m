function [enhcImg,counts,binLocs] = histogramEqualisation(img)
% This function performs histogram equalization on the input image 'img' to 
% produce an output image 'enhcImg' and its histogram

% performing histogram equalization on the input image
freq=myHistGS(img,256);
tot_pix=sum(freq);
pmf=freq/tot_pix;
pmf=pmf';
cdf=zeros(256,1);

cdf(1)=pmf(1);
for i = 1:255
    cdf(i+1)=cdf(i)+pmf(i+1);
end

[x, y] = size(img);
enhcImg=zeros(x,y);

for i = 1 : x
     for j = 1 : y
         enhcImg(i,j)=cdf(img(i,j)+1);
     end
end

enhcImg=im2uint8(enhcImg);

% computing the histogram of enhcImg
[counts,binLocs]=myHistGS(enhcImg,256);

end

  

  

