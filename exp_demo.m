global cali trial_id
cali_init();

cali.grids = partition_small(); % 7-by-7 simulateneous, 20
%cali.grids = partition_large(); % 9-by-16 simultaneous, 20
cali.grids = generate_half_sequence(); % 5-by-16 sequence, 80 (odd rows)

cali.multiplier = 0.25;

for trial_id = 0 : length(cali.grids)
    cali_run();

    KbStrokeWait;
end
sca;