images = dir('space_scrambled\*.tif');
N = length(images);
pixel_counts = zeros(N, 1);
mean_lum = zeros(N, 1);

for i = 1 : N
    filename = images(i).name;
    img = imread(['space_scrambled\' filename]);
    
    pixel_counts(i) = sum(sum(img ~= 255));
    
    mean_lum(i) = mean(img(img ~= 255));

    %imwrite(bw, ['BW\' filename(1:end-4) '.tif']);
end

dat = reshape(pixel_counts, 20, 5);
plot(mean(dat));
ylim([0 100000]);

figure;
plot(mean_lum);
ylim([0 255]);

