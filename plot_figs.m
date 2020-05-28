function f = plot_figs(agent_pos,agent_rad,agent_goal)
    axis([0 10 0 10]);
    axis equal;
    rectangle('Position',[agent_pos(1)-agent_rad/2 agent_pos(2)-agent_rad/2 agent_rad agent_rad],'Curvature',[1,1]);
    hold on;
    f = plot(agent_goal(1),agent_goal(2),'rx');
end