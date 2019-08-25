function load_images(total)
global image_lib
    image_lib = cell(1, total);
    
    for i = 1 : total
        image_lib{i} = imread(['images\m' num2str(i) '.png']);
    end
end