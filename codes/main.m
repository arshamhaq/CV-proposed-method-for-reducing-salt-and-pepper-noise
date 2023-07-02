clc;clear;close all

I = im2double(imread("Street.bmp"));
J = imnoise(I,"salt & pepper",0.5);
F = new_method(J,7);
K = medfilt2(J,[7 7]);
subplot(1,2,2)
imshow(K, [])
title(["median method psnr: " num2str(psnr(K,I))])
subplot(1,2,1)
imshow(F, [])
title(["my method psnr: " num2str(psnr(F,I))])
