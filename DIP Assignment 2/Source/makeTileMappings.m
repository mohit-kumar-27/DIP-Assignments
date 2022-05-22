%Note : The code for implementing CLAHE has been taken from 
%the internet. I have done debugging on the code and removed
%the errors. I have understood the overall algorithm and its
%operation.

function tileMappings = makeTileMappings(I, numTiles, dimTile, numBins, clipLimit,fullRange)

% Calculate the equalized lookup table (mapping) based on cumulating the input
% histogram.
% Calculates the Clahe histogram of each Patch,
% arrangement to the corresponding position in the corresponding order.

numPixInTile = prod (dimTile);

tileMappings = cell (numTiles);% creates an empty matrix of 8 * 8 dimensions

% extract and process each tile
imgCol = 1;
for col=1:numTiles(2)
    imgRow = 1;
    for row=1:numTiles(1)
        
        tile = I(imgRow:imgRow+dimTile(1)-1,imgCol:imgCol+dimTile(2)-1);
        % input parsing of imhist
        tileHist = imhist (tile, numBins);% column vector, histogram on this area
        tileHist = clipHistogram(tileHist, clipLimit, numBins);
        tileMapping = makeMapping(tileHist,fullRange,numPixInTile);% histogram equalization mapping
        % assemble individual tile mappings by storing them in a cell array;
        tileMappings {row, col} = tileMapping;%the result is deposited in the final histogram matrix
        imgRow = imgRow + dimTile(1);% transform to the next block
        
    end
    imgCol = imgCol + dimTile(2); % move to the next column of tiles
end

end
