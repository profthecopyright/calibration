images = dir('color\*.bmp');

for i = 1 : length(images)
    filename = images(i).name;
    [color, map] = imread(['color\' filename]);
    
    if isempty(map)
        bw = rgb2gray(color);
    else
        bw = ind2gray(color, map);
    end
    
    imwrite(bw, ['BW\' filename]);
end