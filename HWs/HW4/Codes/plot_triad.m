function plot_triad(s_hat, q , h , theta)

figure;
axs = axes;
view(3);
R_i = eye(3);


T_i=[R_i,[0; 0; 0];[0 0 0 1]];
triad('Parent',axs, 'matrix',T_i, 'scale',1, 'linewidth',1, 'Tag','Triad Example');
grid on;
hold on;


s_hat = s_hat/norm(s_hat);

ox = [q(1) q(1) + s_hat(1)];
oy = [q(2) q(2) + s_hat(2)];
oz = [q(3) q(3) + s_hat(3)];
p1 = plot3(ox, oy, oz, 'color', 'black', 'LineWidth',2, 'DisplayName', '\omega');

S = screw_interpretation(s_hat, q , h);
T = Transformation(S,theta)
triad('matrix',T,'scale',1,'linewidth',1.5,'linestyle','--');
axis equal;
hold off;

end
