function traj = CartesianTrajectory_circle(Xstart, Tf, N, method, center, RotMat)

switch nargin
    case 5
        RotMat = MatrixExp3([0, 0, 1], 0);
    case 4
        center = [0; 0; Xstart(3, 4)];
        RotMat = MatrixExp3([0, 0, 1], 0);
end

timegap = Tf / (N - 1);
traj = cell(1, N);
[Rstart, pstart] = TransToRp(Xstart);


radius = norm(pstart-center);


alpha = 2*pi;



for i = 1: N
    if method == 3
        [s, d, sdd] = CubicTimeScaling(Tf,timegap * (i - 1));
    else
        [s sd, sdd] = QuinticTimeScaling(Tf,timegap * (i - 1));
    end
    p = center + RotMat * [radius*cos(alpha*s); radius*sin(alpha*s); 0];
    traj{i} = [Rstart, p; 0, 0, 0, 1];
end
end