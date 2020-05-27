function f = cost_distance(agent_pos,agent_goal)
    f = sqrt((agent_goal(2)-agent_pos(2))^2 + (agent_goal(1)-agent_pos(1))^2);
end