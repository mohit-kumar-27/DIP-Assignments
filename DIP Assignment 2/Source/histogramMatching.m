function [out] = histogramMatching(tarImg,sourceImg)
% This function maps the histogram of target image 'tarImg' to the histogram of
% source image 'sourceImg' and produces an output image 'out'
M = zeros(256,1,'uint8');  
hist1 = myHistGS(tarImg,256); %compute histograms
hist2 = myHistGS(sourceImg,256);
cdf1 = cumsum(hist1) / numel(tarImg); %compute cdfs
cdf2 = cumsum(hist2) / numel(sourceImg);

%compute the mapping
for idx = 1 : 256
    [~,ind] = min(abs(cdf1(idx) - cdf2));
    M(idx) = ind-1;
end

out = M(double(tarImg)+1);%apply the mapping to target image