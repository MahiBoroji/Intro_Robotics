clc
clear
l1 = 0.3; % length of link number one
l2 = 0.3; % length of link number two


for theta1 = 0:1:180
    theta1 = theta1*pi/180; %convert to radian
    for theta2 = 0:1:150
        theta2 = theta2*pi/180; %convert to radian
        x = l1 * cos(theta1) + l2 * cos(theta1 + theta2); %position of the end-effector
        y = l1 * sin(theta1) + l2 * sin(theta1 + theta2); %position of the end-effector
        plot(x,y,'*')
        hold on

    end
end

title('robot work space')
grid on
xlim([-0.6,0.6])
ylim([-0.6,0.6])



