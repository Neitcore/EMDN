function y = lab3(t)
if nargin == 0
    t = 0:0.01:6.5;
end
%%Parejos laikus izteiksim ar datu filtraciju
t_sin_f = (t>=1.5) & (t<3.5);
t_sin = t(t_sin_f);
%t_sin= 1.5:0.01:3.5;
t_saw_f = (t>=0)&(t<0.5);
t_saw = t(t_saw_f);
%t_saw = 0:0.01:0.5;
t_const_f = (t>=3.5)&(t<5);
t_const = t(t_const_f);
%t_const = 3.5:0.01:5;
t_zero_f = (t>=0.5)&(t<1.5);
t_zero=t(t_zero_f);
%t_zero = 0.5:0.01:1.5;
t_noise_f = (t>=5)&(t<=6.5);
t_noise=t(t_noise_f);
%t_noise = 5:0.01:6.5;
%% sinusoida
A0=0; A= 1.5;
T = (3.5-1.5)/2;f=1/T;
delay = 1.5;
y_sin=A0+A*sin(2*pi*f*(t_sin-delay));
%plot(t_sin,y_sin)
%axis([xmin xmax ymin ymax])
axis([0 6.5 -2 2])
%% Lineari mainigais signals
%k = (yA-yB)/(tA-tB);
k = (1-0)/(0-0.5);
delay = 0.5;
y_saw = k*(t_saw-delay);
%hold on
%plot(t_saw,y_saw)
%% konstantes signals
y_const = 1.5+zeros(size(t_const));
%plot(t_const,y_const)
%% Nulles signal
y_zero = zeros(size(t_zero));
%plot(t_zero,y_zero)
%% troksna signals
y_noise = 1.5*rand(size(t_noise))-0.75;
%plot(t_noise,y_noise)
%% Visu signalu apvienosana
t = [t_saw,t_zero,t_sin,t_const,t_noise];
y = [y_saw,y_zero,y_sin,y_const,y_noise];
if nargout == 0
    plot(t,y)
    y=[];
end