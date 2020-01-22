images = dir('480288_equalized\*.tif');
N = length(images);

for i = 1 : N
    filename = images(i).name;
    img = imread(['480288_equalized\' filename]);
    
    big_bg = pn_song_withmean(1440, 2560, 113);
    
    pattern1 = repmat(img, 1, 5);
    pattern1 = [ones(288, 80) * 255 pattern1 ones(288, 80) * 255];
    pattern2 = repmat(img, 1, 6);
    pattern2 = pattern2(:, 161 : 160 + 2560);
    
    img = [pattern1; pattern2; pattern1; pattern2; pattern1];
    
    [row, col] = size(img);
    
    for r = 1 : row
        for c = 1 : col
            if img(r, c) ~= 255
                big_bg(r, c) = img(r, c);
            end
        end
    end
    
    imwrite(big_bg, ['shifthalf\' filename]);
end