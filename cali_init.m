function cali_init(hwin, hgridfunc, pattern, multiplier)
global cali
    cali.grids =            hgridfunc();
    cali.image_height =     160;
    cali.image_width =      160;
    cali.image_lib_size =   10;  % size of image library
    cali.total_face_num =   cali.image_lib_size - 1;     % the last for white square, not face
    cali.image_lib =        cell(1, cali.image_lib_size);
    cali.multiplier =       multiplier;
    
    for i = 1 : cali.image_lib_size
        cali.image_lib{i} = imread(['D:\GitHub\EyeTrackerCalibration\images\m' num2str(i) '.png']);
    end

    cali.tex_lib = zeros(1, cali.image_lib_size);
%     ;
    cali.stimulus_window = hwin;


    for i = 1 : cali.image_lib_size
        cali.tex_lib(i) = Screen('MakeTexture', cali.stimulus_window, cali.image_lib{i});
    end
    switch pattern
        case 'face'
            cali.tex_map = randi(cali.total_face_num, 16, 9); 
            %[x y], matching the order from grids
        case 'dot'
            cali.tex_map = ones(16, 9) * cali.image_lib_size; 
            % for white dots
        otherwise
            disp('pattern not recognized')
    end
    currentdatestr = datestr(now, 30);
    currentdatestr = currentdatestr(3:end);
    grids = cali.grids;
    tex_map = cali.tex_map;
    save(['D:\GitHub\EyeTrackerCalibration\' currentdatestr '.mat'], 'grids', 'tex_map');

end