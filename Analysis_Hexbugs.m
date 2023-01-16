N = length(x);
fps = 50;
space_calibration = 2.5/mean(r);
xc = x*space_calibration;
yc = y*space_calibration;
dt = 1/fps;
t = (1:(N-1))*dt;
figure(1)
loglog(t, MSD_2D(smooth(xc,15), smooth(yc,15)), 'k.')
hold on
loglog(linspace(0.05,0.2), (15*(linspace(0.05,0.2))).^2, 'k-',...
    'LineWidth', 2)
loglog(linspace(5,60), (10*(linspace(5,60))), 'k-',...
    'LineWidth', 2)

xlabel('$t$ (s)', 'interpreter', 'latex', 'FontSize',24);
ylabel('MSD $($cm$)^2$', 'interpreter', 'latex', 'FontSize',24);
v_x= (circshift(xc, -1) - xc)/dt;
v_x(N) = [];
v_y= (circshift(yc, -1) - yc)/dt;
v_y(N) = [];
v = sqrt(v_x.^2 + v_y.^2);
figure(2)
plot(t, filloutliers(v, 'linear'))
xlabel('$t$ (s)', 'interpreter', 'latex', 'FontSize',24);
ylabel('$v$ (cm/s)', 'interpreter', 'latex', 'FontSize',24);
figure(3)
histogram(filloutliers(v, 'linear'),30, 'Normalization','pdf')
xlabel('$v$ (cm/s)', 'interpreter', 'latex', 'FontSize',24);
ylabel('PDF', 'interpreter', 'latex', 'FontSize',24);
