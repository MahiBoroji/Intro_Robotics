function  R = MatrixExp3(omghat, theta)
% Takes a unit axis omghat and a scalar theta
% Returns R in SO(3) that is achieved by rotating about omghat by theta from an initial orientation R = I.
omgmat = VecToso3(omghat);
if NearZero(norm(omghat))
    R = eye(3);
else
    R = eye(3) + sin(theta) * omgmat + (1 - cos(theta)) * omgmat * omgmat;
end
end