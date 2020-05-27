function controls = getControls(agent_pos,agent_goal,vmax,time_sample)
    init = [0 0];
    A = [];
    b = [];
    Aeq = [];
    beq = [];
    lb = [-vmax -vmax];
    ub = [vmax vmax];
    cost = @(v)cost_optvelo(v,agent_goal,vmax,agent_pos);
    controls = fmincon(cost,init,A,b,Aeq,beq,lb,ub);
%     cost = @(v)cost_distance(v,agent_pos,agent_goal,time_sample);
%     controls = fmincon(cost,init,A,b,Aeq,beq,lb,ub);
end