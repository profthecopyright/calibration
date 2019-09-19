global cali

    %% run independently from the experimental computer
    sca;
    Screen('Preference', 'VisualDebugLevel', 1);
    Screen('Preference', 'SkipSyncTests', 1);
    cali.stimulus_window = Screen('OpenWindow', 0, 0);
    
%%  
cali_init(cali.stimulus_window, @generate_half_sequence, 'dot', 0.5); 
% cali_init(cali.stimulus_window, @partition_small, 'face', 1);
% cali_init(cali.stimulus_window, @partition_large, 'face', 1);   
% cali_init(cali.stimulus_window, @generate_half_sequence, 'face', 1); 
% cali_init(cali.stimulus_window, @partition_small, 'face', 0.5);
cali_init(cali.stimulus_window, @generate_half_sequence, 'dot', 0.5); 

% cali.grids = partition_small(); % 7-by-7 simulateneous, 20
% cali.grids = partition_large(); % 9-by-16 simultaneous, 20
% cali.grids = generate_half_sequence(); % 5-by-16 sequence, 80 (odd rows)

for trial_id = 0 : length(cali.grids) 
    cali_run(trial_id);

    KbStrokeWait;
end
sca;