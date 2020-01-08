images = dir('BW\*.tif');
N = length(images);

group_avg = [58343 79269 140830 65880 66428];
scales = sqrt(81000 ./ group_avg);

height = 360;
width = 600;

for i = 1 : N
    group = floor((i - 1) / 20) + 1;
    filename = images(i).name;
    img = imread(['BW\' filename]);
    scaled_img = imresize(img, scales(group));
    [row, col] = size(scaled_img);
    
    row_start = floor((height - row) / 2);
    col_start = floor((width - col) / 2);
    
    big_img = ones(360, 600, 'uint8') * 255;
    
    big_img(row_start + 1 : row_start + row,...
    col_start + 1 : col_start + col) = scaled_img;
    
    imwrite(big_img, ['BW_resized\' filename(1:end-4) '.tif']);
end