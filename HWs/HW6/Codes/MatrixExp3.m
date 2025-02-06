function  R = MatrixExp3(so)

omgtheta = vectorize(so);
if abs(norm(omgtheta)) < 1e-6
    R = eye(3);
else
    theta = norm(omgtheta);
    omghat = omgtheta / theta;
    omgmat = so / theta;
    R = eye(3) + sin(theta) * omgmat + (1 - cos(theta)) * omgmat * omgmat;
end
end
