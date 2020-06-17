function f = plot_figs(agent_pos,agent_rad,agent_goal,obst_pos,obst_rad)
    axis([0 10 0 10]);
    axis equal;
    rectangle('Position',[agent_pos(1)-agent_rad agent_pos(2)-agent_rad agent_rad*2 agent_rad*2],'Curvature',[1,1]);
    hold on;
    rectangle('Position',[obst_pos(1)-obst_rad obst_pos(2)-obst_rad obst_rad*2 obst_rad*2],'Curvature',[1,1]);
    f = plot(agent_goal(1),agent_goal(2),'rx');
end