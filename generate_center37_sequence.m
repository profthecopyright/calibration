function grids = generate_center37_sequence()
    
    TOTAL = 37;
    grids = cell(TOTAL, 1);

    corners = [1 2 6 7 8 14 36 42 43 44 48 49];
    seq = setdiff(1:49, corners);
    seq = seq(randperm(TOTAL));
    
    for k = 1 : TOTAL
        [row, col] = ind2sub([7 7], seq(k));   % nominal
        grids{k} = [col + 4; row + 1];
    end
end