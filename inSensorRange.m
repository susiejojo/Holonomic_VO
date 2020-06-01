function range = inSensorRange(agent_pos,obst_pos,sensor_range)
dist_agent_obst = norm(obst_pos-agent_pos);
if (dist_agent_obst^2 < sensor_range^2)
    range = true;
else
    range = false;
end
end