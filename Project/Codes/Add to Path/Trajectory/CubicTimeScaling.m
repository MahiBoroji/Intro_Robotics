function [s, sd, sdd] = CubicTimeScaling(Tf, t)

% Takes Tf: Total time of the motion in seconds from rest to rest,
%       t: The current time t satisfying 0 < t < Tf.
% Returns s: The path parameter s(t) corresponding to a third-order 
%            polynomial motion that begins and ends at zero velocity.

s = 3 * (t / Tf) ^ 2 - 2 * (t / Tf) ^ 3;
sd = 6 * (t / Tf^2) - 6 * (t^2 / Tf ^ 3);
sdd = 6 * (1 / Tf) ^ 2 - 12 * (t / Tf ^ 3);
end