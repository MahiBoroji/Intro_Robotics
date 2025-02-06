function T = MatrixExp6(se)

omgtheta = vectorize(se(1: 3, 1: 3));
if abs(norm(omgtheta)) < 1e-6
    T = [eye(3), se(1: 3, 4); 0, 0, 0, 1];
else
    theta = norm(omgtheta);
    omghat = omgtheta / theta;
    omgmat = se(1: 3, 1: 3) / theta; 
    T = [MatrixExp3(se(1: 3, 1: 3)), ...
         (eye(3) * theta + (1 - cos(theta)) * omgmat ...
          + (theta - sin(theta)) * omgmat * omgmat) ...
            * se(1: 3, 4) / theta;
         0, 0, 0, 1];
end

end