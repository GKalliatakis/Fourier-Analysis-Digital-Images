clear all;
close all;
clc;


Iref = imread('cameraman.tif'); 
distorted_ver=imresize(imrotate(Iref,30),0.7); 

%rmin and rmax are the radii of the innermost and outermost rings of the log-polar sampling pattern, 
%in terms of pixels in the original image. 
rmin = 25; 
rmax = 120; 

%nr(in this example empty) and nw specify the number of rings and the number of wedges in the log-sampling pattern.
nw = 500; 

%xc and yc are the position of the centre of the pattern in
%the original image, in terms of the array indices of ARRAY.
xc = size(Iref, 2)/2; 
yc = size(Iref, 1)/2;

lp_Iref = logsample(Iref, rmin, rmax, xc, yc, [], nw); 
lp_distorted_ver = logsample(distorted_ver, rmin, rmax, xc, yc, [], nw);

cc = normxcorr2(lp_distorted_ver, lp_Iref); 
[max_cc, imax] = max(cc(:)); 
[ypeak, xpeak] = ind2sub(size(cc), imax);

fprintf('ypeak is %d & xpeak is %d \n', ypeak,xpeak); 

drot = 360 * (ypeak - nw) / nw ;

fprintf('The rotation on the original image is  %f \n', drot); 

distorted_ver2=imrotate(Iref,drot); 

subplot(1,3,1);imshow(Iref),title('Original Image');
subplot(1,3,2);imshow(distorted_ver),title('Distorted Version');
subplot(1,3,3);imshow(distorted_ver2),title('Distorted Version Reconstructed');
