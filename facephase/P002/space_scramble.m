images = dir('equalized\*.tif');
N = length(images);

for i = 1 : N
    filename = images(i).name;
    img = imread(['equalized\' filename]);
    
    fore_ind = find(img~=255);
    new_ind = fore_ind(randperm(length(fore_ind)));
    img(fore_ind) = img(new_ind);
    imwrite(img, ['space_scrambled\' filename]);
end