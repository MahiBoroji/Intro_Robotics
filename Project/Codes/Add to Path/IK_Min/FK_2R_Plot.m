function [X_E, Y_E] = FK_2R_Plot(theta_1, theta_2)
%% Defining Robot Specs.

L_1 = 0.3; % length of first link
L_2 = 0.3; % length of second link

x_0 = 0; % origin of the coordinate
y_0 = 0; % origin of the coordinate


%% Calculating Link1, End-Effector Position using Link Angles.

x_1 = L_1 * cos(theta_1); % x position of link 1 
y_1 = L_1 * sin(theta_1); % y position of link 1

X_E = x_1 + L_2 * cos(theta_1 + theta_2); % x position of end-effector
Y_E = y_1 + L_2 * sin(theta_1 + theta_2); % y position of end-effector


%% Plot Configuration Schematic.

figure;

plot ([0 x_1], [0 y_1], '-bo', [x_1 X_E], [y_1 Y_E],'-ro', "linewidth", 2); % plot two links schematic
text(X_E,Y_E,[' (', num2str(round(X_E, 2)), ', ', num2str(round(Y_E, 2)), ')']); % text end-effector position

hold on;
yline(y_0); % coordinate origin line
xline(x_0); % coordinate origin line

txt = "  $\theta_1=" + num2str(round(theta_1 * 180/pi))+ "^{\circ}$";
text(x_0, y_0, txt, "Interpreter","latex", "FontSize",10, "Color", "blue"); % text theta_1

txt = "  $\theta_2=" + num2str(round(theta_2 * 180/pi))+ "^{\circ}$";
text(x_1, y_1, txt, "Interpreter","latex", "FontSize",10, "Color", "red"); % text theta_2

lim = (L_1 + L_2)*1.1; % define plot limit
xlim([-lim lim]);
ylim([-lim lim]);
axis equal; 


str = "Forward Kinematic-Schematic of a Two-Link Robot Arm with $\theta=("+num2str(round(theta_1*180/pi, 1))+"^{\circ}, "+num2str(round(theta_2*180/pi, 1))+"^{\circ})$";

title (str, "Interpreter","latex", "FontSize", 18); % title
xlabel ("X", "Interpreter","latex", "FontSize", 18);
ylabel ("Y", "Interpreter","latex", "FontSize", 18);
grid on;


end