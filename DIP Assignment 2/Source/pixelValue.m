function r = pixelValue( im, x, y, method )
% This function returns pixel value corresponding to (x,y) location in the input image
% using the interpolation mehod specified by 'method'
% method can be 'nearest' or 'bilinear'
[M,N] = size(im);
if (x>=1) && (x<M) && (y>=1) && (y<N)
    % OK point (x,y) is within the image
    if strcmp(method,'bilinear')
        % bilinear interpolation
        x1=floor(x);y1=floor(y);
        delx=x-x1;dely=y-y1;
        a=im(x1,y1);b=im(x1,y1+1);
        c=im(x1+1,y1);d=im(x1+1,y1+1);
        r=(1-delx)*(1-dely)*a+(1-delx)*dely*b+delx*(1-dely)*c+delx*dely*d;
    elseif strcmp(method,'nearest')
        %nearest neighbor interpolation
        x1 = round(x);
        y1 = round(y);
        r = im(x1,y1);
    else
    end
else
    % outside the image
    r = 0;
end