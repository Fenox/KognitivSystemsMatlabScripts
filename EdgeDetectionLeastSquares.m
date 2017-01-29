image = imread('Images/Points.png');
imgBW = imcomplement(imbinarize(image));

figure
subplot(2,1,1)
imshow(imgBW)
title('Original BW')

%Precondition: given points indicate one line
%Find maxima in Matrix (Maxima in every column) 
[row, col] = find(fliplr(imgBW));

%solve overdeterminde Linear System Ax=b where x = (m,c) and m,c and y = m*x + c
A = [ones(size(col)) col];
b = row;
myx = A \ b;

%plot the detected points and the line 
f = @(x) x * myx(2) + myx(1);
subplot(2,1,2)
scatter(col, row); hold on;
fplot(f, [0 800])
title('detected Points and line')
