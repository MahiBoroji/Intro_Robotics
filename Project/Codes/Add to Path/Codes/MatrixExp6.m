function T = MatrixExp6(S, theta)

Sw = S(1: 3);
%Sw = Sw/norm(Sw);

Sv = S(4: 6);
%Sv = Sv/norm(Sv);


if NearZero(Sw)
    R = eye(3);
    p = theta * Sv;

    T = [R, p; 0, 0, 0, 1];
else
    R = MatrixExp3(Sw, theta);

    omgmat = VecToso3(Sw);

    G = (eye(3) * theta + (1 - cos(theta)) * omgmat ...
         + (theta - sin(theta)) * omgmat * omgmat);

    p = G * Sv;

    T = [R, p; 0, 0, 0, 1];
end
end