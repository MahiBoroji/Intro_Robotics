function S = ScrewToAxis(q, s, h)
s = s/norm(s);

% Pure Translation, h = inf
if isinf(h)
    S = [0; 0; 0; s];
else
    % Pitch is finite
    S = [s; cross(q, s) + h * s];
end
end