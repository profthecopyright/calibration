function grids = partition_large()
    grids = cell(20, 1);
    rows = [5 4];
    cols = [8 8];
    odd_row_seg = [0 7 8 8 8 9];
    even_row_seg = [0 6 6 6 7 7];

    cutpoints = [cumsum(odd_row_seg); cumsum(even_row_seg)];
    
    for i = 1 : 2   % nominal row
        for j = 1 : 2   % nominal col
            sequence = randperm(rows(i) * cols(j));
            
            for seg = 1 : 5                
                ind_seq = sequence(cutpoints(i, seg) + 1: cutpoints(i, seg + 1));
                
                linear_ind = ((i - 1) * 2 + (j - 1)) * 5 + seg;
                grids{linear_ind} = zeros(2, length(ind_seq));
                
                for k = 1 : length(ind_seq)
                    [row, col] = ind2sub([rows(i), cols(j)], ind_seq(k));   % nominal
                    grids{linear_ind}(:, k) = [2 * (col - 1) + j; 2 * (row - 1) + i];    % [x; y]
                end       
            end
        end
    end
end