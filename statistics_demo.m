clc
clear
load('demographics.mat')

chi_sqaure_index = [3,6,7,8,9];

% View the numbers
for i=1:size(chi_sqaure_index,2)
    [C,~,ic] = unique(safe_demo(:,chi_sqaure_index(i)));
    value_counts = [C, accumarray(ic,1)]
    [C,ia,ic] = unique(unsafe_demo(1:80,chi_sqaure_index(i)));
    value_counts = [C, accumarray(ic,1)]
    [C,ia,ic] = unique(unsafe_demo(81:end,chi_sqaure_index(i)));
    value_counts = [C, accumarray(ic,1)]
end

% Sex 
[p_sex, Q_sex]= chi2test([62,78; 37,43;25,35])
% Income
[p_income, Q_income]= chi2test([19,66,16,39;12,40,6,22;6,27,12,15])
% Education
[p_education, Q_education]= chi2test([22,25,19,21,53;13,12,10,8,37;7,10,6,15,22])
% Race
[p_race, Q_race]= chi2test([46,41,13,40;27,22,9,21;19,14,7,20])
%Handedness
[p_hand, Q_hand]= chi2test([113,6,21;60,4,16;48,6,6])



% Age
g = [ones(140,1); 2*ones(80,1); 3*ones(60,1)];
x_age = [double(safe_demo(:,2));double(unsafe_demo(1:80,2));double(unsafe_demo(81:end,2))];
[p_age,tbl,stats] = anova1(x_age,g,'off')
%Total Earnings
x_tot_earning = [double(safe_demo(:,10));double(unsafe_demo(1:124,10));double(unsafe_demo(125:end,10))];
[p_tot_earning,tbl,stats] = anova1(x_tot_earning,g,'off')
%Reaction Time Reward
x_reac_reward = [double(safe_demo(:,11));double(unsafe_demo(1:124,11));double(unsafe_demo(125:end,11))];
[p_reac_reward,tbl,stats] = anova1(x_reac_reward,g,'off')
%Reaction Time Loss
x_reac_loss = [double(safe_demo(:,12));double(unsafe_demo(1:124,12));double(unsafe_demo(125:end,12))];
[p_reac_loss,tbl,stats] = anova1(x_reac_loss,g,'off')
%Reaction Time Neutral
x_reac_neutral = [double(safe_demo(:,13));double(unsafe_demo(1:124,13));double(unsafe_demo(125:end,13))];
[p_reac_neutral,tbl,stats] = anova1(x_reac_neutral,g,'off')
% 
% % clc
% % i=[2 11 12 13 10];
% % 
% % for j=1:size(i,2)
% %     mean(double(safe_demo(:,i(j))))
% %     std(double(safe_demo(:,i(j))))
% %     
% %     
% %     mean(double(unsafe_demo(1:80,i(j))))
% %     std(double(unsafe_demo(1:80,i(j))))
% %     
% %     mean(double(unsafe_demo(81:end,i(j))))
% %     std(double(unsafe_demo(81:end,i(j))))
% % end
% % % 
% % 
