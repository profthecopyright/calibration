images = dir('BW_resized\*.tif');
N = length(images);
pixel_counts = zeros(N, 1);

for i = 1 : N
    filename = images(i).name;
    img = imread(['BW_resized\' filename]);
    
    pixel_counts(i) = sum(sum(img ~= 255));

    %imwrite(bw, ['BW\' filename(1:end-4) '.tif']);
end