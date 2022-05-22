function [counts,binLocs] = myHistGS(img,nBins)

% This function computes the histogram of the input image 'img'
[x, y] = size(img);

binLocs = (0:nBins-1)';
counts = zeros(nBins,1);

for j = 1 : x
     for k = 1 : y
         m= img(j,k);
         counts(m+1)=counts(m+1)+1;
     end
end

end

  

  

