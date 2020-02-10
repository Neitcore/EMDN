B = imread('grafiks2.png');
image([380 780],[1 0], B);
set(gca, 'YDir', 'normal')
[x,y] = ginput(60);
C = polyfit(x,y,14);
y2 = polyval(C,x);
plot(x,y,"o",x,y2)
xlabel('Wavelenght')
ylabel('Relative intensity')
title('Relative Intensity vs. Wavelength for Warm White and Cool White.')
legend('grafika dati')
C