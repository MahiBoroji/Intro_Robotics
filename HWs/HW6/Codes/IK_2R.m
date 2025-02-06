function [theta1,theta2,theta1_,theta2_] = IK_2R (x,y)
    l1 = 0.3; % length of link number one
    l2 = 0.3; % length of link number two
    
    %calculationg theta1 and theta2 using atan2
    u = (x^2 + y^2 -(l1^2 + l2^2)) / (2 * l1 * l2);
    theta2 = atan2(sqrt(1-u^2),u);                                 %first possible value of theta2
    theta1 = atan2(y,x) - atan2(l2*sin(theta2),l1+l2*cos(theta2));  %first possible value of theta1
    theta2_= atan2(-sqrt(1-u^2),u);                                %scond possible value of theta2
    theta1_= atan2(y,x) - atan2(l2*sin(theta2_),l1+l2*cos(theta2_));%second possible value of theta1

    % Plotting robot config in desired theta1 and theta2
    x0 = 0; %position of O
    y0 = 0; %position of O
    x1 = l1 * cos(theta1); %position of the end of the link number 1 with theta1
    y1 = l1 * sin(theta1); %position of the end of the link number 1 with theta1
    x1_= l1 * cos(theta1_); %position of the end of the link number 1 with theta1'
    y1_= l1 * sin(theta1_); %position of the end of the link number 1 with theta1'


    %plotting schematic of robot configuration
    plot([x0,x1,x],[y0,y1,y],'bo-')  %first possible robot configuration
    hold on
    plot([x0,x1_,x],[y0,y1_,y],'ro-') %second possible robot configuration
    plot(x,y,'*')
    title('possible schematics of robot configuration')
    legend('link l1 and l2','Position of end-effector')
    grid on
    xlim([0,0.6])
    ylim([-0.6,0.6])
    
end