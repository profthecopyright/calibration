function grids = generate_half_sequence()
    % odd rows, all columns
    grids = cell(80, 1);
    seq = randperm(80);
    
    for k = 1 : 80
        [row, col] = ind2sub([5 16], seq(k));   % nominal
        grids{k} = [col; 2 * row - 1];
    end
end