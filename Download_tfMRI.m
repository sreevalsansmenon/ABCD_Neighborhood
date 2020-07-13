clc                                 % Clear command window
clear                               % Clear workspace
addpath /media/DATA/DATA4/ABCD_TASK/nda_aws_token_generator-master/python % NDA accound token generator
load('links.mat')                   % Load mat file containing the links for mri file 
fmriresults01=convertStringsToChars(table2array(fmriresults01)); % Convert the link to character
for i=1:5128                        % Loop over links 
    if mod(i,500)==500              % Reset token after 500 download
        system('python /media/DATA/DATA4/ABCD_TASK/nda_aws_token_generator-master/python/get_token_example.py') % Download new token
    end
    system(['aws s3 cp ' char(fmriresults01(i)) ' /media/DATA/DATA4/ABCD_TASK --profile NDA']) % Download mri data
end
