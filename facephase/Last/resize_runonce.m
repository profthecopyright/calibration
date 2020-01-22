images = dir('600360\*.tif');
N = length(images);

for i = 1 : N
    filename = images(i).name;
    img = imread(['600360\' filename]);
    
    new_img = imresize(img, 0.8);

    imwrite(new_img, ['480288\' filename(1:end-4) '.tif']);
end
