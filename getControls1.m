function v = getControls1(pa,v_des,pc)
x0 = [0.1 0.1];
A = [];
b = [];
Aeq = [];
beq = [];
lb = [0.0001 0.0001];
ub = [];
v = fmincon(@(x)cf1(x+pa,pc),x0,A,b,Aeq,beq,lb,ub);
if (norm(v)>v_des)
    v = v_des*v/norm(v);
end
end