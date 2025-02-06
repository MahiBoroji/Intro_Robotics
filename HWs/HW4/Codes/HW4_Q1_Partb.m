%Test case 1
clc
clear
S = [0.5774;
     0.5774;
     0.5774;
     0.7217;
     2.4537;
    -2.7424];
theta = pi/2;
T1 = Transformation(S, theta)


%%
%Test case 2
clc
clear
S = [    0;
         0;
         0;
    0.7001;
    0.1400;
    0.7001];
theta = pi;
T2 = Transformation(S, theta)

%%
%Test case 3
clc
clear
S = [0;
     0;
     1;
     0;
    -3;
     2];
theta = pi;
T3 = Transformation(S , theta)