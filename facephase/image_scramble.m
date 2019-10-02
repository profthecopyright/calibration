% step 3 scramble
TOTAL = 20;
for j = 1 : 20
    filename = ['phase_stimuli\m' num2str(j) '.png'];
    disp(filename);
    img = imread(filename);
    
    positions = reshape(randperm(256), 16, 16);
    
    new_image = img;
    
    for des_row = 1 : 16
        for des_col = 1 : 16
            src_ind = positions(des_row, des_col);
            [src_row, src_col] = ind2sub([16 16], src_ind);
            
            new_image((des_row - 1) * 10 + 1 : des_row * 10, (des_col - 1) * 10 + 1 : des_col * 10, :)...
                = img((src_row - 1) * 10 + 1 : src_row * 10, (src_col - 1) * 10 + 1 : src_col * 10, :);
        end
    end
    
    imwrite(new_image, ['phase_stimuli\ms' num2str(j) '.png']);
    
    % phase scrambling
    pos_1 = randperm(79) + 1;   % col 1
    
    pos_2 = randperm(79 * 160);  % col 2 through 80
    
    pos_3 = randperm(79) + 1;   % col 81
    
    
%     pos_1 = 2:80;
%     pos_2 = 1:79*160;
%     pos_3 = 2:80;
    
    
    for layer = 1 : 3
        img_layer = img(:, :, layer);
        spec = fft2(img_layer);
        amplitude = abs(spec);
        phase = angle(spec);
        
        new_phase = zeros(160, 160);
        
        new_phase(2:80, 1) = phase(pos_1, 1);
        new_phase(160:-1:82, 1) = -phase(pos_1, 1);
        
        temp = reshape(phase(1:160, 2:80), 160 * 79, 1);
        temp = temp(pos_2);
        new_phase(1:160, 2:80) = reshape(temp, 160, 79);
        
        new_phase(2:80, 81) = phase(pos_3, 81);
        new_phase(160:-1:82, 81) = -phase(pos_3, 81);
        
        new_image_layer = ifft2(amplitude .* exp (sqrt(-1) * new_phase), 'symmetric');
        
        new_image(:, :, layer) = real(new_image_layer);
    end
    
    % intensity rematching
    
    hsv = rgb2hsv(img);
    img_value = hsv(:, :, 3);
    img_intensity = mean(img_value(:));
    
    new_hsv = rgb2hsv(new_image);
    new_value = new_hsv(:, :, 3);
    new_intensity = mean(new_value(:));
    
    coeff = img_intensity / new_intensity;
    new_hsv(:, :, 3) = new_value * coeff;
    new_image = hsv2rgb(new_hsv);
    
    imwrite(new_image, ['phase_stimuli\mp' num2str(j) '.png']);
end
