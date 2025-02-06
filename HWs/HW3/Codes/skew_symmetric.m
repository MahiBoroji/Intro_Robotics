function [w_ss] = skew_symmetric(w_v)
%takes the vector form of omega and convert it to skew-symmetric    
    w_v1 = w_v(1);
    w_v2 = w_v(2);
    w_v3 = w_v(3);

    w_ss = [0    -w_v3   w_v2;
            w_v3    0   -w_v1;
           -w_v2   w_v1    0]; %skew-symmetric of vector w

end