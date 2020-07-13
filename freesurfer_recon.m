clc                     % Clear command window
clear                   % Clear workspace
load('Subjects.mat')    % Load subject name starts with NDAR**
parfor i=1:size(subjects,2) % Loop through subjects
    % Next few lines are path for anatomical image and file name for brain
    % extracted image
    tp1 = ['/media/DATA/DATA3/ABCD_Task/' char(data(i,1)) '/ses-baselineYear1Arm1/anat/' char(data(i,1)) '_ses-baselineYear1Arm1_run-01_T1w.nii'];
    tp11 = ['/media/DATA/DATA3/ABCD_Task/' char(data(i,1)) '/ses-baselineYear1Arm1/anat/'];
    tp13 = ['/media/DATA/DATA3/ABCD_Task/' char(data(i,1)) '/ses-baselineYear1Arm1/anat/' char(data(i,1)) '_ses-baselineYear1Arm1_run-01_T1w_brain.nii.gz'];
    tp2 = ['/media/DATA/DATA4/ABCD_TASK_ALL/' char(data(i,1)) '/ses-baselineYear1Arm1/anat/' char(data(i,1)) '_ses-baselineYear1Arm1_run-01_T1w.nii'];
    tp22 = ['/media/DATA/DATA4/ABCD_TASK_ALL/' char(data(i,1)) '/ses-baselineYear1Arm1/anat/'];
    tp23 = ['/media/DATA/DATA4/ABCD_TASK_ALL/' char(data(i,1)) '/ses-baselineYear1Arm1/anat/' char(data(i,1)) '_ses-baselineYear1Arm1_run-01_T1w_brain.nii.gz'];
    if isfile(tp1)==1 % Verifying folder of image
        % Perform brain extraction using Freesurfer
        system(['recon-all -autorecon1 -i ' tp1 ' -subjid autorecon -sd ' tp11]);
        system(['mri_convert ' tp11 '/autorecon/mri/brainmask.mgz --reslice_like ' tp1 ' ' tp11 '/temp.nii']);
        system(['rm -rf ' tp11 '/autorecon/']);
        system(['gzip ' tp11 '/temp.nii']);
        system(['mv ' tp11 '/temp.nii.gz ' tp13]);
    else
        % Perform brain extraction using Freesurfer
        system(['recon-all -autorecon1 -i ' tp2 ' -subjid autorecon -sd ' tp22]);
        system(['mri_convert ' tp22 '/autorecon/mri/brainmask.mgz --reslice_like ' tp2 ' ' tp22 '/temp.nii']);
        system(['rm -rf ' tp22 '/autorecon/']);
        system(['gzip ' tp22 '/temp.nii']);
        system(['mv ' tp22 '/temp.nii.gz ' tp23]);
    end
end