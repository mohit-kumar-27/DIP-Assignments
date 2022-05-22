%Note : The code for implementing CLAHE has been taken from 
%the internet. I have done debugging on the code and removed
%the errors. I have understood the overall algorithm and its
%operation.

function mapping = makeMapping(imgHist, fullRange,numPixInTile)

% Histogram balance function,Get the gradation value corresponding to each grayscale value
% of the PATCH,that is, it is mapping

histSum = cumsum (imgHist);
valSpread = fullRange(2) - fullRange(1);
scale = valSpread/numPixInTile;
mapping = min(fullRange(1) + histSum*scale,fullRange(2));% limit to max (column vector)
end
