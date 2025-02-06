function Js = JacobianSpace(Slist, thetalist)

Js = Slist;
T = eye(4);
for i = 2: length(thetalist)
    T = T * Matrix_Exp6(VecTose3(Slist(:, i - 1) * thetalist(i - 1)));
	Js(:, i) = Adjoint(T) * Slist(:, i);
end
end