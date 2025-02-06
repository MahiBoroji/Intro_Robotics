function thetas = IK_SpaceForm(Tsd, theta0, epsilon, S, M)
% Inputs:
% Tsd: desired end-effector configuration in frame {s}
% theta0: initial guess for the joint variables
% epsilon: threshold values for the final error, a vector (eps_w, eps_v)
% B: Screw axes of robot joints expressed in frame {s} 
% M: configuration of frame {b} relative to frame {s} at home configuration
% Outputs:
% thetas: joint variables that achieve the desired end-effector configuration

% Set maximum number of iterations and damping factor
max_iter = 100;
damping = 1;

% Initialize joint variables
thetas = theta0;


% Start the iteration loop
for iter = 1:max_iter
    % Compute forward kinematics and error
    Tsb = FK_SpaceForm(S, M, thetas);
    Tbd = TransInv(Tsb) * Tsd;
    Vb = se3ToVec(Matrix_Log6(Tbd));
    Vs = Adjoint(Tsb)*Vb;

    err = norm(Vs(1: 3)) < epsilon(1) || norm(Vs(4: 6)) < epsilon(2);
         
    
    % Check termination condition
    if err
        break;
    end
    
    % Compute the Jacobian and its pseudoinverse
    Js = J_SpaceForm(S, thetas);
    pinvJ = pinv(Js);
    
    % Update joint variables
    dthetas = damping * pinvJ * Vs;
    thetas = thetas + dthetas;
    
    % Check joint limits
    qlim = [-2.8973, 2.8973; -1.7628, 1.7628; -2.8973, 2.8973; -3.0718, -0.0698; -2.8973, 2.8973; -0.0175, 3.7525; -2.8973, 2.8973];


    
    thetas = wrapToLimits (thetas, qlim);
end

end