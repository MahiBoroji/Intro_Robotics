function T = FKinBody(M, Blist, thetalist)
T = M;
for i = 1: size(thetalist)
    T = T * Matrix_Exp6(VecTose3(Blist(:, i) * thetalist(i)));
end
end