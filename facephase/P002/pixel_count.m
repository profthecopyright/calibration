images = dir('resized_clean\*.tif');
N = length(images);
pixel_counts = zeros(N, 1);

for i = 1 : N
    filename = images(i).name;
    img = imread(['resized_clean\' filename]);
    
    pixel_counts(i) = sum(sum(img ~= 255));

    %imwrite(bw, ['BW\' filename(1:end-4) '.tif']);
end

dat = reshape(pixel_counts, 20, 5);
plot(mean(dat));
ylim([0 100000]);

