function cali_init(hwin, hgridfunc, pattern, multiplier, align_mode)
global cali

    rng('shuffle');

    cali.grids =            hgridfunc();
    cali.image_height =     160;
    cali.image_width =      160;
    cali.image_lib_size =   21;  % size of image library
    cali.total_face_num =   cali.image_lib_size - 1;     % the last for white square, not face
    cali.image_lib =        cell(1, cali.image_lib_size);
    cali.multiplier =       multiplier;
    
    switch align_mode
        case 'center'
            cali.grid_offset = [0.5; 0];
        otherwise
            cali.grid_offset = [0; 0];
    end
    
    for i = 1 : cali.image_lib_size
        cali.image_lib{i} = imread(['D:\GitHub\EyeTrackerCalibration\images\m' num2str(i) '.png']);
    end

    cali.tex_lib = zeros(1, cali.image_lib_size);
%     ;
    cali.stimulus_window = hwin;


    for i = 1 : cali.image_lib_size
        cali.tex_lib(i) = Screen('MakeTexture', cali.stimulus_window, cali.image_lib{i});
    end
    
    cali.tex_seq = cell(length(cali.grids), 1);
    
    switch pattern
        
        case 'face'
            for i = 1 : length(cali.grids)
                cali.tex_seq{i} = randi(cali.total_face_num, 1, size(cali.grids{i}, 2));
            end
            
            %cali.tex_map = randi(cali.total_face_num, 16, 9); 
            %[x y], matching the order from grids
        case 'dot'
            for i = 1 : length(cali.grids)
                cali.tex_seq{i} = ones(1, size(cali.grids{i}, 2)) * cali.image_lib_size;
            end
            % cali.tex_map = ones(16, 9) * cali.image_lib_size; 
            % for white dots
        otherwise
            disp('pattern not recognized')
    end
    
    currentdatestr = datestr(now, 30);
    currentdatestr = currentdatestr(3:end);
    grids = cali.grids;
    tex_seq = cali.tex_seq;
    %tex_map = cali.tex_map;
    save(['D:\GitHub\EyeTrackerCalibration\' currentdatestr '.mat'], 'grids', 'tex_seq');

end