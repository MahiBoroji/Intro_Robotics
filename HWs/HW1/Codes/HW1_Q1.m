%% user input section
clc
clear
theta1 = input('type theta1 in radian : ');  %initializing theta1
theta2 = input('type theta2 in radian : '); %initializing theta2

[x,y] = FK_2R(theta1,theta2)                %calling function FK_2R

%% test section 1
% validating function FK_2R with theta1 = 0 and theta2 = 0
clc
clear
theta1 = 0;
theta2 = 0;
[x,y] = FK_2R(theta1,theta2)

%% test section 2
% validating function FK_2R with theta1 = pi/4 and theta2 = 0
clc
clear
theta1 = pi/4;
theta2 = 0;
[x,y] = FK_2R(theta1,theta2)

%% test section 3
% validating function FK_2R with theta1 = pi/2 and theta2 = 0
clc
clear
theta1 = pi/2;
theta2 = 0;
[x,y] = FK_2R(theta1,theta2)

%% test section 4
% validating function FK_2R with theta1 = pi/4 and theta2 = pi/2
clc
clear
theta1 = pi/4;
theta2 = pi/2;
[x,y] = FK_2R(theta1,theta2)

