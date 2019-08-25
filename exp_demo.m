global image_lib

% ====================== INITIALIZE ================================

h = 160;
w = 160;
total = 4;  % size of image library

load_images(total);

sca;
Screen('Preference', 'VisualDebugLevel', 1);
Screen('Preference', 'SkipSyncTests', 1);

tex_lib = zeros(1, total);
win = Screen('OpenWindow', 0, 0);

for i = 1 : total
    tex_lib(i) = Screen('MakeTexture', win, image_lib{i});
end

volume = total - 1;     % the last for white square, not face


% ====================== PRESENT STIMULI =========================

grids = partition_small(); % 7-by-7 simulateneous, 20
%grids = partition_large(); % 9-by-16 simultaneous, 20
%grids = generate_half_sequence(); % 5-by-16 sequence, 80 (odd rows)

tex_map = randi(volume, 16, 9); %[x y], matching the order from grids
%tex_map = ones(16, 9) * total; % for white dots


for i = 1 : length(grids)
    grid = grids{i};
    num = size(grid, 2);
    
    if num == 1
        ind = tex_map(grid(1), grid(2)); % [x y]
        tex_list = tex_lib(ind);
    else
        tex_list = zeros(1, num);

        for j = 1 : num
            ind = tex_map(grid(1, j), grid(2, j)); % [x y]
            tex_list(j) = tex_lib(ind);
        end
    end
    
    %tex_list = tex_lib(floor(rand(1, num) * volume) + 1);
    %grids = [8 8];
    %num = size(grids, 2);
    left_top_corners = (grid - 1) .* ([w; h] * ones(1, num));
    right_bottom_corners = grid .* ([w; h] * ones(1, num));
    rectangles = [left_top_corners; right_bottom_corners];
    rotations = zeros(1, num);

    Screen('DrawTextures', win, tex_list, [], rectangles);
    Screen('Flip', win);

    KbStrokeWait;

end
sca;