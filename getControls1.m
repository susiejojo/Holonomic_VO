function v = getControls1(agent_pos,time_sample,v_des,agent_goal)
    init = [0.1 0.1];
    A = [];
    b = [];
    Aeq = [];
    beq = [];
    lb = [];
    ub = [];
    v = fmincon(@(x)cost_distance(x*time_sample+agent_pos,agent_goal),init,A,b,Aeq,beq,lb,ub);
    %v = fmincon(@(x)cost_optvelo(x*time_sample+agent_pos,agent_goal,v_des,agent_pos),init,A,b,Aeq,beq,lb,ub);
    if (norm(v)>(v_des*sqrt(2)))
        v = v_des*v/norm(v);
    end
end