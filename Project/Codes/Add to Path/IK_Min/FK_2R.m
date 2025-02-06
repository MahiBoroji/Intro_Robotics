function [X_E, Y_E] = FK_2R(theta_1, theta_2)
%% Defining Robot Specs.

L_1 = 0.3; % length of first link
L_2 = 0.3; % length of second link

x_0 = 0; % origin of the coordinate
y_0 = 0; % origin of the coordinate


%% Calculating Link1, End-Effector Position using Link Angles.

x_1 = L_1 * cos(theta_1); % x position of link 1 
y_1 = L_1 * sin(theta_1); % y position of link 1

X_E = x_1 + L_2 * cos(theta_1 + theta_2); % x position of end-effector
Y_E = y_1 + L_2 * sin(theta_1 + theta_2); % y position of end-effector



end

