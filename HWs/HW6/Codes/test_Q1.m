%
%Question 1 part a
clc
clear
S = [[0; 0; 1;   0; 0.2; 0.2], ...
        [1; 0; 0;   2;   0;   3], ...
        [0; 1; 0;   0;   2;   1], ...
        [1; 0; 0; 0.2; 0.3; 0.4]];
 theta = [0.2; 1.1; 0.1; 1.2];
 Js = J_SpaceForm(S, theta)
 %%
 %Question 1 part b
 clc
 clear
 B = [[0; 0; 1;   0; 0.2; 0.2], ...
        [1; 0; 0;   2;   0;   3], ...
        [0; 1; 0;   0;   2;   1], ...
        [1; 0; 0; 0.2; 0.3; 0.4]];
 theta = [0.2; 1.1; 0.1; 1.2];
 Jb = J_BodyForm(B, theta)

 %%
 %Question 1 part c
 clc
 clear
 S = [[0; 0; 1;   0; 0; 0], ...
        [1; 0; 0;   0;   0.5;   0], ...
        [0; 0; 1;   0.5;   0;   0], ...
        [0; 0; 0; 0; 1; 0]]

 B = [[0; 0; 1;   -0.5; 0; 0], ...
        [1; 0; 0;   0;   0;   0.5], ...
        [0; 0; 1;   0;   0;   0], ...
        [0; 0; 0; 0; 1; 0]]

 theta = [0; 0; pi/2; 0.5];
 Js = J_SpaceForm(S, theta)
 Jb = J_BodyForm(B, theta)