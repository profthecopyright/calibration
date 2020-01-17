images = dir('equalized\*.tif');
N = length(images);

mean_lum = 118;

for i = 1 : N
    filename = images(i).name;
    img = imread(['equalized\' filename]);
    
    [row, col] = size(img);
    pn = pn_song(row, col);
    noise = pn.image;
    
    center = mean(noise(:));
    lower = min(noise(:));
    upper = max(noise(:));
    
    scale_factor = min(mean_lum / (center - lower), (255 - mean_lum) / (upper - center));
    bg = uint8((noise - center) * scale_factor + mean_lum);
    bg(img~=255) = img(img~=255);
    
    % ===================================================
    
    pn = pn_song(1440, 2560);
    noise = pn.image;
    center = mean(noise(:));
    lower = min(noise(:));
    upper = max(noise(:));
    
    scale_factor = min(mean_lum / (center - lower), (255 - mean_lum) / (upper - center));
    big_bg = uint8((noise - center) * scale_factor + mean_lum);
    
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