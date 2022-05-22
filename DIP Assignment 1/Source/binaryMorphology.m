function [cleanImg] = binaryMorphology(img)

[~,~,~,~,img,~]=otsuBinarization(img);

sE=ones(3); loc=[2 2];
tempImg=erosion(img,sE,loc);
img=dilation(tempImg,sE,loc);
tempImg=dilation(img,sE,loc);
cleanImg=erosion(tempImg,sE,loc);

end

