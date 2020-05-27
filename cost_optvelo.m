function f2 = cost_optvelo(x,agent_goal,v,agent_pos)
    v_unit = [agent_goal(1)-x(1) agent_goal(2)-x(2)];
    v_unit = v_unit/norm(v_unit);
    v_des = v*v_unit;
    f2 = norm((x-agent_pos)-v_des);
end