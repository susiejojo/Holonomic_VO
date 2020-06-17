function controls = getControls(agent_pos,agent_goal,agent_rad,obst_pos,obst_rad,vmax,time_sample)
    init = [0 0];
    A = [];
    b = [];
    Aeq = [];
    beq = [];
    lb = [-vmax -vmax];
    ub = [vmax vmax];
    %cost = @(v)cost_optvelo(v,agent_goal,vmax,agent_pos);
    cost = @(v)cost_distance(v,agent_pos,agent_goal,time_sample);
    constraints = @(agent_velo)getConstraints(agent_velo,agent_pos,obst_pos,agent_rad,obst_rad,time_sample);
    controls = fmincon(cost,init,A,b,Aeq,beq,lb,ub,constraints);
end