% step 2 intensity match to m8

template = imread('hist_equalized\m8.png');
temp_hsv = rgb2hsv(template);
value = temp_hsv(:, :, 3);
temp_intensity = mean(value(:));

names = {'b'};
TOTAL = 20;

for i = 1
    for j = 1 : TOTAL
        filename = ['hist_equalized\' names{i} num2str(j) '.png'];
        disp(filename);
        img = imread(filename);
        hsv = rgb2hsv(img);
        img_value = hsv(:, :, 3);
        img_intensity = mean(img_value(:));
        coeff = temp_intensity / img_intensity;
        new_intensity = img_value * coeff;
        hsv(:, :, 3) = new_intensity;
        new_image = hsv2rgb(hsv);
        imwrite(new_image, ['phase_stimuli\' names{i} num2str(j) '.png']);
    end
end