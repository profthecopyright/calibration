images = dir('equalized\*.tif');
N = length(images);

beta = -1;

for i = 1 : N
    filename = images(i).name;
    img = imread(['equalized\' filename]);
    
    [row, col] = size(img);
    noise = spatialPattern([row col], beta);
    bg = uint8((noise - min(noise(:))) / (max(noise(:)) - min(noise(:))) * 255); 
    bg(img~=255) = img(img~=255);
    
    noise = spatialPattern([1440 2560], beta);
    big_bg = uint8((noise - min(noise(:))) / (max(noise(:)) - min(noise(:))) * 255); 
    
    for r = 1 : row
        for c = 1 : col
            if img(r, c) ~= 255
                big_bg(540 + r, 980 + c) = img(r, c);
            end
        end
    end
    
    imwrite(bg, ['pink' num2str(-beta) '\' filename]);
    imwrite(big_bg, ['pink' num2str(-beta) '_fullscreen\' filename]);
end