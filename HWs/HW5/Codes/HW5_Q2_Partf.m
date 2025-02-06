clc
clear
M = [[1, 0, 0, 0];[0, 1, 0, 0.90];[0, 0, 1, 0.35];[0, 0, 0, 1]];
S = [[0;0;0;0;1;0],[0;0;1;0.2;0;0],[1;0;0;0;0.35;-0.2],[1;0;0;0;0.35;-0.4],[1;0;0;0;0.35;-0.6],[0;1;0;-0.35;0;0]];
Theta = [0.15; pi/2; 0; 0; pi/4; pi/8];
T1 = FK_SpaceForm(S, M, Theta)
B = [[0;0;0;0;1;0],[0;0;1;-0.70;0;0],[1;0;0;0;0;0.70],[1;0;0;0;0;0.50],[1;0;0;0;0;0.30],[0;1;0;0;0;0]];
T2 = FK_BodyForm(B, M, Theta)
robot = importrobot('PRRRRR_Robot.urdf');
robot.DataFormat = 'column';
show(robot,Theta);
triad('Matrix',T1,'Scale',0.2,'LineWidth',1,'linestyle','-.');