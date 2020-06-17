clc;clear;
agent_pos = [0 0];
vmax = 0.4;
agent_goal = [6 6];
obst_pos = [3 3];
obst_rad = 0.4;
agent_rad = 0.2;
sensor_range = 10;
time_sample = 0.1;
iter = 1;
agent_velo = [0 0];
while (norm(agent_pos-agent_goal)>0.1)
    if (inSensorRange(agent_pos,obst_pos,sensor_range)==false && (dot(obst_pos - agent_pos,agent_velo)<0)) %currently for one obstacle hence simple
        obst_pos = [];
        obst_rad = 0;
    end
    agent_velo = getControls(agent_pos,agent_goal,agent_rad,obst_pos,obst_rad*1.5,vmax,time_sample);
    agent_pos = agent_pos+agent_velo*time_sample;
    agent_pos
    F(iter) = plot_figs(agent_pos,agent_rad,agent_goal,obst_pos,obst_rad);
    basefilename = sprintf('snap%d.png',iter);
    fullname = fullfile('data/',basefilename);
    saveas(F(iter),fullname);
    clf;
    iter=iter+1;
end