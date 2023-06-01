close all
clear all

%%
core_num = [1 2 4 8 16];
% timing_ary = [10.869493 6.679220 4.407101 2.941120 2.249317 2.258893]; %8e-3

timing_ary = [188.536445 104.007057 55.980993 32.805915 21.956395]; %4e-3
timing_ary2 = [35.908779 20.968948 11.914338 7.641229 5.347460]; %6e-3


%%
figure(1)
pplot(12,0.8)
loglog(core_num, timing_ary, 'o-'); hold on
loglog(core_num, timing_ary2, 'o-'); hold on
loglog(core_num, 100./core_num, 'k--');

leg = legend(["4e-3","6e-3"]);
title(leg,'Allowed error')


xlabel("Core Number")
ylabel("Run time (s)")