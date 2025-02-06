function Jb = J_BodyForm(B, theta)

Jb = B;
T = eye(4);
for i = length(theta) - 1: -1: 1   
    T = T * MatrixExp6(VecTose3(-1 * B(:, i + 1) * theta(i + 1)));
	Jb(:, i) = Adjoint(T) * B(:, i);
end

end