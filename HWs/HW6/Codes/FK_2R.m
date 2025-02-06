function [x,y] = FK_2R (theta1,theta2)
    l1 = 0.3; % length of link number one
    l2 = 0.3; % length of link number two
    x = l1 * cos(theta1) + l2 * cos(theta1 + theta2); %position of the end-effector
    y = l1 * sin(theta1) + l2 * sin(theta1 + theta2); %position of the end-effector

end

