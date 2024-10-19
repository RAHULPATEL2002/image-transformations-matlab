
%% lab :03
%% UI22EC58
% Aim: Take a perticular color image , convert it into grayscale image
% and perform the following transformation operation: 
% (a) log transformation(for c=10,c=50 and c=30) 
% (b) Power law transform (c=1)(For dark image, lembda=0.6,0.2)
% (for brighter image,lembda=4,8) 
% (c) Contrast streching
% RAHUL PATEL

%%
clc; 
close all; 
clear all; 
datetime;

% Read the input color image
image_color = imread('peppers.png');

% Convert the image to grayscale
image_gray = rgb2gray(image_color);

% Display the original grayscale image
figure(1);
imshow(image_gray);
title('Original Grayscale Image UI22EC58');

%% (a) Log Transformation
c_values = [10, 30, 50];

for i = 1:length(c_values)
    c = c_values(i);
    log_transformed_image = c * log(1 + double(image_gray));
    log_transformed_image = uint8(255 * mat2gray(log_transformed_image)); % Normalize
    figure(i+1);
    imshow(log_transformed_image);
    title(['UI22EC58 Log Transform, c = ', num2str(c)]);
end

%% (b) Power Law Transformation
% For dark image (lambda < 1)
lambda_values_dark = [0.6, 0.2];
c = 1;

for i = 1:length(lambda_values_dark)
    lambda = lambda_values_dark(i);
    power_transformed_image = c * (double(image_gray) .^ lambda);
    power_transformed_image = uint8(255 * mat2gray(power_transformed_image)); % Normalize
    figure(i+4);
    imshow(power_transformed_image);
    title(['UI22EC58 Power Law, \lambda = ', num2str(lambda)]);
end

% For brighter image (lambda > 1)
lambda_values_bright = [4, 8];

for i = 1:length(lambda_values_bright)
    lambda = lambda_values_bright(i);
    power_transformed_image = c * (double(image_gray) .^ lambda);
    power_transformed_image = uint8(255 * mat2gray(power_transformed_image)); % Normalize
    figure(i+6);
    imshow(power_transformed_image);
    title(['UI22EC58 Power Law, \lambda = ', num2str(lambda)]);
end

%% (c) Contrast Stretching
min_val = double(min(image_gray(:)));
max_val = double(max(image_gray(:)));

contrast_stretched_image = 255 * (double(image_gray) - min_val) / (max_val - min_val);
contrast_stretched_image = uint8(contrast_stretched_image);

figure(9);
imshow(contrast_stretched_image);
title('Contrast Stretched Image UI22EC58');

