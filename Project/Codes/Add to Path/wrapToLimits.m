function thetas = wrapToLimits (q, qlim)
    qlim_l = qlim(:, 1);
    qlim_u = qlim(:, 2);

    q(q <= -2*pi) = wrapToPi(q(q <= -2*pi));
    q(q > 2*pi) = wrapTo2Pi (q(q > 2*pi));
    q(q == 2*pi) = wrapToPi(q(q == 2*pi));

    thetas = max(min(q, qlim_u), qlim_l);

end
