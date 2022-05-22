function [filtImg] = highBoostFilter(noisyImg,cleanImg,maskSize)
% This function does high boost filtering on 'noisyImg' by choosing an average filter of 
% size 'maskSize' and choosing scaling constant that minimises mse between filtered image 
% and 'cleanImg'

blurImg = avgFilter(noisyImg,maskSize);
diffImg = noisyImg - blurImg;
minMSE=1e5;
for k=1:10
    highBoostImg = noisyImg + k*diffImg;
    mse=meanSquareError(highBoostImg,cleanImg);
    if mse<minMSE
        minMSE=mse;
        filtImg=highBoostImg;
    end
end