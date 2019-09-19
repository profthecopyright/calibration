function grids = generate_full_sequence()
    % all rows, all columns
    grids = cell(144, 1);
    seq = randperm(144);
    
    for k = 1 : 144
        [row, col] = ind2sub([9 16], seq(k));
        grids{k} = [col; row];
    end
end