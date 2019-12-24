images = dir('color\*.bmp');

for i = 1 : length(images)
    filename = images(i).name;
    color = imread(['color\' filename]);
    bw = rgb2gray(color);
    imwrite(bw, ['BW\' filename]);
end