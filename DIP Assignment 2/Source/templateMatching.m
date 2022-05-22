function [vanResult,histMatResult]=templateMatching(tempImg,tarImg)
% This function searches for the template 'tempImg' in target image 'tarImg' and
% returns results for vanilla template matching 'vanResult' and histogram matching followed by
% template matching 'histMatResult'

if size(tempImg,3)==3
    tempImg=rgb2gray(tempImg);
end
if size(tarImg,3)==3
    tarImg=rgb2gray(tarImg);
end

[r1,c1]=size(tarImg);
[r2,c2]=size(tempImg);
% vanilla template matching
mse=[];
for i=1:(r1-r2+1)
    for j=1:(c1-c2+1)
        imageWin=tarImg(i:i+r2-1,j:j+c2-1);
        mse(i,j)=meanSquareError(imageWin,tempImg);
    end 
end
minimum = min(min(mse));
[a,b]=find(mse==minimum);
vanResult=tarImg;

% drawing a box
vanResult(a:a+5,b:b+c2)=255;
vanResult(a:a+r2,b:b+5)=255;
vanResult(a:a+r2,b+c2:b+c2+5)=255;
vanResult(a+r2:a+r2+5,b:b+c2)=255;

tarImg = histogramMatching(tarImg,tempImg);% histogram matching

% template matching
mse=[];
for i=1:(r1-r2+1)
    for j=1:(c1-c2+1)
        imageWin=tarImg(i:i+r2-1,j:j+c2-1);
        mse(i,j)=meanSquareError(imageWin,tempImg);
    end 
end
minimum = min(min(mse));
[a,b]=find(mse==minimum);
histMatResult=tarImg;

% drawing a box
histMatResult(a:a+5,b:b+c2)=255;
histMatResult(a:a+r2,b:b+5)=255;
histMatResult(a:a+r2,b+c2:b+c2+5)=255;
histMatResult(a+r2:a+r2+5,b:b+c2)=255;
end