%% Load image , and convert it to gray -scale%%
x = imread('lena.bmp');
x = rgb2gray(x);
x = double(x) / 255;
figure('Name','Initial Lena Image - Grayscale');
imshow(x);
imwrite(x,'lena_grey.bmp');
%% Show the histogram of intensity values%%
[hn , hx] = hist(x(:), 0:1/255:1);
figure('Name','Histogram of Initial Lena Image - Grayscale');
bar(hx , hn)
xlabel('v') 
ylabel('h') 


%% Contrast Strech - Part A%%
y1a=pointtransform(x,0.1961, 0.0392, 0.8039, 0.9608);
figure('Name','Tranfer Function for Point Tranform - Part A');
tfx=[0,0.1961,0.8039,1];
tfy=[0,0.0392,0.9608,1];
plot(tfx,tfy,'-o');
xlabel('Input') ;
ylabel('Output'); 
figure('Name','Image after Point Tranform - Part A');
imshow(y1a);
imwrite(y1a,'part1a.bmp');
[h1an , h1ax] = hist(y1a(:), 0:1/255:1);
figure('Name','Histogram after Point Tranform - Part A');
bar(h1ax , h1an)
xlabel('v') 
ylabel('h') 

%% Contrast Strech - Part B%%
y1b=pointtransform(x,0.5, 0, 0.5, 1);
figure('Name','Tranfer Function for Point Tranform - Part B');
tfx=[0,0.5,0.5,1];
tfy=[0,0,1,1];
plot(tfx,tfy,'-o');
xlabel('Input') ;
ylabel('Output'); 
figure('Name','Image after Point Tranform - Part B');
imshow(y1b);
imwrite(y1b,'part1b.bmp');
[h1bn , h1bx] = hist(y1b(:), 0:1/20:1);
figure('Name','Histogram after Point Tranform - Part B');
bar(h1bx , h1bn)
xlabel('v') 
ylabel('h') 


%% Histogram Tranform %%

%% Case 1 %%
L = 10;
v = linspace (0, 1, L);
h = ones([1, L]) / L;
y_case1 = histtransform(x,h,v);

figure('Name','Image after 1st Histogram Tranform');
imshow(y_case1);
imwrite(y_case1,'part2_1_case1.bmp');

[hy_case1 , hx_case1] = hist(y_case1(:), linspace (0, 1, L));
hy_case1 = hy_case1/256/256; % Normalize frequencies of appereance
figure('Name','Histogram after 1st Histogram Tranform');
bar(hx_case1 , hy_case1)
xlabel('v') 
ylabel('h') 

figure('Name','Ideal Histogram for 1st Case');
bar(hx_case1 , h)
xlabel('v') 
ylabel('h') 

distance_chisq_case1 = trace(distChiSq(h',hy_case1'))/L;

%% Case 2 %%
L = 20;
v = linspace (0, 1, L);
h = ones([1, L]) / L;
y_case2 = histtransform(x,h,v);

figure('Name','Image after 2nd Histogram Tranform');
imshow(y_case2);
imwrite(y_case2,'part2_1_case2.bmp');

[hy_case2 , hx_case2] = hist(y_case2(:), linspace (0, 1, L));
hy_case2 = hy_case2/256/256; % Normalize frequencies of appereance
figure('Name','Histogram after 2nd Histogram Tranform');
bar(hx_case2 , hy_case2)
xlabel('v') 
ylabel('h') 

figure('Name','Ideal Histogram for 2nd Case');
bar(hx_case2 , h)
xlabel('v') 
ylabel('h') 

distance_chisq_case2 = trace(distChiSq(h',hy_case2'))/L;

%% Case 3 %%
L = 10;
v = linspace (0, 1, L);
h = normpdf(v, 0.5) / sum(normpdf(v, 0.5));
y_case3 = histtransform(x,h,v);

figure('Name','Image after 3rd Histogram Tranform');
imshow(y_case3);
imwrite(y_case3,'part2_1_case3.bmp');

[hy_case3 , hx_case3] = hist(y_case3(:), linspace (0, 1, L));
hy_case3 = hy_case3/256/256; % Normalize frequencies of appereance
figure('Name','Histogram after 3rd Histogram Tranform');
bar(hx_case3 , hy_case3)
xlabel('v') 
ylabel('h') 

figure('Name','Ideal Histogram for 3rd Case');
bar(hx_case3 , h)
xlabel('v') 
ylabel('h') 

distance_chisq_case3 = trace(distChiSq(h',hy_case3'))/L;

%% Histogram estimation from Probability Density Function %%
f1 = @(x)1;
h1 = pdf2hist(0:0.1:1, f1);