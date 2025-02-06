function [theta] = IK_MinCoordinate(PE_d, theta_initial, threshold)
    
    %% Desired Position of End-Effector
    X_d = PE_d(1);
    Y_d = PE_d(2);

    %% Initial guess
    theta = theta_initial;
    
    %% Tolerance threshold
    tol = threshold;
    
    %% Iteration counter
    iter = 0;
    max_iter = 1000;
    
    %% Newton-Raphson method
    while iter < max_iter
        % Compute the current end-effector position
        [X_E, Y_E] = FK_2R(theta(1), theta(2));
        
        % Check if the desired position is reached
        if sqrt((X_d - X_E)^2 + (Y_d - Y_E)^2) < tol
            break;
        end
        
        % Compute the Jacobian
        J = J_2R(theta(1), theta(2));
        
        % Compute the error vector
        error = [X_d - X_E; Y_d - Y_E];
        
        % Update the joint variables
        theta = theta + pinv(J) * error;
        
        % Increment the iteration counter
        iter = iter + 1;
    end
    
    % If the maximum number of iterations is reached, display a message
    if iter == max_iter
        %disp('Max iterations reached. Solution may not have converged.');
        theta = false;
    end
end