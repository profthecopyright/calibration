images = dir('480288\*.tif');
N = length(images);
pixel_counts = zeros(N, 1);
mean_lum = zeros(N, 1);

for i = 1 : N
    filename = images(i).name;
    img = imread(['480288\' filename]);
    
    pixel_counts(i) = sum(sum(img ~= 255));
    
    mean_lum(i) = mean(img(img ~= 255));

    %imwrite(bw, ['BW\' filename(1:end-4) '.tif']);
end

dat = reshape(pixel_counts, 20, 8);
plot(mean(dat));
ylim([0 100000]);
disp(mean(mean_lum));
disp(std(mean_lum));

figure;
plot(mean_lum);
ylim([0 255]);

