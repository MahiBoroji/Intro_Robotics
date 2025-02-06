function [J] = J_2R(theta1, theta2)
%% Defining Robot Specs.
L1 = 0.3; % length of first link
L2 = 0.3; % length of second link

x0 = 0; % origin of the coordinate
y0 = 0; % origin of the coordinate


%% Computing Jacobian Matrix

 J = [-L1*sin(theta1)-L2*sin(theta1+theta2) -L2*sin(theta1+theta2); 
       L1*cos(theta1)+L2*cos(theta1+theta2)  L2*cos(theta1+theta2)]; %Computing Jacobian

%% Calculating Link1, End-Effector Position using Link Angles.
x1 = L1 * cos(theta1); % x position of link 1 
y1 = L1 * sin(theta1); % y position of link 1

X_E = x1 + L2 * cos(theta1 + theta2); % x position of end-effector
Y_E = y1 + L2 * sin(theta1 + theta2); % y position of end-effector


%% Plot Configuration Schematic.
% 
% figure;
% 
% h1 = plot ([0 x1], [0 y1], '-bo', "linewidth", 2); % plot link 1 schematic
% h1.DisplayName = "Robot Link 1";
% 
% hold on;
% 
% h2 = plot([x1 X_E], [y1 Y_E],'-ro', "linewidth", 2); %plot link 2 schematic
% h2.DisplayName = "Robot Link 2";
% 
% text(X_E,Y_E,[' (', num2str(round(X_E, 2)), ', ', num2str(round(Y_E, 2)), ')']); % text end-effector position
% 
% hold on;
% yline(y0, '--', 'HandleVisibility','off'); % coordinate origin line
% xline(x0, '--', 'HandleVisibility','off'); % coordinate origin line
% 
% txt = "  $\theta_1=" + num2str(round(theta1 * 180/pi))+ "^{\circ}$";
% text(x0, y0, txt, "Interpreter","latex", "FontSize",10, "Color", "blue"); % text theta_1
% 
% txt = "  $\theta_2=" + num2str(round(theta2 * 180/pi))+ "^{\circ}$";
% text(x1, y1, txt, "Interpreter","latex", "FontSize",10, "Color", "red"); % text theta_2
% 
% lim = (L1 + L2)*1.1; % define plot limit
% xlim([-lim lim]);
% ylim([-lim lim]);
% 
% 
% str = "Robot, Velocity Manipulability Ellipse, and Force Manipulability Ellipse at $\theta=("+num2str(round(theta1*180/pi, 1))+"^{\circ}, "+num2str(round(theta2*180/pi, 1))+"^{\circ})$";
% 
% title (str, "Interpreter","latex", "FontSize", 16); % title
% xlabel ("X", "Interpreter","latex", "FontSize", 18);
% ylabel ("Y", "Interpreter","latex", "FontSize", 18);
% grid on;
% 
% 
% %% Velocity Ellipse
% hold on;
% 
% 
% A = J*J.';
% scale = 25 * max(eig(A));
% velocity = @(Vx, Vy) (transpose([Vx; Vy] - [X_E; Y_E]) / A) * ([Vx; Vy] - [X_E; Y_E]) - 1/scale; %Computing Velocity in terms of Vx, Vy, using 1/5 as a scale for velocity.
% fp1 = fimplicit (velocity); % plot velocity ellipse
% fp1.Color = "#EDB120" ;
% fp1.LineWidth = 1.5;
% fp1.DisplayName = 'Velocity Manipulability Ellipse';
% 
% hold on;
% 
% %% Force Ellipse
% hold on;
% 
% A = J*J.'; % defining J*J'
% scale = 25 * max(eig(A\eye(2)));
% force = @(F1, F2) transpose([F1; F2] - [X_E; Y_E])* A *([F1; F2] - [X_E; Y_E]) - 1/scale; %Computing Force in terms of 
% 
% fp2 = fimplicit (force);
% fp2.Color = "#D95319";
% fp2.LineWidth = 1.5;
% fp2.DisplayName = "Force Manipulability Ellipse";
% hold off;
% axis equal; 
% legend('Interpreter', 'Latex');
end

