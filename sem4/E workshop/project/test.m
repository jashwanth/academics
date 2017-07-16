clc;
clear all;
close all;
%reading image
    im = imread('Penguins.jpg');
    im_noisy = imnoise(im,'gaussian');
    figure(1);
    subplot(1,2,1),imshow(im);title('Image')
    subplot(1,2,2),imshow(im_noisy);title('Noisy Image')
    [N,L,S] = size(im_noisy);
% Row ordering
    x = im_noisy(1,:);
    for i = 2:N
        aox = horzcat(x,im_noisy(i,:));
        x = aox;
    end 
%Column ordering
    aoy = vertcat(im_noisy(:));
    figure(2);
    subplot(1,2,1),plot(aox);title('Row Ordering')
    subplot(1,2,2),plot(aoy);title('Column Ordering')
% designing high pass analysis filter
    Ry = autocorr(aoy(:,1),((N*L)/2)-1);
    Rx = autocorr(aox(1,:),((N*L)/2)-1);
    y = Ry - 0.01;
    x = Rx - 0.01;
    h1y = orth(y);
    h1x = orth(x')';
    figure(3);
    subplot(1,2,1),plot(h1y); title('1-D high pass filter(Csorted)')
    subplot(1,2,2), plot(h1x); title('1-D high pass filter(Rsorted)')
%designing other 3 filters
   % designig low pass PR filter
        M = 1;
        for n = 1:size(h1x,2)
           if (n - M) < 1
               f0x (1,n) = 0;
               f0y(n,1) = 0;
           else 
            f0x(1,n) = power(-1,n+1) * h1x(1,n - M);
            f0y(n,1) = power(-1,n+1) * h1y(n - M,1);
           end 
        end
    
    %designing low pass decomposition filter
        h0x = f0x';
        h0y = f0y';
    %designing high pass PR filter
        M = 1;
        for n = 1:size(h0x,1)
           if (n - M) < 1
               f1x (1,n) = 0;
               f1y(n,1) = 0;
           else 
            f1x(1,n) = power(-1,n) * h0x(n - M,1);
            f1y(n,1) = power(-1,n) * h0y(1,n - M);
           end 
        end
%decomposing 2-D image
    
%         CA = convn(im2double(im_noisy),h0x);
%         cA = downsample(CA,2);
%         CD = conv(im2double(im_noisy),h1x);
%         cD = downsample(CD,2);
% 
