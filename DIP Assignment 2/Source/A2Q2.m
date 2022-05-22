% Digital Image Processing - Assignment #2 
% Question #2
% Author: Mohit Kumar
% Date: September 15,2021
% StoneFace.png and Bee.jpg

clc;        
clearvars;  
close all;  

image_path = '../Data/Images/Bee.jpg';

img = imread(image_path);
if size(img,3)==3
    img=rgb2gray(img);
end

% Downsampling input image
k=3;
imgDown = img(1:k:end,1:k:end);

[nnImg] = upsampling(imgDown,k,'nearest');
mseNN=meanSquareError(nnImg,img);

[blImg] = upsampling(imgDown,k,'bilinear');
mseBL=meanSquareError(blImg,img);

figure;
imshow(img);
title('Original Image');
figure;
imshow(nnImg);
title('Image after nearest neighbor interpolation');
figure;
imshow(blImg);
title('Image after bilinear interpolation');

disp(['Bilinear interpolation MSE value: ',num2str(mseBL)]);
disp(['Nearest Neighbor interpolation MSE value: ',num2str(mseNN)]);

output_dirpath = '../Data/Outputs/';
if ~exist(output_dirpath, 'dir')
    mkdir(output_dirpath)
end

h1=figure(1);
output_path = fullfile(output_dirpath, 'OriginalImage.png');
saveas(h1, output_path);
h2=figure(2);
output_path = fullfile(output_dirpath, 'NearestNeighborInterpolationImage.png');
saveas(h2, output_path);
h3=figure(3);
output_path = fullfile(output_dirpath, 'BilinearInterpolationImage.png');
saveas(h3, output_path);