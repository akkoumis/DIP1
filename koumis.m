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

[hy_case1 , hx_case1] = hist(y_case1(:), linspace (0, 1, L));
hy_case1 = hy_case1/256/256; % Normalize frequencies of appereance
figure(8);
bar(hx_case1 , hy_case1)
%distance_case1 = pdist2(h', hy_case1');
distance_chisq_case1 = trace(distChiSq(h',hy_case1'))/L;

% Case 2
L = 20;
v = linspace (0, 1, L);
h = ones([1, L]) / L;
y_case2 = histtransform(x,h,v);

figure(6);
imshow(y_case2);
imwrite(y_case2,'part2_2_case2.bmp');

[hy_case2 , hx_case2] = hist(y_case2(:), linspace (0, 1, L));3
hy_case2 = hy_case2/256/256; % Normalize frequencies of appereance
figure(9);
bar(hx_case2 , hy_case2)
distance_chisq_case2 = trace(distChiSq(h',hy_case2'))/L;

% Case 3
L = 10;
v = linspace (0, 1, L);
h = normpdf(v, 0.5) / sum(normpdf(v, 0.5));
y_case3 = histtransform(x,h,v);

figure(7);
imshow(y_case3);
imwrite(y_case3,'part2_2_case3.bmp');

[hy_case3 , hx_case3] = hist(y_case3(:), linspace (0, 1, L));
hy_case3 = hy_case3/256/256; % Normalize frequencies of appereance
figure(10);
bar(hx_case3 , hy_case3)
distance_chisq_case3 = trace(distChiSq(h',hy_case3'))/L;
