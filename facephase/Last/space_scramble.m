height = 288;
width = 480;

for i = 1 : 20
    filename = ['480288\m' num2str(i) '.tif'];
    img = imread(filename);
    
    roi = img(52 + 1 : 52 + 184, 88 + 1 : 88 + 304);
    
    rows = partial_permute([20 * ones(1, 5) 21 * ones(1, 4)]);
    cols = partial_permute([20 * ones(1, 11) 21 * ones(1, 4)]);
    
    roi = roi(rows, :);
    roi = roi(:, cols);
    
    back_ind = find(img == 255);
    
    img(52 + 1 : 52 + 184, 88 + 1 : 88 + 304) = roi;
    img(back_ind) = 255;
    
    newfilename = ['480288\s' num2str(i) '.tif'];
    imwrite(img, newfilename);
end
