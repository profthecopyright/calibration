function grids = generate_center78_sequence()
    
    TOTAL = 78;
    grids = cell(TOTAL, 1);

    corners = [1 2 8 9 10 18 73 81 82 83 89 90];
    seq = setdiff(1:90, corners);
    seq = seq(randperm(TOTAL));
    
    for k = 1 : TOTAL
        [row, col] = ind2sub([9 10], seq(k));   % nominal
        grids{k} = [col + 3; row];
    end
end