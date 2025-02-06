function Js = J_SpaceForm(S, theta)

    Js = S;
    T = eye(4);
    for i = 2: length(theta)
        T = T * MatrixExp6(VecTose3(S(:, i - 1) * theta(i - 1)));
	    Js(:, i) = Adjoint(T) * S(:, i);
    end
    
end