function grids = generate_center80_sequence()
    
    TOTAL = 80;
    grids = cell(TOTAL, 1);

    corners = [1 2 6 7 8 14 36 42 43 44 48 49];
    seq = setdiff(1:49, corners);
    seq_1 = seq(randperm(37));
    seq_2 = seq(randperm(37));
    seq_full = [25 seq_1 18 26 32 24 seq_2 25];
    
    for k = 1 : TOTAL
        [row, col] = ind2sub([7 7], seq_full(k));   % nominal
        grids{k} = [col + 4; row + 1];
    end
end