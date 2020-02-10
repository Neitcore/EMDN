%% 1.labaratorijas darbs
%% Mērījumu datu apstrāde
%% Mērķi:
% * Iemācīties apstrādāt mērījumu datus
% * Iemācīties lietot polyfit, polyval
% * Iemācīties veidot matlab atskaites izmantojot "publish"
%% Darba programma:
B = imread('grafiks2.png');
image([380 780],[1 0], B);
set(gca, 'YDir', 'normal')
[x,y] = ginput(60);
C = polyfit(x,y,14);
y2 = polyval(C,x);
plot(x,y,"o",x,y2)
figure(1),image(B)
xlabel('Wavelenght')
ylabel('Relative intensity')
title('Relative Intensity vs. Wavelength for Warm White and Cool White.')
legend('grafika dati','izrekinatais grafiks')
C
%% Secinājumi
% ir iemācijis apstrādāt merijumu datus
% ir iemacijis lietot polyfir, ployval
% ir iemacijis veidot matlab atskaites izmantojot "publish"
