% step 1 histogram equalizing
names = {'b'};
TOTAL = 20;

for i = 1
    for j = 1 : TOTAL
        filename = ['500300\' names{i} num2str(j) '.png'];
        disp(filename);
        img = imread(filename);
        hsv = rgb2hsv(img);
        new_intensity = histeq(hsv(:, :, 3));
        hsv(:, :, 3) = new_intensity;
        new_image = hsv2rgb(hsv);
        imwrite(new_image, ['hist_equalized\' names{i} num2str(j) '.png']);
    end
end