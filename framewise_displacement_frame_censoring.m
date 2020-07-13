clc                         % Clear Command Window
clear                       % Clear workspace
cd('/media/DATA/DATA4/ABCD_TASK_ALL/'); % Folder path for MRI data
subjects = dir('sub-*');    % Read subject folder names
parfor sub=1:size(subjects,1) % Loop through subjects
    % Change directory to functional data of subjects
    cd([subjects(sub).folder filesep subjects(sub).name filesep '/ses-baselineYear1Arm1/func' filesep]);
    func_images = dir('*bold.nii*'); % Find MID task images
    mkdir('motion_estimates') % Make directory to save censoring information
    for fun_img = 1:size(func_images,1) % Loop through functional images
        event_timing = [extractBefore(func_images(fun_img).name,'_bold') '_events.tsv']; % Find event timng
        system(['/media/DATA/DATA3/ABCD_Task/BIDSto3col.sh ' event_timing ' '...
            extractBefore(event_timing,'.tsv')]); % Convert event timing to 3 column FSL format
        dummy_time = timing_read([extractBefore(event_timing,'.tsv') '_dummy.txt']); % Find dummy scans
        delete_vol = dummy_time(2)/0.8; % Find dummy volumes
        timing_files = dir([extractBefore(event_timing,'.tsv') '*.txt']); % Load timing files to correct for deleted volumes
        for timgs = 1:size(timing_files,1) % Loop throgh timing files
            timings_ev = timing_read([timing_files(timgs).folder filesep timing_files(timgs).name]); % Read timing file
            timings_ev(:,1) = timings_ev(:,1) - dummy_time(2); % Remove dummy volume time
            dlmwrite([timing_files(timgs).folder filesep timing_files(timgs).name],timings_ev,'Delimiter',' ') % Save event timing
        end
        
        if isfile([func_images(fun_img).folder filesep func_images(fun_img).name '_vol_removed.nii.gz'])==0 % verify that volume is not removed earlier
            [~, vols]=system(['fslnvols ' func_images(fun_img).folder filesep func_images(fun_img).name]); % remove dummy volumes
            system(['/usr/local/fsl/bin/fslroi ' func_images(fun_img).folder filesep func_images(fun_img).name ' '...
                func_images(fun_img).folder filesep func_images(fun_img).name '_vol_removed ' num2str(delete_vol) ' ' num2str(str2num(vols)-delete_vol)]);
        end
        % Next loop perform fsl_motion_outlier script and saves frames to
        % be censored
        if isfile([func_images(fun_img).folder filesep 'motion_estimates/' extractBefore(func_images(fun_img).name,'.nii') ...
                '_confound.txt'])==0
            system(['/usr/local/fsl/bin/fsl_motion_outliers -i ' func_images(fun_img).folder filesep ...
                extractBefore(func_images(fun_img).name,'.nii') '_vol_removed'  ...
                ' -o ' func_images(fun_img).folder filesep 'motion_estimates/' extractBefore(func_images(fun_img).name,'.nii') ...
                '_confound.txt --fd --thresh=0.9']);
            if isfile([func_images(fun_img).folder filesep 'motion_estimates/' extractBefore(func_images(fun_img).name,'.nii') ...
                    '_confound.txt'])==0
                system(['touch ' func_images(fun_img).folder filesep 'motion_estimates/' extractBefore(func_images(fun_img).name,'.nii') ...
                    '_confound.txt']);
            end
        end
    end
end
