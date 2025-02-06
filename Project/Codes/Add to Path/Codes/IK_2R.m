function [THETA_1, THETA_2] = IK_2R(PE_d)

L_1 = 0.3;
L_2 = 0.3;

x_0 = 0;
y_0 = 0;

X_E = PE_d(1);
Y_E = PE_d(2);

u = (X_E^2 + Y_E^2 - L_1^2 - L_2^2)/(2* L_1 * L_2);

%avoid causing error with x or y = L_1 + L_2 
if u>1
    u = round(u, 5);
end


%Compute THETA_1
theta1_2 = wrapTo2Pi(atan2(sqrt(1-u^2), u));
theta1_1 = wrapTo2Pi(atan2(Y_E, X_E) - atan2(L_2 * sin(theta1_2), L_1 + L_2 * cos(theta1_2)));
THETA_1 = [theta1_1; theta1_2];


%Compute THETA_2
theta2_2 = wrapTo2Pi(atan2(-sqrt(1-u^2), u));
theta2_1 = wrapTo2Pi(atan2(Y_E, X_E) - atan2(L_2 * sin(theta2_2), L_1 + L_2 * cos(theta2_2)));
THETA_2 = [theta2_1; theta2_2];


%Compute x_1, y_1
x_1_1 = L_1 * cos(theta1_1);
y_1_1 = L_1 * sin(theta1_1);

%Compute x_1, y_1  
x_1_2 = L_1 * cos(theta2_1);
y_1_2 = L_1 * sin(theta2_1);

figure;
plot ([0 x_1_1], [0 y_1_1], '-bo', [x_1_1 X_E], [y_1_1 Y_E],'-ro', "linewidth", 2);
hold on;
plot ([0 x_1_2], [0 y_1_2], '--bo', [x_1_2 X_E], [y_1_2 Y_E],'--ro', "linewidth", 2);


yline(y_0);
xline(x_0);
hold off;

text(X_E,Y_E,[' (', num2str(round(X_E, 2)), ', ', num2str(round(Y_E, 2)), ')']);

txt = "  $\theta_1=" + num2str(round(theta1_1 * 180/pi))+ "^{\circ}$";
text(x_0, y_0, txt, "Interpreter","latex", "FontSize",10, "Color", "blue");

txt = "  $\theta_2=" + num2str(round(theta1_2 * 180/pi))+ "^{\circ}$";
text(x_1_1, y_1_1, txt, "Interpreter","latex", "FontSize",10, "Color", "red");

lim = (L_1 + L_2)*1.1;
xlim([-lim lim]);
ylim([-lim lim]);
axis equal;

str = "Inverse Kinematic-Schematic of a Two-Link Robot Arm with End-Effector Position=(" + round(X_E, 2) + ', ' + round(Y_E, 2) + ")";

title (str, "Interpreter","latex", "FontSize", 18);
xlabel ("X", "Interpreter","latex", "FontSize", 18);
ylabel ("Y", "Interpreter","latex", "FontSize", 18);
grid on;



end

