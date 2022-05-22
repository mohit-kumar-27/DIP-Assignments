function [freq,binCen,counts,binLocs] = myHistGS(img,nBins)

[x, y] = size(img);

binCen = (0:nBins-1)';
freq = zeros(nBins,1);

for j = 1 : x
     for k = 1 : y
         m= img(j,k);
         freq(m+1)=freq(m+1)+1;
     end
end

[counts,binLocs]=imhist(img);

end

  

  

