% Digital Image Processing - Assignment #2 
% Question #4
% Author: Mohit Kumar
% Date: September 21,2021

clc;        
clearvars;  
close all;  

image_path = '../Data/Images/noisy.tif';
noisyImg = imread(image_path);
image_path = '../Data/Images/characters.tif';
cleanImg = imread(image_path);
figure;
imshow(noisyImg);
title('Image before average filtering');

% call avgFilter for different maskSize values
maskSize=5;
blurImg = avgFilter(noisyImg,maskSize);

figure;
imshow(blurImg);
title('Image after average filtering');

figure;
imshow(cleanImg);
title('Clean image(characters.tif)');

highBoostImg = highBoostFilter(noisyImg,cleanImg,maskSize);
figure;
imshow(highBoostImg);
title('Image after high boost filtering without smoothing');

highBoostImg = highBoostFilter(blurImg,cleanImg,maskSize);
figure;
imshow(highBoostImg);
title('Image after high boost filtering after smoothing');


output_dirpath = '../Data/Outputs/';
if ~exist(output_dirpath, 'dir')
    mkdir(output_dirpath)
end

h1=figure(1);
output_path = fullfile(output_dirpath, 'NoisyImage.png');
saveas(h1, output_path);

h2=figure(2);
output_path = fullfile(output_dirpath, 'AverageFilterImage.png');
saveas(h2, output_path);

h3=figure(3);
output_path = fullfile(output_dirpath, 'CleanImage.png');
saveas(h3, output_path);

h4=figure(4);
output_path = fullfile(output_dirpath, 'HighBoostImagewithoutSmoothing.png');
saveas(h4, output_path);

h5=figure(5);
output_path = fullfile(output_dirpath, 'HighBoostImagewithSmoothing.png');
saveas(h5, output_path);

