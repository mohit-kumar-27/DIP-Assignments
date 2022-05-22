% Digital Image Processing - Assignment #02 
% Question #01
% Author: Mohit Kumar
% Date: September 13,2021

%Note : The code for implementing CLAHE has been taken from 
%the internet. I have done debugging on the code and removed
%the errors. I have understood the overall algorithm and its
%operation.

%images IIScMainBuilding_LowContrast.png, LowLight_2.png, 
% LowLight_3.png, Hazy.png, StoneFace.png

clc;        
clear all;  
close all;  

% Please run the the script for the different images (names given above) 
% by changing the file name in the image_path variable.

image_path = '../Data/Images/IIScMainBuilding_LowContrast.png';
img = imread(image_path);

[enhcImg,counts,binLocs] = fullScaleCE(img);

figure;
imshow(enhcImg);
title('Full Scale Contrast Enhanced Image');

figure;
stem(binLocs,counts);
grid on;
ylabel('Number of pixels  -->');
xlabel('Intensity Levels -->');
title('Histogram after full scale contrast enhancement');

[enhcImg,counts,binLocs] = imageExpOp(img);

figure;
imshow(enhcImg);
title('Non Linear Exponential Operation');

figure;
stem(binLocs,counts);
grid on;
ylabel('Number of pixels  -->');
xlabel('Intensity Levels -->');
title('Histogram after exponential operation');

[enhcImg,counts,binLocs] = imageLogOp(img);

figure;
imshow(enhcImg);
title('Non Linear Logarithm Operation');

figure;
stem(binLocs,counts);
grid on;
ylabel('Number of pixels  -->');
xlabel('Intensity Levels -->');
title('Histogram after logarithm operation');

[enhcImg,counts,binLocs] = histogramEqualisation(img);

figure;
imshow(enhcImg);
title('Image after histogram equalization');

figure;
stem(binLocs,counts);
grid on;
ylabel('Number of pixels  -->');
xlabel('Intensity Levels -->');
title('Histogram of histogram equalised image');

normClipLimit=0.01;
[enhcImg,counts,binLocs] = myCLAHE(img,normClipLimit);

figure;
imshow(enhcImg);
title('Image after CLAHE operation');

figure;
stem(binLocs,counts);
grid on;
ylabel('Number of pixels  -->');
xlabel('Intensity Levels -->');
title('Histogram of CLAHE image');

[counts,binLocs]=myHistGS(img,256);

figure;
imshow(img);
title('Original Image');

figure;
stem(binLocs,counts);
grid on;
ylabel('Number of pixels  -->');
xlabel('Intensity Levels -->');
title('Image Histogram');

output_dirpath = '../Data/Outputs/';
if ~exist(output_dirpath, 'dir')
    mkdir(output_dirpath)
end

h1=figure(1);
output_path = fullfile(output_dirpath, 'FullScaleContrastEnhancedImage.png');
saveas(h1, output_path);

h2=figure(2);
output_path = fullfile(output_dirpath, 'FullScaleContrastEnhancedImageHistogram.png');
saveas(h2, output_path);

h3=figure(3);
output_path = fullfile(output_dirpath, 'ExponentialOpImage.png');
saveas(h3, output_path);

h4=figure(4);
output_path = fullfile(output_dirpath, 'ExponentialOpImageHistogram.png');
saveas(h4, output_path);

h5=figure(5);
output_path = fullfile(output_dirpath, 'LogarithmOpImage.png');
saveas(h5, output_path);

h6=figure(6);
output_path = fullfile(output_dirpath, 'LogarithmOpImageHistogram.png');
saveas(h6, output_path);

h7=figure(7);
output_path = fullfile(output_dirpath, 'HistogramEqualisedImage.png');
saveas(h7, output_path);

h8=figure(8);
output_path = fullfile(output_dirpath, 'HistogramEqualizedImageHistogram.png');
saveas(h8, output_path);

h9=figure(9);
output_path = fullfile(output_dirpath, 'CLAHEImage.png');
saveas(h9, output_path);

h10=figure(10);
output_path = fullfile(output_dirpath, 'CLAHEImageHistogram.png');
saveas(h10, output_path);

h11=figure(11);
output_path = fullfile(output_dirpath, 'OriginalImage.png');
saveas(h11, output_path);

h12=figure(12);
output_path = fullfile(output_dirpath, 'OriginalImageHistogram.png');
saveas(h12, output_path);
