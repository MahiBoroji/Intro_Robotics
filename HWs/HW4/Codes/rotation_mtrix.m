function [R] = rotation_mtrix(theta , w_v)
    n = length(w_v);
    w_ss = skew_symmetric(w_v);
    
    if norm(w_v)<1e-5 
        R = eye(n);
    else
        R = eye(n) + sin(theta)*w_ss + (1-cos(theta))*(w_ss^2);
    end
    
end
