images = dir('equalized\*.tif');
N = length(images);

for i = 1 : N
    filename = images(i).name;
    img = imread(['equalized\' filename]);
    
    pn = pn_song(1440, 2560);
    noise = pn.image;
    big_bg = uint8((noise - min(noise(:))) / (max(noise(:)) - min(noise(:))) * 255); 
    
    img = imresize(img, 0.8);
    img = repmat(img, 5, 5);
    
    [row, col] = size(img);
    
    for r = 1 : row
        for c = 1 : col
            if img(r, c) ~= 255
                big_bg(r, 80 + c) = img(r, c);
            end
        end
    end
    
    imwrite(big_bg, ['pink_song_pattern\' filename]);
end