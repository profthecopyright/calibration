% step 3 scramble
TOTAL = 20;
for j = 1 : 20
    filename = ['phase_stimuli\m' num2str(j) '.png'];
    disp(filename);
    img = imread(filename);
    
    positions = reshape(randperm(1500), 30, 50);
    
    new_image = img;
    
    for des_row = 1 : 30
        for des_col = 1 : 50
            src_ind = positions(des_row, des_col);
            [src_row, src_col] = ind2sub([30 50], src_ind);
            
            new_image((des_row - 1) * 10 + 1 : des_row * 10, (des_col - 1) * 10 + 1 : des_col * 10, :)...
                = img((src_row - 1) * 10 + 1 : src_row * 10, (src_col - 1) * 10 + 1 : src_col * 10, :);
        end
    end
    
    imwrite(new_image, ['phase_stimuli\ms' num2str(j) '.png']);
    
    % phase scrambling
    pos_1 = randperm(149) + 1;   % col 1
    
    pos_2 = randperm(249 * 300);  % col 2 through 250
    
    pos_3 = randperm(149) + 1;   % col 251
    
    
    
    for layer = 1 : 3
        img_layer = img(:, :, layer);
        spec = fft2(img_layer);
        amplitude = abs(spec);
        phase = angle(spec);
        
        new_phase = zeros(300, 500);
        
        new_phase(2:150, 1) = phase(pos_1, 1);
        new_phase(300:-1:152, 1) = -phase(pos_1, 1);
        
        temp = reshape(phase(1:300, 2:250), 300 * 249, 1);
        temp = temp(pos_2);
        new_phase(1:300, 2:250) = reshape(temp, 300, 249);
        
        new_phase(2:150, 251) = phase(pos_3, 251);
        new_phase(300:-1:152, 251) = -phase(pos_3, 251);
        
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
