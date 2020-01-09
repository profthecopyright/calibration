images = dir('equalized\*.tif');
N = length(images);

for i = 1 : N
    filename = images(i).name;
    img = imread(['equalized\' filename]);
    
    img(img == 255) = 128;
    imwrite(img, ['half\' filename]);
end