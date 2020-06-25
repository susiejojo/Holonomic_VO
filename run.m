clc;clear;
agent_pos = [0 0];
vmax = 0.6;
agent_goal = [6 6];
obst_pos = zeros(2,2);
obst_pos(1,:) = [3 3];
obst_pos(2,:) = [4 6];
obst_pos(3,:) = [5 5];
obst_rad = 0.2;
agent_rad = 0.1;
sensor_range = 3;
time_sample = 0.1;
iter = 1;
agent_velo = [0 0];
agent_pos_list = [];
while (norm(agent_pos-agent_goal)>0.1)
    sensedObstacles = [];
    for i = 1:3
        if (inSensorRange(agent_pos,obst_pos(i,:),sensor_range) && dot((obst_pos(i,:)-agent_pos),agent_velo)>=0)
            sensedObstacles= [sensedObstacles;obst_pos(i,:)];
        end
    end
    %sensedObstacles
    agent_velo = getControls(agent_pos,agent_goal,agent_rad,sensedObstacles,obst_rad*1.5,vmax,time_sample); 
    agent_pos = agent_pos+agent_velo*time_sample;
    agent_pos_list = [agent_pos_list;agent_pos];
    %plot(agent_pos(1),agent_pos(2),'b.');
    %hold on;
    F(iter) = plot_figs(agent_pos,agent_rad,agent_goal,obst_pos,obst_rad);
    basefilename = sprintf('snap%d.png',iter);
    fullname = fullfile('data/',basefilename);
    saveas(F(iter),fullname);
    clf;
    hold on;
    plot(agent_pos_list(:,1),agent_pos_list(:,2),'b*');
    iter=iter+1;
end