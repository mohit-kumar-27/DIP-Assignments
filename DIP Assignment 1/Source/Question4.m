% Digital Image Processing - Assignment #1  
% Question #4
% Author: Mohit Kumar
% Date: August 27,2021

clc;        
clearvars;  
close all;  

image_path = '../Data/Images/PiNumbers.png';

img = imread(image_path);

nDigits=connectedComponents(img);

disp(['Total no of digits in the image = ',num2str(nDigits)]);