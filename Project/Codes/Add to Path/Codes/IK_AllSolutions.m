function [thetas] = IK_AllSolutions(PE_d, threshold)
% Finds all possible inverse kinematic solutions for a 2R robot in the
% plane given a desired end-effector position [X_d; Y_d] using the
% IK_MinCoordinate function.

%% Desired Position of End-Effector
X_d = PE_d(1);
Y_d = PE_d(2);


% Set the number of random initial guesses
num_guesses = 100;

% Initialize the list of joint solutions
thetas = [];

% Iterate through the random initial guesses
for i = 1:num_guesses
    % Generate a random initial guess for the joint variables
    theta_initial = [rand()*2*pi, rand()*2*pi];

    % Call the IK_MinCoordinate function with the random initial guess
    [theta] = IK_MinCoordinate(PE_d, theta_initial, threshold);

    if theta
        theta = [theta(1); theta(2)];
        % Add the solution to the list if it falls within the range of 0 to 2*pi
        theta = mod(theta, 2*pi);

        if all(theta >= 0) && all(theta <= 2*pi)
            % Add the solution to the list
            thetas = [thetas, theta];
        end
    end
end

% Remove duplicate solutions
thetas = unique(round(thetas.', 4), "rows");
thetas = thetas.';
end