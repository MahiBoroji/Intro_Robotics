function [S] = screw_interpretation(s_hat, q , h)
    s_hat = s_hat / norm(s_hat);
    %case 1 : when there is a rotational component and ω≠0 (normal case)
    S = [s_hat ; cross(-s_hat,q) + h.*s_hat];
    
    %case 2 : is when there is no rotational motion (ω=0), and thus the pitch h is infinite.
    if isinf(h)
        S = [0 ; 0 ; 0 ; s_hat];
    end

end
