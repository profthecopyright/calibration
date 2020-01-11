images = dir('equalized\*.tif');
N = length(images);

beta = -2;

for i = 1 : N
    filename = images(i).name;
    img = imread(['equalized\' filename]);
    
    [row, col] = size(img);
    pn = pn_song(row, col);
    noise = pn.image;
    %histogram(noise(:), 'normalization', 'probability');
    bg = uint8((noise - min(noise(:))) / (max(noise(:)) - min(noise(:))) * 255); 
    bg(img~=255) = img(img~=255);
    
    pn = pn_song(1440, 2560);
    noise = pn.image;
    big_bg = uint8((noise - min(noise(:))) / (max(noise(:)) - min(noise(:))) * 255); 
    
    for r = 1 : row
        for c = 1 : col
            if img(r, c) ~= 255
                big_bg(540 + r, 980 + c) = img(r, c);
            end
        end
    end
    
    imwrite(bg, ['pink_song\' filename]);
    imwrite(big_bg, ['pink_song_fullscreen\' filename]);
end