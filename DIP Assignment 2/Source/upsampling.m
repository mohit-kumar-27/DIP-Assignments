function [outImg] = upsampling(img,scale,method)

% This function upsamples the input image 'img' by a factor of 'scale' using 
% the interpolation method specified by 'method'

    in_rows = size(img,1);
    in_cols = size(img,2);
    out_rows = in_rows*scale;
    out_cols = in_cols*scale;
    outImg=double(zeros(out_rows,out_cols));
    
    for i=1:out_rows
        for j=1:out_cols
            x=i/scale;%computing the corresponding pixel location in the input image 
            y=j/scale;
            outImg(i,j)=pixelValue(img,x,y,method);%computing the pixel values for the output image
        end
    end
    outImg=cast(outImg, class(img)); 

    end