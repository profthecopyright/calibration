function grids = partition_small()
    grids = cell(20, 1);
    
    nominal_patterns = cell(10, 1);
    nominal_patterns{1} = [1 4; 4 1; 4 4; 4 7; 7 4]';
    nominal_patterns{2} = [2 2; 2 6; 6 2; 6 6]';
    nominal_patterns{3} = [1 3; 1 5; 7 3; 7 5]';
    nominal_patterns{4} = [3 1; 3 3; 3 5; 3 7]';
    nominal_patterns{5} = [5 1; 5 3; 5 5; 5 7]';
    nominal_patterns{6} = [3 2; 3 4; 3 6]';
    nominal_patterns{7} = [5 2; 5 4; 5 6]';
    nominal_patterns{8} = [2 3; 4 6; 6 4]';
    nominal_patterns{9} = [2 4; 4 3; 4 5; 6 5]';
    nominal_patterns{10} = [2 5; 4 2; 6 3]';

    inds = randperm(10);
    
    for k = 1 : 10
        grids{k} = nominal_patterns{inds(k)}([2 1], :) + [4; 1];
        grids{10 + k} = nominal_patterns{inds(k)} + [4; 1];
    end
end