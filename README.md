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
![image](https://github.com/user-attachments/assets/02ada1d1-20f3-4016-a97f-26b98b2041cf)

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
![image](https://github.com/user-attachments/assets/96457051-739a-4f23-a121-dd4422f9bbf4)
![image](https://github.com/user-attachments/assets/334987fa-9850-4b6e-a050-db4b7eb9584d)
![image](https://github.com/user-attachments/assets/d8953127-bfa4-491b-af28-8670477a6ddf)


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
![image](https://github.com/user-attachments/assets/801dcf89-3006-4f27-a283-e5a944bfdabd)
![image](https://github.com/user-attachments/assets/e688674f-f22d-4d5b-827c-ce0e6c5c61ad)
![image](https://github.com/user-attachments/assets/16b125e8-9807-49ca-96b6-014194d389ce)
![image](https://github.com/user-attachments/assets/0427ab94-b653-486b-872c-afeb2405caa4)
![image](https://github.com/user-attachments/assets/f4fc85a8-eb79-451f-9010-dccee64b0df5)
![image](https://github.com/user-attachments/assets/8061d3db-b1f3-4937-a307-b376f942aa43)


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
![image](https://github.com/user-attachments/assets/54fea08b-f61f-4d5f-a0b0-19438195d962)

How to Run the Code
Clone the repository using the following command:

bash
Copy code
git clone (https://github.com/RAHULPATEL2002/image-transformations-matlab)
Open the project in MATLAB.

Run the transformation.m script to apply the image processing transformations and view the results.

Conclusion : 
This lab demonstrated the importance of intensity transformation techniques in enhancing images. Logarithmic and power-law transformations provided control over how pixel values were mapped, which can be useful for specific image enhancement tasks, such as improving visibility in darker or brighter regions. Contrast stretching proved effective in improving image contrast, making it a powerful technique in image enhancement. These transformations are fundamental for many image processing applications, such as medical imaging, satellite image processing, and digital photography, where different lighting conditions need to be adjusted for better visual perception and analysis.
