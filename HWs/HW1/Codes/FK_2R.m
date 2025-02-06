function [x,y] = FK_2R (theta1,theta2)
    l1 = 0.3; % length of link number one
    l2 = 0.3; % length of link number two
    x = l1 * cos(theta1) + l2 * cos(theta1 + theta2); %position of the end-effector
    y = l1 * sin(theta1) + l2 * sin(theta1 + theta2); %position of the end-effector

    % Plotting robot config in desired theta1 and theta2
    x0 = 0; %position of O
    y0 = 0; %position of O
    x1 = l1 * cos(theta1); %position of the end of the link number 1
    y1 = l1 * sin(theta1); %position of the end of the link number 1

    %plotting schematic of robot configuration
    plot([x0,x1,x],[y0,y1,y],'bo-')
    hold on
    plot(x,y,'*')
    title('schematic of robot configuration')
    legend('link l1 and l2','Position of end-effector')
    grid on
    xlim([0,0.6])
    ylim([0,0.6])
end

