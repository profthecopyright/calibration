function cali_run(trial_id)
global cali 

    if trial_id == 0 || trial_id > length(cali.grids)
        return
    end

    grid = cali.grids{trial_id};
    tex_ind = cali.tex_seq{trial_id};
    tex_list = cali.tex_lib(tex_ind);
    
    margin = (1 - cali.multiplier) / 2;
    
    left_top_corners = (grid - 1 + margin + cali.grid_offset) .* ([cali.image_width; cali.image_height] * ones(1, num));
    right_bottom_corners = (grid - margin + cali.grid_offset) .* ([cali.image_width; cali.image_height] * ones(1, num));
    rectangles = [left_top_corners; right_bottom_corners];
    % rotations = zeros(1, num);

    Screen('DrawTextures', cali.stimulus_window, tex_list, [], rectangles);
    Screen('Flip', cali.stimulus_window);
end