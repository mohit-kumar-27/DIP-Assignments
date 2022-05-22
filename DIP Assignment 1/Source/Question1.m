% Digital Image Processing - Assignment #1  
% Question #1
% Author: Mohit Kumar
% Date: August 25,2021

clc;        
clearvars;  
close all;  

image_path = '../Data/Images/Coins.png';

img = imread(image_path);

[freq,binCen,counts,binLocs]=myHistGS(img,256);

% freq is the array containing frequency of pixels for each bin centre binCen 
% as computed by user defined function myHistGS

% counts is the array containing frequency of pixels for each bin centre binLocs 
% as computed by MATLAB in built imhist() function

output_dirpath = '../Data/Outputs/';
if ~exist(output_dirpath, 'dir')
    mkdir(output_dirpath)
end

stem(binLocs,counts);
grid on;
ylabel('Number of pixels  -->');
xlabel('Intensity Levels -->');
title('IMAGE HISTOGRAM(In Built imhist() func)');
h1=figure(1);

output_path = fullfile(output_dirpath, 'InBuiltFuncHist.png');
saveas(h1, output_path);

figure;

stem(binCen,freq);
grid on;
ylabel('Number of pixels  -->');
xlabel('Intensity Levels -->');
title('IMAGE HISTOGRAM(User Defined func)');
h2=figure(2);

output_path = fullfile(output_dirpath, 'UserDefinedFuncHist.png');
saveas(h2, output_path);
