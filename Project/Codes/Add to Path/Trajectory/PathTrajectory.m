function [q, qd, qdd] = PathTrajectory(q0, q1, Tf, N, method)

% Takes q0: The initial angle,
%       q1: The final angle,
%       Tf: Total time of the motion in seconds from rest to rest,
%       N: The number of points N > 1 (Start and stop) in the discrete
%          representation of the trajectory,
%       method: The time-scaling method, where 3 indicates cubic
%               (third-order polynomial) time scaling and 5 indicates 
%               quintic (fifth-order polynomial) time scaling.
%

timegap = Tf / (N - 1);
q = zeros(N, numcols(q0'))';
qd = zeros(N, numcols(q0'))';
qdd = zeros(N, numcols(q0'))';

for i = 1: N
    if method == 3
        [s, sd, sdd] = CubicTimeScaling(Tf, timegap * (i - 1));
    else
        [s, sd, sdd] = QuinticTimeScaling(Tf, timegap * (i - 1));
    end
    q(:, i) = q0 + s*(q1-q0);
    qd(:, i) = sd*(q1-q0);
    qdd(:, i) = sdd*(q1-q0);
end
end

