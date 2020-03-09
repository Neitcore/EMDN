
	Classroom License -- for classroom instructional use only.

%% 4.labaratorijas darbs
%% Daudzkonturu shemas simulacija

% Dots:
R1 = 1; R2 = 2; R3 = 3; R4 = 4; R5 = 5; R6 = 6; R7 = 7;
E1 = 1; E2 = 2; E3 = 3;
R = [R1+R2+R3-R2 0;
-R2 R2+R4+R5 -R5;
0 -R5 R5+R6+R7]
Error using vertcat
Dimensions of arrays being concatenated are not consistent.
 
 
R = [R1+R2+R3 -R2 0;
-R2 R2+R4+R5 -R5;
0 -R5 R5+R6+R7]

R =

     6    -2     0
    -2    11    -5
     0    -5    18

E = [E1 -E2 -E3]'

E =

     1
    -2
    -3

%% vienadojums ir uzdots sadi:
% R*Ik = E
% atrisinat var ar Gause izslagsanas metodi
% kas if "\"
Ik = R\E

Ik =

    0.0735
   -0.2795
   -0.2443

%% esam atradusi 3 konturstravas
% esam atradusi 3 konturstravas
%% ir jaatrod UR2 - ?
%% ir jaatrod PR2 - ?
IR2 = Ik(1) - Ik(2);
UR2 = IR2 * R2

UR2 =

    0.7060

PR2 = IR2 * UR2

PR2 =

    0.2492

%% Pieniemsim ka E1, E2, E3 veribas ir citas
% bus 3 laika momenti, katra Ei bus
% tris vertibas
E1 = [1 -1 0];
E2 - [2 -2 0];
E3 = [3 -3 0];
E2 = [2 -2 0];
E = [E1;E2;E3]

E =

     1    -1     0
     2    -2     0
     3    -3     0

% atkal rekinasim vienadojumu sistemu
Ik = R\E

Ik =

    0.2847   -0.2847         0
    0.3540   -0.3540         0
    0.2650   -0.2650         0

% 1.kontursrava ir 1.rinda
%% ir jaatrod IR3 UR3 PR3
IR3 = Ik(1.:)
 IR3 = Ik(1.:)
             ↑
Error: Invalid expression. When calling a function or indexing a variable, use parentheses. Otherwise, check for mismatched
delimiters.
 
IR3 = Ik(1,:)

IR3 =

    0.2847   -0.2847         0

UR3 = IR3 * R3

UR3 =

    0.8540   -0.8540         0

PR3 = IR3.* UR3

PR3 =

    0.2431    0.2431         0

%% vel viens piemers
% laika mainigie signali
t = 0:0.01:1;
E1 = sin(2*pi*5*t);
%E2 = 2 konstante
E2 = 2+zeros(size(t));
E3 = 0.5 * cos(2*pi*7*t);
E = [E1;E2;E3];
Ik = R\E;
%% Bus jauzzime UR5, PR5 - ?
IR5 = Ik(3,:)-Ik(2,:);
PR5 = IR5 * R5;
UR5 = IR5 * R5;
PR5 = IR5 * UR5;
Error using  * 
Incorrect dimensions for matrix multiplication. Check that the number of columns in the first matrix matches the number of rows
in the second matrix. To perform elementwise multiplication, use '.*'.
 
PR5 = IR5.*UR5;
plot(t,UR5,t,PR5)
hold on
legend("Strava","Jauda")
xlabel("Laiks")
xlabel("Laiks, s")
grid()
hold off
%% ka var uzzimet divas dazadus grafikus, lai butu divas neatkarigas y asis
plotyy(t,UR5,t,PR5)
h = plotyy(t,UR5,t,PR5)

h = 

  1×2 Axes array:

    Axes    Axes

ylabel(h(1),"Spriegums, V")
ylabel(h(2),"Jauda, W")
legend("UR5(t)", "PR5(t)")
xlabel("Laiks, s")
grid()


%% vel viens variants 
Figure(2)
Undefined function or variable 'Figure'.
 
Did you mean:
figure(2)
yyaxis left
plot(t,UR5)
ylabel("Spriegums, V")
legend("UR5(t)")
xlabel("Laiks, s")
yyaxis right
plot(t,PR5)
ylabel("Jauda, W")
legend("PR5(t)")
legend("UR5(t)","PR5(t)")
grid
%% ka parbaudit rezultatus
% lai parbaudit rezultatus, ja aprekins
% bija veikts ar KSM parbauda Kirhofa
% spriguma likumu
% ka aprikins veikts ar MSM
% parbauda Kirhofa stravas likumu visiem mezgliem


% parbaudisim Kirhofa sprieguma likumu tresam konturam
% UR5 + UR6 + UR7 = -E3
% parvietosim visu uz vienu pusi
% UR5 + UR6 + UR7 + E3 = 0
% pieskirsim pusi mainigajam Utst
% Utst  = UR5+UR6+UR7+E3
% uzzimesim, jabut "0"
UR6 = Ik(3,:)*R6;
UR7 = Ik(3,:)*R7;
Utst =  UR5+UR6+UR7+E3;
figure(3)
plot(t,Utst),title("parbaude")
