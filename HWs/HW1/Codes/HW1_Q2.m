%% 
clc
clear
x = input('type x value in meter : ');  %initializing x
y = input('type y value in meter : ');  %initializing y

[theta1,theta2,theta1_,theta2_] = IK_2R(x,y) %calling function IK_2R

%% test section 1
% validating function IK_2R with x = 0.6 and y = 0 (theta1 = 0 and theta2 = 0 )using FK_2R
clc
clear
theta1 = 0;
theta2 = 0;
[x,y] = FK_2R(theta1,theta2);
[theta1,theta2,theta1_,theta2_] = IK_2R(x,y) %which represents our desired theta1 and theta2

%% test section 2
% validating function IK_2R with (theta1 = pi/4 and theta2 = 0 )using FK_2R
clc
clear
theta1 = pi/4;
theta2 = 0;
[x,y] = FK_2R(theta1,theta2);
[theta1,theta2,theta1_,theta2_] = IK_2R(x,y) %which represents our desired theta1 and theta2

%% test section 3
% validating function IK_2R with (theta1 = pi/2 and theta2 = 0 )using FK_2R
clc
clear
theta1 = pi/2;
theta2 = 0;
[x,y] = FK_2R(theta1,theta2);
[theta1,theta2,theta1_,theta2_] = IK_2R(x,y) %which represents our desired theta1 and theta2

%% test section 4
% validating function IK_2R with (theta1 = pi/4 and theta2 = pi/2 )using FK_2R
clc
clear
theta1 = pi/4;
theta2 = pi/2;
[x,y] = FK_2R(theta1,theta2);
[theta1,theta2,theta1_,theta2_] = IK_2R(x,y) %which represents our desired theta1 and theta2

