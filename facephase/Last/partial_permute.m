function output = partial_permute(nums)
    blocks = length(nums);
    
    checkpoints = [0 cumsum(nums)];
    
    originals = cell(1, blocks);
    
    output = [];
    
    for i = 1 : blocks
        originals{i} = checkpoints(i) + 1 : checkpoints(i + 1);
    end
    
    order = randperm(blocks);
    
    for i = 1 : blocks
        output = [output originals{order(i)}];
    end
end