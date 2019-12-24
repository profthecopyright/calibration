images = dir('color\*.bmp');

for i = 1 : length(images)
    filename = images(i).name;
    [color, map] = imread(['color\' filename]);
    
    bw = rgb2gray(color);

    imwrite(bw, ['BW\' filename(1:end-4) '.tif']);
end