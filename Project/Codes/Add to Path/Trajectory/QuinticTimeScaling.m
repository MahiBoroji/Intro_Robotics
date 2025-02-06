function [s, sd, sdd] = QuinticTimeScaling(Tf, t)

% Takes Tf: Total time of the motion in seconds from rest to rest,
%       t: The current time t satisfying 0 < t < Tf.
% Returns s: The path parameter s(t) corresponding to a fifth-order
%            polynomial motion that begins and ends at zero velocity and 
%            zero acceleration.

s = 10 * (t / Tf) ^ 3 - 15 * (t / Tf) ^ 4 + 6 * (t / Tf) ^ 5;
sd = 3*10 * (t^2 / Tf^3) - 4*15 * (t^3 / Tf^4) + 5*6 * (t^4 / Tf^5);
sdd = 2*3*10 * (t / Tf^3) - 3*4*15 * (t^2 / Tf^4) + 4*5*6 * (t^3 / Tf^5);
end