function [q, s, h] = AxisToScrew(S)
% Extract the rotational and translational components of S
Sw = S(1: 3);
Sv = S(4: 6);

% Compute the screw axis parameters
if NearZero (Sw)
    % If Sw = 0, then the screw axis is purely translational
    s = Sv / norm(Sv);
    q = [0; 0; 0];
    h = inf;
else
    % Otherwise, the screw axis is a twist
    s = Sw / norm(Sw);
    h = transpose(Sw) * Sv;

    % q is not unique, so the point q is computed as the point on 
    % the screw axis that is closest to the origin
    q = cross(Sw, Sv-h*Sw) / norm(Sw)^2;
end
end
