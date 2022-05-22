% Digital Image Processing - Assignment #2 
% Question #5
% Author: Mohit Kumar
% Date: September 21,2021
% crime_original.png,crime_sample1.png,crime_sample2.png,crime_sample3.png,crime_sample4.png
% crime_car.png template

close all;
clear all;
clc;
image_path = '../Data/Images/crime_car.png';% read template image
imTemp = imread(image_path);

image_path = '../Data/Images/crime_original.png';% read target image
% replace the imagefile name above to search in different target images specified above
imTarget= imread(image_path);

[vanResult,histMatResult]=templateMatching(imTemp,imTarget);

figure;
imshow(imTemp);
title('Template Image');

figure;
imshow(imTarget);
title('Target Image');

figure;
imshow(vanResult);
title('Result of Vanilla Template Matching');

figure;
imshow(histMatResult);
title('Result of Histogram Matching followed by Template Matching');

output_dirpath = '../Data/Outputs/';
if ~exist(output_dirpath, 'dir')
    mkdir(output_dirpath)
end

h1=figure(1);
output_path = fullfile(output_dirpath, 'TemplateImage.png');
saveas(h1, output_path);

h2=figure(2);
output_path = fullfile(output_dirpath, 'TargetImage.png');
saveas(h2, output_path);

h3=figure(3);
output_path = fullfile(output_dirpath, 'VanillaTemplateMatchingImage.png');
saveas(h3, output_path);

h4=figure(4);
output_path = fullfile(output_dirpath, 'HistogramMatchingTemplateMatchingImage.png');
saveas(h4, output_path);