%Note : The code for implementing CLAHE has been taken from 
%the internet. I have done debugging on the code and removed
%the errors. I have understood the overall algorithm and its
%operation.

function [enhcImg,counts,binLocs] = myCLAHE(img,normClipLimit)
%This function performs Conntrast-limited Adaptive Histogram Equalization (CLAHE) 
% on the input image 'img' to produce an output image 'enhcImg' and its histogram

img=imresize(img,round((size(img)/8))*8);
dimI = size (img); 
numTiles = [8 8];% [8 8] image blocks
dimTile = dimI ./ numTiles;%size of the single tile
fullRange = [0 255];
numBins = 256;

numPixInTile = prod (dimTile);%the number of pixels included in each block
minClipLimit = ceil (numPixInTile / numBins);
clipLimit = minClipLimit + round(normClipLimit*(numPixInTile-minClipLimit));%actual clip limit
tileMappings = makeTileMappings(img, numTiles, dimTile, numBins, clipLimit, fullRange);

enhcImg = makeClaheImage(img, tileMappings, numTiles,dimTile);

% computing the histogram of enhcImg
[counts,binLocs]=myHistGS(enhcImg,256);
end
