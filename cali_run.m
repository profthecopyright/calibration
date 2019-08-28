function cali_run()
global cali trial_id

    if trial_id == 0
        return
    end

    grid = cali.grids{trial_id};
    num = size(grid, 2);
    
    if num == 1
        ind = cali.tex_map(grid(1), grid(2)); % [x y]
        tex_list = cali.tex_lib(ind);
    else
        tex_list = zeros(1, num);

        for j = 1 : num
            ind = cali.tex_map(grid(1, j), grid(2, j)); % [x y]
            tex_list(j) = cali.tex_lib(ind);
        end
    end
    
    margin = (1 - cali.multiplier) / 2;
    
    left_top_corners = (grid - 1 + margin) .* ([cali.image_width; cali.image_height] * ones(1, num));
    right_bottom_corners = (grid - margin) .* ([cali.image_width; cali.image_height] * ones(1, num));
    rectangles = [left_top_corners; right_bottom_corners];
    % rotations = zeros(1, num);

    Screen('DrawTextures', cali.stimulus_window, tex_list, [], rectangles);
    Screen('Flip', cali.stimulus_window);
end