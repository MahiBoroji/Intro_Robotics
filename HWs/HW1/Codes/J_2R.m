function [J] = J_2R (theta1,theta2)
    l1 = 0.3; % length of link number one
    l2 = 0.3; % length of link number two
    J = [-l1*sin(theta1)-l2*sin(theta1+theta2)  -l2*sin(theta1+theta2);
        l1*cos(theta1)+l2*cos(theta1+theta2)  l2*cos(theta1+theta2)]; %calculating Jacobian matrix

    % Plotting robot config in desired theta1 annd theta2
    x0 = 0; %position of O
    y0 = 0; %position of O
    x1 = l1 * cos(theta1); %position of the end of the link number 1 with theta1
    y1 = l1 * sin(theta1); %position of the end of the link number 1 with theta1
    x = l1 * cos(theta1) + l2 * cos(theta1 + theta2); %position of the end-effector
    y = l1 * sin(theta1) + l2 * sin(theta1 + theta2); %position of the end-effector

    %plotting schematic of robot configuration
    plot([x0,x1,x],[y0,y1,y],'bo-')
    hold on
    plot(x,y,'*')
    grid on
    xlim([-1,1])
    ylim([0,1])

    %plotting velocity manipulability Ellipsoid
    hold on
    syms X 
    syms Y
    J_ = transpose(inv(J))*inv(J);
    eqn_velocity = [X-x Y-y]*J_*[X-x;Y-y] - 1/5
    v =ezplot(eqn_velocity)
    set(v,'Color','red', 'LineWidth', 2)

    %plotting force manipulability Ellipsoid
    hold on
    syms F1
    syms F2
    J__ = J*(transpose(J));
    eqn_force = [F1-x F2-y]*J__*[F1-x;F2-y] - 1/1000
    f = ezplot(eqn_force)
    set(f,'Color','black', 'LineWidth', 2)
    title('schematic of robot configuration')
    legend('link l1 and l2','Position of end-effector','velocity ellipsoid','force ellipsoid')

    
end

