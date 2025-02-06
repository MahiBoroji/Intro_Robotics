%Test case 1
clc
clear
s_hat = [1 ; 1; 1];
s_hat = s_hat / norm(s_hat)
q = [0 ; 5 ; 4];
h = 0.25;
theta = pi/2;
S1 = screw_interpretation (s_hat,q,h)
T1 = Transformation(S1, theta)
[S1,theta1] = Logarithm (T1)
[s_hat1,q1,h1] = screw_param (S1)
%%
%Test case2
clc
clear
s_hat = [5 ; 1; 5];
s_hat = s_hat / norm(s_hat)
q = [0 ; 0 ; 4];
h = inf;
theta = pi;
S2 = screw_interpretation (s_hat,q,h)
T2 = Transformation(S2, theta)
[S2,theta2] = Logarithm (T2)
[s_hat2,q2,h2] = screw_param (S2)

%%
%Test case 3
clc
clear
q = [3 ; 0 ; 0];
s_hat = [0 ; 0 ; 1];
s_hat = s_hat / norm(s_hat)
h = 2;
theta = pi;
S3 = screw_interpretation (s_hat,q,h)
T3 = Transformation(S3, theta)
[S3,theta3] = Logarithm (T3)
[s_hat3,q3,h3] = screw_param (S3)
