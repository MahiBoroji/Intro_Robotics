function T = FK_BodyForm(Blist, M, thetalist)
T = M;
for i = 1: size(thetalist)
    T = T * MatrixExp6(Blist(:, i), thetalist(i));
end
end