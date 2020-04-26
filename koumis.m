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
%% Histogram Tranform %%
% Case 1
L = 10;
v = linspace (0, 1, L);
h = ones([1, L]) / L;
y_case1 = histtransform(x,h,v);
figure(5);
imshow(y_case1);
imwrite(y_case1,'part2_2_case1.bmp');
% Case 2
L = 20;
v = linspace (0, 1, L);
h = ones([1, L]) / L;
y_case2 = histtransform(x,h,v);
figure(6);
imshow(y_case2);
imwrite(y_case2,'part2_2_case2.bmp');
% Case 3
L = 10;
v = linspace (0, 1, L);
h = normpdf(v, 0.5) / sum(normpdf(v, 0.5));
y_case3 = histtransform(x,h,v);
figure(7);
imshow(y_case3);
imwrite(y_case3,'part2_2_case3.bmp');
