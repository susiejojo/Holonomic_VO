clc;clear;
pa = [0 0];
v_tar = 0.1;
pc = [2 7];
rad = 0.4;
i = 1;
v = [0.01 0.01];
while (norm(pa-pc)>0.1)
    %v = getControls1(pa,v_tar,pc);
    v = getControls2(pa,v_tar,pc);
    pa = pa+v;
    pa
    F(i) = plot_figs(pa,rad,pc);
    basefilename = sprintf('snap%d.png',i);
    fullname = fullfile('data/',basefilename);
    saveas(F(i),fullname);
    clf;
    i=i+1;
end