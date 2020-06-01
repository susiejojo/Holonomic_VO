function [vo,ceq] = getConstraints(agent_velo,agent_pos,obst_pos,agent_rad,obst_rad)
dist_agent_obst = norm(obst_pos-agent_pos);
bigrad = obst_rad + agent_rad;
if ((dist_agent_obst)< bigrad)
    dist_agent_obst = bigrad;
end
slope_agent_obst = atan((obst_pos(2)-agent_pos(2))/(obst_pos(1)-agent_pos(1)));
cone_angle_centre=asin((agent_rad+obst_rad)/dist_agent_obst);
cone_angle_left = slope_agent_obst + cone_angle_centre;
cone_angle_right = slope_agent_obst - cone_angle_centre;
%left_tangent_eqn = tan(cone_angle_left)*(x-agent_pos(1))+agent_pos(2);
%right_tangent_eqn = tan(cone_angle_right)*(x-agent_pos(1))+agent_pos(2);
%line_agent_obst = tan(slope_agent_obst)*(x-agent_pos(1))+agent_pos(2);
agent_new_pos = agent_pos + agent_velo;
c1 =  agent_new_pos(2) - (tan(cone_angle_left)*(agent_new_pos(1)-agent_pos(1))+agent_pos(2));
c2 =  agent_new_pos(2) - (tan(cone_angle_right)*(agent_new_pos(1)-agent_pos(1))+agent_pos(2));
vo =-c1*c2; %c1 and c2 should have the same sign if agent_new_pos lies outside the cone
ceq = [];
end