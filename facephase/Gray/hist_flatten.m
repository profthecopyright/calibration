% step 1 histogram equalizing
names = {'m', 'h'};
TOTAL = 20;

for i = 1 : 2
    for j = 1 : TOTAL
        filename = ['original\' names{i} num2str(j) '.bmp'];
        disp(filename);
        img = imread(filename);
        gray = rgb2gray(img);
        gray = histeq(gray);
        imwrite(gray, ['gray_hist_equalized\' names{i} num2str(j) '.png']);
    end
end