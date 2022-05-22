% Digital Image Processing - Assignment #2 
% Question #3
% Author: Mohit Kumar
% Date: September 16,2021

clc;        
clear all;  
close all;  

image_path = '../Data/Images/Bee.jpg';

img = imread(image_path);
if size(img,3)==3
    img=rgb2gray(img);
end

imshow(img);
title('Original Image');

%options for interpolation are 'nearest' and 'bilinear'
% call rotation with different degree and interpolation method values
% degree is positive clockwise
r=rotation( img,-45,'nearest' );
figure;
imshow(r);
title('Rotated Image')

output_dirpath = '../Data/Outputs/';
if ~exist(output_dirpath, 'dir')
    mkdir(output_dirpath)
end

h1=figure(1);
output_path = fullfile(output_dirpath, 'RotatedImage.png');
saveas(h1, output_path);

