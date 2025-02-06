function Jb = JacobianBody(Blist, thetalist)


Jb = Blist;
T = eye(4);
for i = length(thetalist) - 1: -1: 1   
    T = T * Matrix_Exp6(VecTose3(-1 * Blist(:, i + 1) * thetalist(i + 1)));
	Jb(:, i) = Adjoint(T) * Blist(:, i);
end
end