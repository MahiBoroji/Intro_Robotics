%Test case 1
clc
clear
s_hat = [1 ; 1; 1];
s_hat = s_hat / norm(s_hat);
q = [0 ; 5 ; 4];
h = 0.25;
theta = pi/2;
% plots
plot_triad(s_hat,q,h,theta)

%%
%Test case 2
clc
clear
s_hat = [5 ; 1; 5];
s_hat = s_hat / norm(s_hat)
q = [0 ; 0 ; 4];
h = inf;
theta = pi;
%plots
plot_triad(s_hat,q,h,theta)

%%
%Test case 3
clc
clear
q = [3 ; 0 ; 0];
s_hat = [0 ; 0 ; 1];
s_hat = s_hat / norm(s_hat);
h = 2;
theta = pi;
%plots
plot_triad(s_hat,q,h,theta)