clc;clear;
pa = [0 0];
pc = [5 6];
pb_whole = [1 2;3 3;2 5;4 5];
rectangle('Position',[pc(1)-0.2 pc(2)-0.2 0.4 0.4],'Curvature',[1 1],'FaceColor',[0.7 .5 .5]);
axis([0 8 0 8]);
%axis equal;
hold on;
for i = 1:4
    pb = [pb_whole(i,1) pb_whole(i,2)];
    rectangle('Position',[pb(1)-0.1 pb(2)-0.1 0.2 0.2],'Curvature',[1 1],'FaceColor',[0 .5 .5]);
end
t_sample = 0.1;
res = [0 0];
res1 =[0 0];
res2 = [0 0];
pac = -[pa(1)-pc(1);pa(2)-pc(2)];
distpab = sqrt((pa(2)-pb(2))^2+(pa(1)-pb(1))^2);
distpac = sqrt((pa(2)-pc(2))^2+(pa(1)-pc(1))^2);
%options = optimoptions('fmincon','Display','iter','Algorithm','sqp');
i = 0;
while (distpac>=0.09)
    i=i+1;
    fun = @(x)sqrt((x(2)-pc(2))^2+(x(1)-pc(1))^2);
    x01 = res1;
    x02 = res2;
    A = [];
    b = [];
    Aeq = [];
    beq = [];
    if (distpac <= 0.2)
        lb = [];
    else
        lb = [0.01 0.01];
    end
    ub = [1 1];
    nonlcon1 = @(res1)collisioncone1(res1,pa,pb_whole);
    %nonlcon2 = @(res2)collisioncone2(res2,pa,pb_whole);
    res1 = fmincon(fun,x01,A,b,Aeq,beq,lb,ub,nonlcon1);
    %res2 = fmincon(fun,x02,A,b,Aeq,beq,lb,ub,nonlcon2);
    %res1,res2
    res = res1;
    %[c,ceq] = NLConsRev1(x0);
    pa = pa + res;
    pac = -[pa(1)-pc(1);pa(2)-pc(2)];
    %pa
    distpac = sqrt((pa(2)-pc(2))^2+(pa(1)-pc(1))^2);
    %distpac
    %plot(pa(1),pa(2),'or','MarkerSize',10,'MarkerFaceColor','r');
    F(i) = plot(pa(1),pa(2),"ro");
    basefilename = sprintf('snap%d.png',i);
    fullname = fullfile('data/',basefilename);
    %F(i) = getframe();
    saveas(F(i),fullname);
    %size(F.cdata)
    %pause(.1);
%     hold on;
end
%movie(F,1);
%v = VideoWriter('movie1','Archival');
%v.Quality = 95;
%open(v);
%writeVideo(v,F);
%close(v);