function AdT = Adjoint(T)
R = T(1: 3, 1: 3);
p = T(1: 3, 4);
AdT = [R, zeros(3); VecToso3(p) * R, R];
end