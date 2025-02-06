function [S, theta] = MatrixLog6(T)

R = T(1: 3, 1: 3);
p = T(1: 3, 4);
[Sw, theta] = MatrixLog3(R);

if abs(trace(R)-3) <1e-6
    Sw = [0; 0; 0];
    Sv = p / norm(p);
    theta = norm(p);
    S = [Sw; Sv];
else
    omgmat = VecToso3(Sw);
    
    Sv = (eye(3) / theta - omgmat / 2 + (1 / theta - cot(theta / 2) / 2) * omgmat * omgmat) * p;

    S = [Sw; Sv];

end



end