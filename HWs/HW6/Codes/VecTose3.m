function se = VecTose3(V)

    se = [skew_symmetric(V(1: 3)), V(4: 6); 0, 0, 0, 0];

end
