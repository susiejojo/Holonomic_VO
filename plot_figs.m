function f = plot_figs(x,rad,pc)
axis([0 10 0 10]);
axis equal;
rectangle('Position',[x(1)-rad/2 x(2)-rad/2 rad rad],'Curvature',[1,1]);
hold on;
f = plot(pc(1),pc(2),'rx');
end