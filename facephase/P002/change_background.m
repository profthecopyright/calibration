images = dir('resized_clean\*.tif');
N = length(images);

for i = 61 : N
    filename = images(i).name;
    img = imread(['resized_clean\' filename]);
    
    img(img == 255) = 128;
    imshow(img);
    waitforbuttonpress;
end