catimage = imread('Images\Lines1.png');
catimageRed = catimage(:,:,1);

%Kantendetektion mit Sobel und Schwelle 0.03
%edgeBW = edge(catimageRed, 'Canny', 0.03);
edgeBW = imcomplement(imbinarize(catimageRed));

figure
imshow(edgeBW);
title('Kanten');

%Hough-Transformation
[H, T, R] = hough(edgeBW);
figure
imshow(imadjust(mat2gray(H)),'XData',T,'YData',R,...
      'InitialMagnification','fit');
  xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
title('hough transform')

%Extrahiere Winkel und Abstand des max. der Hough-Transformation
[MM,IM] = max(H);
[M, ColumnOfMax] = max(MM);
RowOfMax = IM(ColumnOfMax);
maxAbstand = R(RowOfMax);
maxWinkel = T(ColumnOfMax);

%Berechnen des Normalenvektors der Hessenormalform aus dem Winkel
mynormal = [cos(maxWinkel), sin(maxWinkel)];

%Lösen des Lgs der Geraden Gleichung der Hessenormalform
%part1 = mynormal(0);
%part2 = mynormal(1);
syms x y
[s1, s2] = vpasolve(1 * x + 0 * y == maxAbstand, [x, y]);

s1
s2

%In this case a second point could be [170, X] => choose point2 to [170,
%100]
[x,y,c] = size(edgeBW);
figure
imshow(edgeBW);
line([s1,170], [s2, 1000], 'LineWidth', 5);
title('Kanten');





