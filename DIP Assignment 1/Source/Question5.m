% Digital Image Processing - Assignment #1  
% Question #5
% Author: Mohit Kumar
% Date: August 27,2021

clc;        
clearvars;  
close all;  

image_path = '../Data/Images/NoisyImage.png';

img = imread(image_path);

cleanImg = binaryMorphology(img);

output_dirpath = '../Data/Outputs/';
if ~exist(output_dirpath, 'dir')
    mkdir(output_dirpath)
end

figure;
imshow(cleanImg);
h1=figure(1);

output_path = fullfile(output_dirpath, 'CleanedImage.png');
saveas(h1, output_path);