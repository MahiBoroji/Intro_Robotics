function [S,theta] = Logarithm(T)
    R = T(1:3,1:3);
    P = T(1:3,4);

    if trace(R) == 3
        S_w = [0 ; 0 ; 0];
        S_v = P / norm (P);
        theta = norm(P);
    else
        [theta , S_w] = Matrix_log (R);
        S_w = skew_symmetric (S_w);
        G_inverse = (1/theta) * eye(3) - 0.5 * S_w + ((1/theta) -0.5*cot(theta/2))*(S_w^2);
        S_v = G_inverse * P;
        S_w = vectorize (S_w);
    end
    
    S = [S_w ; S_v];
end