% Load image , and convert it to gray -scale
x = imread('lena.bmp');
x = rgb2gray(x);
x = double(x) / 255;
% Show the histogram of intensity values
[hn , hx] = hist(x(:), 0:1/255:1);
figure
bar(hx , hn)