function thetalist = IK_Body(T, thetalist0, epsilon, Blist, M)

eomg = epsilon(1);
ev = epsilon(2);
thetalist = thetalist0;
i = 0;
maxiterations = 20;
Vb = se3ToVec(Matrix_Log6(TransInv(FKinBody(M, Blist, thetalist)) * T));
err = norm(Vb(1: 3)) > eomg || norm(Vb(4: 6)) > ev;
while err && i < maxiterations
    thetalist = thetalist + pinv(JacobianBody(Blist, thetalist)) * Vb;
    i = i + 1;
    Vb = se3ToVec(Matrix_Log6(TransInv(FKinBody(M, Blist, thetalist)) * T));
    err = norm(Vb(1: 3)) > eomg || norm(Vb(4: 6)) > ev;

    % Check joint limits
    qlim = [-2.8973, 2.8973; -1.7628, 1.7628; -2.8973, 2.8973; -3.0718, -0.0698; -2.8973, 2.8973; -0.0175, 3.7525; -2.8973, 2.8973];

    thetalist = wrapToLimits (thetalist, qlim);
end
end