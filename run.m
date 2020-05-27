clc;clear;
agent_pos = [1 0];
v_des = 0.6;
agent_goal = [5 5];
agent_rad = 0.4;
time_sample = 0.1;
iter = 1;
v = [0.01 0.01];
while (norm(agent_pos-agent_goal)>0.1)
    %v = getControls1(pa,v_tar,pc);
    v = getControls1(agent_pos,time_sample,v_des,agent_goal);
    agent_pos = agent_pos+v*time_sample;
    agent_pos
    F(iter) = plot_figs(agent_pos,agent_rad,agent_goal);
    basefilename = sprintf('snap%d.png',iter);
    fullname = fullfile('data/',basefilename);
    saveas(F(iter),fullname);
    clf;
    iter=iter+1;
end