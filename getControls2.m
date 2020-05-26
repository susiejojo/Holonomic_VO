function v = getControls2(pa,v_des,pc)
x0 = [0 0];
A = [];
b = [];
Aeq = [];
beq = [];
lb = [0 0];
ub = [];
v = fmincon(@(x)cf2(x+pa,pc,v_des,pa),x0,A,b,Aeq,beq,lb,ub);
end