function [s_hat,q,h] = screw_param (S)
    S_w = S(1:3);
    S_v = S(4:6);

    if abs(norm(S_w)) < 1e-5
        h = inf;
        s_hat = S_v /norm(S_v);
        q = [0;0;0]; % it could be anything
    else
        S_w = S_w / norm(S_w);
        s_hat = S_w;
        h = transpose(S_w)*S_v;
        syms q1 q2 q3 
        S_w1 = S_w(1);
        S_w2 = S_w(2);
        S_w3 = S_w(3);
        m = S_v - h * S_w;
        m1 = m(1);
        m2 = m(2);
        m3 = m(3);
        eq1 = m1 + S_w2 * q3 - S_w3 * q2 == 0 ;
        eq2 = m2 - S_w1 * q3 + S_w3 * q1 == 0 ;
        eq3 = m3 + S_w1 * q2 - S_w2 * q1 == 0 ;
        res = solve(eq1,eq2,eq3,q1,q2,q3);
        q1 = vpa(res.q1);
        q2 = vpa(res.q2);
        q3 = vpa(res.q3);
        q = [q1;q2;q3];
    end
end