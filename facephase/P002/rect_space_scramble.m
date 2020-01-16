images = dir('equalized\*.tif');
N = length(images);

for i = 1 : N
    filename = images(i).name;
    img = imread(['equalized\' filename]);
    
%     fore_ind = find(img~=255);
    fore_ind = length(img(:));
%     new_ind = fore_ind(randperm(length(fore_ind)));

    new_ind = randperm(fore_ind);
%     img(fore_ind) = img(new_ind);

    new_img = img;
    new_img(:) = img(new_ind);
    new_img = imresize(new_img, 0.6375);
    img(:) = 255;
    
    [r, c] = size(new_img);
    r_offset = floor((360 - r) / 2);
    c_offset = floor((600 - c) / 2);
    
    img(r_offset + 1 : r_offset + r, c_offset + 1 : c_offset + c) = new_img;
    
    imwrite(img, ['rect_scrambled\space_scrambled\' filename]);
end