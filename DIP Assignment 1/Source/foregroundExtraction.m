function [supImg] = foregroundExtraction(imgf,imgb)
threshold=otsuBinarization(imgf);
fimg=imgf>threshold;
I1 = imgb(:, :, 1);              
I2 = imgb(:, :, 2);
I3 = imgb(:, :, 3);
I1(fimg) = 255;
I2(fimg) = 0;
I3(fimg) = 0; 

supImg=cat(3, I1, I2, I3);
end

