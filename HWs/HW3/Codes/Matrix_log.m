function [theta , w_v] = Matrix_log (R)
    if trace(R)==3 | R == eye(3)
        theta = 0;
        w_v = [0;0;0];
    end
    if trace(R)==-1
        if ((1 + R(1,1)) > 1e-5)
            theta = pi;
            w_v = (1 / sqrt(2 * (1 + R(1, 1)))) * [1 + R(1, 1); R(2, 1); R(3, 1)];
            w_v = w_v / norm(w_v);
                        
        elseif ((1 + R(2,2)) > 1e-5)
            theta = pi;
            w_v = (1 / sqrt(2 * (1 + R(2, 2)))) * [R(1, 2); 1 + R(2, 2); R(3, 2)];
            w_v = w_v / norm(w_v);
            
        else ((1 + R(3,3)) > 1e-5)
            theta = pi;
            w_v = (1 / sqrt(2 * (1 + R(3, 3)))) * [R(1, 3); R(2, 3); 1 + R(3, 3)];
            w_v = w_v / norm(w_v);
            
        end
    else
        theta = acos((trace(R)-1)/2); %general form
        w_ss = (1/(2*sin(theta)))*(R-transpose(R));
        w_v = vectorize(w_ss);
    end
  

end