function plot_triad(R, omg)

figure;
axs = axes;
view(3);
R_s = eye(3);
ox = [0 omg(1)];
oy = [0 omg(2)];
oz = [0 omg(3)];

T_s=[R_s,[0 0 0].';[0 0 0 1]];
triad('Parent',axs, 'matrix',T_s, 'scale',1, 'linewidth',1, 'Tag','Triad Example');
grid on;
hold on;

p1 = plot3(ox, oy, oz, 'color', 'black', 'LineWidth',2, 'DisplayName', '\omega');

%legend(p1)

T_b=[R,[0 0 0].';[0 0 0 1]];
triad('matrix',T_b,'scale',1,'linewidth',1.5,'linestyle','--');
axis equal
hold off;

end