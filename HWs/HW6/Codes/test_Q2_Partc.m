clc
clear

S = [[0; 0; 1;0; 0; 0],[0; 0; 1; 0; -0.3; 0]];
theta = [pi/2; 0];
Js = J_SpaceForm(S, theta)

B = [[0; 0; 1; 0; 0.6; 0],[0; 0; 1; 0; 0.3; 0]];
Jb = J_BodyForm(B, theta)
%%
[x,y] = FK_2R (theta(1),theta(2));%finding the position of end-effector at this arbitrary config
p = [x,y,0] %z is 0
p_ss = skew_symmetric(p);
J_g_1 = [eye(3) zeros(3);
       -p_ss     eye(3)] * Js
%%
M = [eye(3) , [0.6;0;0]; 0 , 0 , 0 , 1]
T_sb = FK_BodyForm(B,M,theta)
T_sb = FK_SpaceForm(S,M,theta)
J_g_2 = [eye(3) zeros(3);
       -p_ss     eye(3)] * Adjoint(T_sb) * Jb
%%
[J] = J_2R (theta(1),theta(2))
