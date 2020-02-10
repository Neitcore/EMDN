
	Classroom License -- for classroom instructional use only.

mkdir lab1
cd lab1
diary lab1_diary.m
%merinajumu datu apstrade

%pieņemsim kā mums ir mērinajumu dati
% mainam spriegumu un mēram strāvu
Vm = [-1 0.3 1.5 2.5 3.2];
Im = [1.1 2.2 2.1 3.2 4.7]*1e-3;
plot(Vm,Im)
plot(Vm,Im,'-o')
%pielakosim 2.kartas polinomu\
% y = a*x^2 + b*x + c
%polyfit - mekle polinoma koeficientus
% C = polyfit(x,y,N)
% N - polinoma karta
C = polyfit(Vm,Im,2)

C =

    0.0002    0.0004    0.0015

% sie nozime
%y = C(1)*x^2+C(2)*x+C(3)
%definesim x ar sikaku soli
V = -1:0.01:3.2;
V = min(Vm):0.01:max(Vm);
V = linspace(min(Vm),max(Vm))

V =

  Columns 1 through 11

   -1.0000   -0.9576   -0.9152   -0.8727   -0.8303   -0.7879   -0.7455   -0.7030   -0.6606   -0.6182   -0.5758

  Columns 12 through 22

   -0.5333   -0.4909   -0.4485   -0.4061   -0.3636   -0.3212   -0.2788   -0.2364   -0.1939   -0.1515   -0.1091

  Columns 23 through 33

   -0.0667   -0.0242    0.0182    0.0606    0.1030    0.1455    0.1879    0.2303    0.2727    0.3152    0.3576

  Columns 34 through 44

    0.4000    0.4424    0.4848    0.5273    0.5697    0.6121    0.6545    0.6970    0.7394    0.7818    0.8242

  Columns 45 through 55

    0.8667    0.9091    0.9515    0.9939    1.0364    1.0788    1.1212    1.1636    1.2061    1.2485    1.2909

  Columns 56 through 66

    1.3333    1.3758    1.4182    1.4606    1.5030    1.5455    1.5879    1.6303    1.6727    1.7152    1.7576

  Columns 67 through 77

    1.8000    1.8424    1.8848    1.9273    1.9697    2.0121    2.0545    2.0970    2.1394    2.1818    2.2242

  Columns 78 through 88

    2.2667    2.3091    2.3515    2.3939    2.4364    2.4788    2.5212    2.5636    2.6061    2.6485    2.6909

  Columns 89 through 99

    2.7333    2.7758    2.8182    2.8606    2.9030    2.9455    2.9879    3.0303    3.0727    3.1152    3.1576

  Column 100

    3.2000

V = linspace(min(Vm),max(Vm));
% liekam x musu izteiksme
I = C(1) * V.^2 + C(2) * V + C(3);
plot(Vm,Im','o',V,I);
C = polyfit(Vm,Im,3)

C =

    0.0002   -0.0004    0.0003    0.0021

I = C(1) * V.^3 + C(2) * V.^2 + C(3) * V + C(4);

plot(Vm,Im','o',V,I);
C = polyfit(Vm,Im,4);
I = C(1) * V.^4 + C(2) * V.^3 + C(3) * V.^2 + C(4)*V + C(5);
plot(Vm,Im','o',V,I);
% to pašu var izdarit šādi
C = polyfit(Vm,Im,3);
% izmantosim polyval funkciju kas aprekinas
% polinoma vertibas
%I = C(1) * V.^3 + C(2) * V.^2 + C(3) * V + C(4);
I = polyval(C,V)

I =

  Columns 1 through 9

    0.0011    0.0012    0.0013    0.0013    0.0014    0.0014    0.0015    0.0016    0.0016

  Columns 10 through 18

    0.0017    0.0017    0.0017    0.0018    0.0018    0.0018    0.0019    0.0019    0.0019

  Columns 19 through 27

    0.0020    0.0020    0.0020    0.0020    0.0020    0.0021    0.0021    0.0021    0.0021

  Columns 28 through 36

    0.0021    0.0021    0.0021    0.0021    0.0021    0.0021    0.0021    0.0022    0.0022

  Columns 37 through 45

    0.0022    0.0022    0.0022    0.0022    0.0022    0.0022    0.0022    0.0022    0.0022

  Columns 46 through 54

    0.0022    0.0022    0.0022    0.0022    0.0022    0.0022    0.0022    0.0022    0.0022

  Columns 55 through 63

    0.0022    0.0022    0.0022    0.0022    0.0022    0.0022    0.0022    0.0023    0.0023

  Columns 64 through 72

    0.0023    0.0023    0.0023    0.0023    0.0024    0.0024    0.0024    0.0025    0.0025

  Columns 73 through 81

    0.0025    0.0026    0.0026    0.0027    0.0027    0.0028    0.0028    0.0029    0.0029

  Columns 82 through 90

    0.0030    0.0030    0.0031    0.0032    0.0033    0.0033    0.0034    0.0035    0.0036

  Columns 91 through 99

    0.0037    0.0038    0.0039    0.0040    0.0041    0.0042    0.0044    0.0045    0.0046

  Column 100

    0.0047

%sintakse ir y = polyval (C,x)
I = polyval(C,V);
plot(Vm,Im','o',V,I);
C = polyfit(Vm,Im,4);
I = polyval(C,V);
plot(Vm,Im','o',V,I);
% Tas ir 4.kartai
% gadijuma kad pielakota polinoma karta
% ir vienada ar (N - 1), kur N - punktu skaits
% Šito sauc par
% polinomiālo interpolaciju
% (polinoms iet tieši caur mērīnajumu punktiem)
% bet citus gadijumus sauc par polinomialo aproksimāciju
% tad polinoms un merinajumu punkti var nesakrist

C = polyfit(Vm,Im,20);
Warning: Polynomial is not unique; degree >= number of data points. 
> In polyfit (line 74) 
I = polyval(C,V);
plot(Vm,Im','o',V,I);
C = polyfit(Vm,Im,4);
I = polyval(C,V);
C = polyfit(Vm,Im,4);
plot(Vm,Im','o',V,I);
% Uzdevums atkārtot 1.kartai
C = polyfit(Vm,Im,1);
I = polyval(C,V);
plot(Vm,Im','o',V,I);
% Merinajumu datu serijas
% pieņēmsim kā mēs katrai sprieguma vertibai stravu nomerisim 5 reizes 
Vm = [-1 0.3 1.5 2.5 3.2];
Im = [1.1 2.2 2.1 3.2 4.7;
         0.9 1.8 2.6 3.3 4.5;
         1.0 2.0 2.4 3.4 4.3;
         0.8 2.1 2.5 3.2 4.6;
         0.9 1.9 2.3 3.2 4.4];
% pameginasim uzzimet ar plot
figure
plot(Vm,Im,'-o')
% lai uzzimet pareizi, vajag transponeta matrica
% matlab zime matricas pa kolonam
plot(Vm,Im','-o')
% Pielakosim polinomu
% funkcija polifit stradas tikai vektoriem
% ir funkcija kas sasumme vektoru
sum(Im)

ans =

    4.7000   10.0000   11.9000   16.3000   22.5000

% Sum ari stradas pa kolonam
% videja vertiba butu
Ivid = sum(Im)/5

Ivid =

    0.9400    2.0000    2.3800    3.2600    4.5000

% Tas bija tas kas jāatrod
sum(Im,1) % summe kolonas

ans =

    4.7000   10.0000   11.9000   16.3000   22.5000

sum(Im,2) % summe rindas

ans =

   13.3000
   13.1000
   13.1000
   13.2000
   12.7000

Ivid = mean(Im)

Ivid =

    0.9400    2.0000    2.3800    3.2600    4.5000

% mean() ari atrod videjo
C = poltfit(Vm,Ivid,3);
Undefined function or variable 'poltfit'.
 
Did you mean:
C = polyfit(Vm,Ivid,3);
V = linspace(min(Vm),max(Vm));
I = polyval(C,V);
% attelot grafiku:
% ar o attelot merijumu datus
% ar * attelot videjo vertibu
% ar liniju attelot pielaikoto ploinomu
Cvid = C;
Vvid = V;
Ivid = I;
C1 = C;
V1 = V;
I1 = I;
Ivid = mean(Im)

Ivid =

    0.9400    2.0000    2.3800    3.2600    4.5000

C2 = polyfit(Vm,Im,3);
Error using polyfit (line 44)
X and Y vectors must be the same size.
 
Im2 = [1.1 2.2 2.1 3.2 4.7]*1e-3;
C2 = polyfit(Vm,Im2,3);
I2 = polyval(C2,V);
plot(Im,Vm,"o",V1,I1,"p",V2,I2)
Undefined function or variable 'V2'.
 
plot(Im,Vm,"o",V1,I1,"p",V,I2)
plot(Im,Vm,"o",V1,I1',"p",V,I2)
plot(Im,Vm,"o",V1,I1',"p",V,I2')
plot(Vm,Im,"o",V1,I1',"p",V,I2')
plot(Vm,Im,"o",V1,I1,"p",V,I2)
plot(Vm,Im',"o",V1,I1,"p",V,I2)
Inovirze = std(Im)

Inovirze =

    0.1140    0.1581    0.1924    0.0894    0.1581

errorbar(Vm,Ivid,Inovirze)
errorbar(Vm,Ivid,Inovirze,'.')
hold on
plot(V,I)
hold off
xlabel("U,V")
ylabel("I,mA")
title("Stravas atkariba no sprieguma")
legend("eksperimentālie dati","pielaikotais polinoms")
grid
%datu nolasišana no grafika
ls
bilde1.png  bilde2.png	lab1_diary.m

A = imread("bilde1.png");
Error using imread>parse_inputs (line 450)
The file name or URL argument must be a character vector.

Error in imread (line 322)
[filename, fmt_s, extraArgs, was_cached_fmt_used] = parse_inputs(cached_fmt, varargin{:});
 
A = imread('bilde1.png');
B = imread('bilde2.png');
figure(1),image(A)
figure(2),image(B)
% x mainas no 500 lidz 800
% y mainas no 0 lidz 1
figure(2),image([500 800],[0 1], B)
figure(2),image([500 800],[1 0], B)
set(gca, 'YDir','normal')
figure(2),image([500 800],[1 0], B)
figure(2),image([500 800],[1 0],B)
figure(2),image([500 800],[1 0],B)
% varam nolasit grafiku
%izmantosim funkciju ginput(N)
[x,y] = ginput(10)

x =

  549.6779
  569.4022
  597.9685
  611.5715
  615.6524
  621.7738
  634.0165
  647.6195
  659.1820
  673.4652


y =

    0.0044
    0.0462
    0.2671
    0.5000
    0.6373
    0.8583
    0.9927
    0.7538
    0.5030
    0.2223

hold on
plot(x,y,'o')
hold off
diary off


