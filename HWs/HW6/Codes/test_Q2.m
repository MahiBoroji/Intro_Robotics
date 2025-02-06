%%
%first test case
clc
clear
x_d = [0.3 , 0.5];
theta_0 = [pi/6 , pi/4];
threshold = 1e-5;
% using iterative numerical method
[theta1, theta2] = IK_MinCoordinate(x_d, theta_0, threshold)
% an analytic method
[theta1,theta2,theta1_,theta2_] = IK_2R (x_d(1),x_d(2))

%finding the second set of answers using iterative numerical method
theta_0 = [pi/2 , -pi/4];
[theta1, theta2] = IK_MinCoordinate(x_d, theta_0, threshold)

%%
%second test case
clc
clear
x_d = [0.2 , 0.35];
theta_0 = [pi/4 , pi/4];
threshold = 1e-5;
% using iterative numerical method
[theta1, theta2] = IK_MinCoordinate(x_d, theta_0, threshold)
% an analytic method
[theta1,theta2,theta1_,theta2_] = IK_2R (x_d(1),x_d(2))

%finding the second set of answers using iterative numerical method
theta_0 = [pi/2 , -pi/4];
[theta1, theta2] = IK_MinCoordinate(x_d, theta_0, threshold)

%%
%third test case
clc
clear
x_d = [0.5 , 0.1];
theta_0 = [-pi/3 , pi/4];
threshold = 1e-5;
% using iterative numerical method
[theta1, theta2] = IK_MinCoordinate(x_d, theta_0, threshold)
% an analytic method
[theta1,theta2,theta1_,theta2_] = IK_2R (x_d(1),x_d(2))

%finding the second set of answers using iterative numerical method
theta_0 = [pi/3 , -pi/2];
[theta1, theta2] = IK_MinCoordinate(x_d, theta_0, threshold)

