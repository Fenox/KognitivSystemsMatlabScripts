catimage = imread('D:\OneDrive\Bilder\Unsorted\WP_20151212_19_32_16_Pro.jpg');
catimageRed = catimage(:,:,3);

figure;
imshow(catimageRed)
axis off
title('original red cannel')

n = 1;
%Use multileve Otsu to generate n threshold values for the image
otsu = multithresh(catimageRed, n);

%Segments the image with the generated threshholds
seg_img = imquantize(catimageRed, otsu);

%Show the segmented image
RGB = label2rgb(seg_img);
figure;
imshow(RGB)
axis off
title('Segmented Image')