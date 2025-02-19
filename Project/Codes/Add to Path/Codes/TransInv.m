function invT = TransInv(T)
% Takes a transformation matrix T.
% Returns its inverse. 
% Uses the structure of transformation matrices to avoid taking a matrix
% inverse, for efficiency.
% Example Input:
% 
% clear; clc;
% T = [[1, 0, 0, 0]; [0, 0, -1, 0]; [0, 1, 0, 3]; [0, 0, 0, 1]];
% invT = TransInv(T)
% 
% Ouput:
% invT =
%     1     0     0     0
%     0     0     1    -3
%     0    -1     0     0
%     0     0     0     1

R = T(1: 3, 1: 3);
p = T(1: 3, 4);
invT = [transpose(R), -transpose(R) * p; 0, 0, 0, 1];
end
