function omg = so3ToVec(so3mat)
% Takes a 3x3 skew-symmetric matrix (an element of so(3)).
% Returns the corresponding 3-vector (angular velocity).
omg = [so3mat(3, 2); so3mat(1, 3); so3mat(2, 1)];
end