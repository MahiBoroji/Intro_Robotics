function [omghat, theta] = MatrixLog3(R)
% Takes R (rotation matrix).
% Returns the corresponding omghat, theta.

acosinput = (trace(R) - 1) / 2;
if trace(R) >= 3
    theta = 0;
    omghat = [0; 0; 0];
elseif trace(R)<= -1
    if ~NearZero(1 + R(3, 3))
        omghat = (1 / sqrt(2 * (1 + R(3, 3)))) ...
              * [R(1, 3); R(2, 3); 1 + R(3, 3)];
    elseif ~NearZero(1 + R(2, 2))
        omghat = (1 / sqrt(2 * (1 + R(2, 2)))) ...
              * [R(1, 2); 1 + R(2, 2); R(3, 2)];
    else
        omghat = (1 / sqrt(2 * (1 + R(1, 1)))) ...
              * [1 + R(1, 1); R(2, 1); R(3, 1)];
    end
    theta= pi;
else
	theta = acos(acosinput);
    omgmat = (1 / (2 * sin(theta))) * (R - R');
    omghat = so3ToVec(omgmat);
end
end