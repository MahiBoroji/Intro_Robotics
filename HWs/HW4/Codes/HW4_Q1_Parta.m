%Test case 1
% rotation with/without translation along s_hat
clc
clear
s_hat = [1 ; 1; 1];
s_hat = s_hat / norm(s_hat)
q = [0 ; 5 ; 4];
h = 0.25;
S1 = screw_interpretation (s_hat,q,h)
%[s_hat1,q1,h1] = screw_param (S1)
%%
%test case 2
% pure translation along ො𝒔
clc
clear
s_hat = [5 ; 1; 5];
s_hat = s_hat / norm(s_hat)
q = [0 ; 0 ; 4];
h = inf;
S2 = screw_interpretation (s_hat,q,h)
%[s_hat2,q2,h2] = screw_param (S2)

%%
%test case 3
clc
clear
q = [3 ; 0 ; 0];
s_hat = [0 ; 0 ; 1];
s_hat = s_hat / norm(s_hat)
h = 2;
S3 = screw_interpretation(s_hat,q,h)

