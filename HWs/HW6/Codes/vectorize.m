function [w_v] = vectorize(w_ss)
%takes the ske-symmetric form of omega and converts it to vector.
    w_v = [w_ss(3,2);w_ss(1,3);w_ss(2,1)];
end