catimage = imread('D:\OneDrive\Bilder\Unsorted\WP_20151212_19_32_16_Pro.jpg');

%figure('name', 'Cat Image')
%image(catimage)

catimageRed = catimage(:,:,1);
figure('name','Cat red');
imshow(mat2gray(catimageRed))

catfft = fft2(catimageRed);
catfftShifted = fftshift(catfft);

figure('name', 'power');
imshow( mat2gray(log10(abs(catfftShifted)).^2))

figure('name', 'phase');
imshow(mat2gray(angle(catfft)));

reconstruction = ifft2(ifftshift(catfftShifted));
figure('name', 'reconstruction');
imshow(mat2gray(reconstruction));

    
