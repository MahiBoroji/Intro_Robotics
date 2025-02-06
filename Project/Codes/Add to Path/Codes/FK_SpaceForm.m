function T = FK_SpaceForm(Slist, M, thetalist)

T = M;
for i = size(thetalist): -1: 1
    T = MatrixExp6(Slist(:, i), thetalist(i)) * T;
end
end