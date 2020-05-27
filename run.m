clc;clear;
agent_pos = [0 0];
vmax = 0.2;
agent_goal = [8 4];
agent_rad = 0.3;
time_sample = 0.4;
iter = 1;
agent_velo = [0 0];
while (norm(agent_pos-agent_goal)>0.1)
    agent_velo = getControls(agent_pos,agent_goal,vmax,time_sample);
    agent_pos = agent_pos+agent_velo*time_sample;
    agent_pos
    F(iter) = plot_figs(agent_pos,agent_rad,agent_goal);
    basefilename = sprintf('snap%d.png',iter);
    fullname = fullfile('data/',basefilename);
    saveas(F(iter),fullname);
    clf;
    iter=iter+1;
end