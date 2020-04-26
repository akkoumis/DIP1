%% Load image , and convert it to gray -scale%%
x = imread('lena.bmp');
x = rgb2gray(x);
x = double(x) / 255;
figure(2)
imshow(x);
%% Show the histogram of intensity values%%
[hn , hx] = hist(x(:), 0:1/255:1);
figure(1)
bar(hx , hn)

%% Contrast Strech - Part A%%
y=pointtransform(x,0.1961, 0.0392, 0.8039, 0.9608);
figure(3)
imshow(y);
imwrite(y,'part1a.bmp');
%% Contrast Strech - Part B%%
y_floor=pointtransform(x,0.5, 0, 0.5, 0.5);
figure(4);
imshow(y_floor);
imwrite(y_floor,'part1b.bmp');
