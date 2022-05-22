% Digital Image Processing - Assignment #1  
% Question #3
% Author: Mohit Kumar
% Date: August 26,2021

clc;        
clearvars;  
close all;  

image_path = '../Data/Images/SingleColorText_Gray.png';
imgf = imread(image_path);

image_path = '../Data/Images/GrassBackground.png';
imgb = imread(image_path);

supImg=foregroundExtraction(imgf,imgb);

figure, imshow(supImg);
h1=figure(1);

output_dirpath = '../Data/Outputs/';
if ~exist(output_dirpath, 'dir')
    mkdir(output_dirpath)
end

output_path = fullfile(output_dirpath, 'SuperimposedImage.png');
saveas(h1, output_path);
