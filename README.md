MATLAB Image Processing Lab - Transformations
Repository for Image Processing Operations in MATLAB
This repository contains MATLAB code for various image transformation operations applied to a grayscale image. These transformations include:

Log Transformation
Power Law Transformation
Contrast Stretching
Each transformation is applied to a color image that is first converted to grayscale.

Project Details
Author: Rahul Patel
Roll Number: UI22EC58
Lab Assignment: MATLAB Lab 03

Objectives:
Convert a given color image into a grayscale image.
Perform the following transformation operations:
Log Transformation (for c = 10, c = 30, c = 50)
Power Law Transformation:
For dark images (λ = 0.6, λ = 0.2)
For bright images (λ = 4, λ = 8)
Contrast Stretching
Code Overview
1. Log Transformation
The log transformation enhances the lower intensity values in the image and is defined as:

s=c⋅log(1+r)

Where:

s is the output pixel intensity,
r is the input pixel intensity,
c is a scaling constant.
Code Example for Log Transformation:

matlab
Copy code
c_values = [10, 30, 50];
for i = 1:length(c_values)
    c = c_values(i);
    log_transformed_image = c * log(1 + double(image_gray));
    log_transformed_image = uint8(255 * mat2gray(log_transformed_image)); % Normalize
    imshow(log_transformed_image);
    title(['Log Transform, c = ', num2str(c)]);
end
Output Images:
Original Grayscale	Log Transform (c=10)	Log Transform (c=30)	Log Transform (c=50)
2. Power Law (Gamma) Transformation
The power law transformation is used to correct the brightness of images and is defined as:
s=c⋅r λ
 
Where:

λ is the gamma value (controls brightness),
c is a scaling constant.
For dark images (λ < 1):
λ values: 0.6, 0.2
For bright images (λ > 1):
λ values: 4, 8
Code Example for Power Law Transformation:

matlab
Copy code
% For dark images (lambda < 1)
lambda_values_dark = [0.6, 0.2];
for i = 1:length(lambda_values_dark)
    lambda = lambda_values_dark(i);
    power_transformed_image = c * (double(image_gray) .^ lambda);
    power_transformed_image = uint8(255 * mat2gray(power_transformed_image)); % Normalize
    imshow(power_transformed_image);
    title(['Power Law, \lambda = ', num2str(lambda)]);
end

% For bright images (lambda > 1)
lambda_values_bright = [4, 8];
for i = 1:length(lambda_values_bright)
    lambda = lambda_values_bright(i);
    power_transformed_image = c * (double(image_gray) .^ lambda);
    power_transformed_image = uint8(255 * mat2gray(power_transformed_image)); % Normalize
    imshow(power_transformed_image);
    title(['Power Law, \lambda = ', num2str(lambda)]);
end
Output Images:
Power Law (λ = 0.6)	Power Law (λ = 0.2)	Power Law (λ = 4)	Power Law (λ = 8)
3. Contrast Stretching
Contrast stretching improves the image contrast by expanding the range of intensity levels. It is defined as:

𝑠=255⋅𝑟−𝑟min/𝑟max−𝑟min

Where:

r_min and r_max are the minimum and maximum intensity levels in the image,
s is the stretched intensity level.
Code Example for Contrast Stretching:

matlab
Copy code
min_val = double(min(image_gray(:)));
max_val = double(max(image_gray(:)));

contrast_stretched_image = 255 * (double(image_gray) - min_val) / (max_val - min_val);
contrast_stretched_image = uint8(contrast_stretched_image);
imshow(contrast_stretched_image);
title('Contrast Stretched Image');
Output Image:
Contrast Stretched Image
How to Run the Code
Clone the repository using the following command:

bash
Copy code
git clone https://github.com/yourusername/image-transformations-matlab.git
Open the project in MATLAB.

Run the transformation.m script to apply the image processing transformations and view the results.

