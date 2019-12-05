% step 2 intensity match to m8

template = imread('gray_hist_equalized\m8.png');
temp_intensity = mean(template(:));

names = {'m', 'b', 'h'};
TOTAL = 20;

for i = 1 : 3
    for j = 1 : TOTAL
        filename = ['gray_hist_equalized\' names{i} num2str(j) '.png'];
        disp(filename);
        img = imread(filename);
        img_intensity = mean(img(:));
        coeff = temp_intensity / img_intensity;
        new_image = img * coeff;
        imwrite(new_image, ['phase_stimuli\' names{i} num2str(j) '.png']);
    end
end