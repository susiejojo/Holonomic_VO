function f2 = cf2(x,pc,v,pa)
v_unit = [pc(1)-x(1) pc(2)-x(2)];
v_unit = v_unit/norm(v_unit);
v_des = v*v_unit;
f2 = norm((x-pa)-v_des);
end