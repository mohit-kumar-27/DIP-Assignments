% Digital Image Processing - Assignment #1  
% Question #2
% Author: Mohit Kumar
% Date: August 26,2021

clc;        
clearvars;  
close all;  

image_path = '../Data/Images/Coins.png';

img = imread(image_path);

output_dirpath = '../Data/Outputs/';
if ~exist(output_dirpath, 'dir')
    mkdir(output_dirpath)
end

[threshSigB,threshSigW,timeSigB,timeSigW,binImg,threshLib] = otsuBinarization(img);

disp('Results for maximizing inter class variance');
disp(['Threshold: ',num2str(threshSigB)]);
disp(['Computation Time: ',num2str(timeSigB)]);

disp('Results for minimizing intra class variance');
disp(['Threshold: ',num2str(threshSigW)]);
disp(['Computation Time: ',num2str(timeSigW)]);

disp(['Threshold from Library Func graythresh(): ',num2str(threshLib)]);

figure;
imshow(binImg);
title('Binarised Image');
h1=figure(1);
 
output_path = fullfile(output_dirpath, 'OtsuBinarizedImage.png');
saveas(h1, output_path);