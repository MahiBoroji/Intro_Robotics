function [T] = Transformation(S, theta)

    S_w = S(1:3);
    S_v = S(4:6);
    
    if abs(norm(S_w)) < 1e-5
        R = eye(3);
        S_v = S_v / norm(S_v);
        P = theta * S_v;
    else
        R = rotation_mtrix(theta,S_w); %using HW3 Functions
        G = theta*eye(3) + (1-cos(theta))*skew_symmetric(S_w)+ (theta - sin(theta))*skew_symmetric(S_w)^2;
        P = G * S_v;
    end

    T = [R P ; 0 0 0 1];

end