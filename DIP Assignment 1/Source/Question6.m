% Digital Image Processing - Assignment #1  
% Question #6
% Author: Mohit Kumar
% Date: August 31,2021

clc;        
clearvars;  
close all;  

image_path = '../Data/Images/DoubleColorText_Gray.png';

img = imread(image_path);

output_dirpath = '../Data/Outputs/';
if ~exist(output_dirpath, 'dir')
    mkdir(output_dirpath)
end

threshMser = mserAlgorithm(img);
mserImg=img>threshMser;

figure;
imshow(mserImg);
title('MSER Binarised Image');
h1=figure(1);
output_path = fullfile(output_dirpath, 'MSERBinarizedImage.png');
saveas(h1, output_path);

threshOtsu=otsuBinarization(img);
otsuImg=img>threshOtsu;
figure;
imshow(otsuImg);

title('Otsu Binarised Image');
h2=figure(2);
output_path = fullfile(output_dirpath, 'OtsuBinarizedImage.png');
saveas(h2, output_path);
 
