% to 500 * 300
TOTAL = 20;

for j = 1 : TOTAL
    filename = ['cut_160\b' num2str(j) '.png'];
    disp(filename);
    img = imread(filename);
    center = img(33:128, :, :);
    imshow(center)
    new_image = imresize(center, [300 500], 'bicubic');
    imwrite(new_image, ['500300\b' num2str(j) '.png']);
end
