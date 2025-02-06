function [theta1, theta2] = IK_MinCoordinate(x_d, theta_0, threshold)

X_E_desired = x_d(1);
Y_E_desired = x_d(2);
theta1_initial = theta_0(1);
theta2_initial = theta_0(2);
% Define robot specs.
L1 = 0.3; % length of first link
L2 = 0.3; % length of second link

% Initialize variables.
X_E = Inf;
Y_E = Inf;
theta1 = theta1_initial;
theta2 = theta2_initial;
iter = 0;

while (abs(X_E - X_E_desired) > threshold || abs(Y_E - Y_E_desired) > threshold) && iter < 1000
    % Compute the end-effector position and Jacobian for the current joint angles.
    [X_E, Y_E] = FK_2R(theta1, theta2);
    J = J_2R(theta1, theta2);

    % Compute the error between the current and desired end-effector positions.
    delta_X = X_E_desired - X_E;
    delta_Y = Y_E_desired - Y_E;

    % Compute the joint angle increments using the Newton-Raphson method.
    delta_theta = pinv(J) * [delta_X; delta_Y];

    % Update the joint angles.
    theta1 = theta1 + delta_theta(1);
    theta2 = theta2 + delta_theta(2);

    iter = iter + 1;
end

% Check if the desired accuracy was achieved.
if iter >= 1000
    theta1 = 0;
    theta2 = 0;
end

end