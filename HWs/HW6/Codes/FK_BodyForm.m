function T = FK_BodyForm(B,M,Theta)
    T = M;
    for i = 1: size(Theta)
        T = T * Transformation(B(:, i) , Theta(i));
    end

end