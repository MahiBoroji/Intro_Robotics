clc
clear
robot = importrobot('PRRRRR_Robot.urdf');
robot.DataFormat = 'column';
%Theta = [0.15 0 0 0 0 0].';
Theta = [0 0 0 0 0 0].';  %Home Configuration
%Theta = [0.05; pi/6; pi/8; pi/8; -pi/4; pi/3];
show(robot,Theta);
