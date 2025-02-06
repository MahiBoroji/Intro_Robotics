function T = FKinSpace(M, Slist, thetalist)


T = M;
for i = size(thetalist): -1: 1
    T = Matrix_Exp6(VecTose3(Slist(:, i) * thetalist(i))) * T;
end
end