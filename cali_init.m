function cali_init()
global cali
    cali.image_height = 160;
    cali.image_width = 160;
    cali.image_lib_size = 10;  % size of image library
    cali.total_face_num = cali.image_lib_size - 1;     % the last for white square, not face
    cali.image_lib = cell(1, cali.image_lib_size);
    cali.multiplier = 1;
    
    for i = 1 : cali.image_lib_size
        cali.image_lib{i} = imread(['images\m' num2str(i) '.png']);
    end

    sca;
    Screen('Preference', 'VisualDebugLevel', 1);
    Screen('Preference', 'SkipSyncTests', 1);

    cali.tex_lib = zeros(1, cali.image_lib_size);
    cali.stimulus_window = Screen('OpenWindow', 0, 0);

    for i = 1 : cali.image_lib_size
        cali.tex_lib(i) = Screen('MakeTexture', cali.stimulus_window, cali.image_lib{i});
    end
    
    cali.tex_map = randi(cali.total_face_num, 16, 9); %[x y], matching the order from grids
    % cali.tex_map = ones(16, 9) * image_lib_size; % for white dots
end