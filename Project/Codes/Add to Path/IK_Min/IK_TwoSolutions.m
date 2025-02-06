function [thetas] = IK_AllSolutions(X_d, Y_d, threshold)
% Finds all possible inverse kinematic solutions for a 2R robot in the
% plane given a desired end-effector position (X_d, Y_d) using the
% IK_MinCoordinate function.

% Set the number of random initial guesses
num_guesses = 100;

% Initialize the list of joint solutions
thetas = [];

% Iterate through the random initial guesses
for i = 1:num_guesses
    % Generate a random initial guess for the joint variables
    theta_initial = [rand()*2*pi, rand()*2*pi];

    % Call the IK_MinCoordinate function with the random initial guess
    theta = IK_MinCoordinate(X_d, Y_d, theta_initial, threshold);
    
    % Check if the solution is unique and has not already been found
    if ~any(all(repmat(theta, size(thetas, 1), 1) == thetas, 2), 1)
        % Add the solution to the list
        thetas = [thetas; theta];
    end
end

end