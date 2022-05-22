%Note : The code for implementing CLAHE has been taken from 
%the internet. I have done debugging on the code and removed
%the errors. I have understood the overall algorithm and its
%operation.

function claheI = makeClaheImage(I, tileMappings, numTiles,dimTile)
% This function interpolates between neighboring tile mappings to produce a
% new mapping in order to remove artificially induced tile borders.
% Otherwise, these borders would become quite visible. The resulting
% mapping is applied to the input image thus producing a CLAHE processed
% image.
[ri,ci] = size(I);
claheI=zeros(ri,ci);
claheI=cast(claheI, class(I));

imgTileRow=1;
for k = 1: numTiles(1) + 1
    if k == 1 %special case: top row
        imgTileNumRows = dimTile(1) / 2;
        mapTileRows = [1 1];
    else
        if k == numTiles(1)+1 %special case: bottom row
            imgTileNumRows = dimTile(1)/2;
            mapTileRows = [numTiles(1) numTiles(1)];
        else %default values
            imgTileNumRows = dimTile(1);
            mapTileRows = [k-1, k]; %[upperRow lowerRow]
        end
    end
    
    % loop over columns of the tileMappings cell array
    imgTileCol=1;
    for l=1:numTiles(2)+1
        if l == 1 %special case: left column
            imgTileNumCols = dimTile(2)/2;
            mapTileCols = [1, 1];
        else
            if l == numTiles(2)+1 % special case: right column
                imgTileNumCols = dimTile(2)/2;
                mapTileCols = [numTiles(2), numTiles(2)];
            else %default values
                imgTileNumCols = dimTile(2);
                mapTileCols = [l-1, l]; % right left
            end
        end
        
        % Extract four tile mappings
        ulMapTile = tileMappings{mapTileRows(1), mapTileCols(1)};
        urMapTile = tileMappings{mapTileRows(1), mapTileCols(2)};
        blMapTile = tileMappings{mapTileRows(2), mapTileCols(1)};
        brMapTile = tileMappings{mapTileRows(2), mapTileCols(2)};
        
        % Calculate assignment of pixels within a submatrix of the image specified by imgTileIdx. This
        % is done by a bilinear interpolation between four different mappings
        % in order to eliminate boundary artifacts.
        imgTileNumRows=floor(imgTileNumRows);
        imgTileNumCols=floor(imgTileNumCols);
        normFactor = imgTileNumRows*imgTileNumCols;
        
        for i = 1:imgTileNumRows
            
            for j = 1: imgTileNumCols
                rowidx = imgTileRow+i-1;
                colidx  = imgTileCol+j-1;
                
                claheI(rowidx, colidx) = ...
                    ((imgTileNumRows-i)*((imgTileNumCols-j)*double(ulMapTile(I(rowidx,colidx)+1))+...
                    j*double(urMapTile(I(rowidx,colidx)+1)))+...
                    i*((imgTileNumCols-j)*double(blMapTile(I(rowidx,colidx)+1))+...
                    j*double(brMapTile(I(rowidx,colidx)+1))))...
                    /normFactor;
                
            end
        end
        imgTileCol = imgTileCol + imgTileNumCols;
        
    end
    imgTileRow = imgTileRow + imgTileNumRows;
end
end
