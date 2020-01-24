height = 288;
width = 480;

for i = 1 : 20
    filename = ['480288\m' num2str(i) '.tif'];
    img = imread(filename);
    
    % phase scrambling
    pos_1 = randperm(height / 2 - 1) + 1;   % col 1
    
    pos_2 = randperm((width / 2 - 1) * height);  % col 2 through 240
    
    pos_3 = randperm(height / 2 - 1) + 1;   % col 241
    


    spec = fft2(img);
    amplitude = abs(spec);
    phase = angle(spec);

    new_phase = zeros(height, width);

    new_phase(2 : height / 2, 1) = phase(pos_1, 1);
    new_phase(height: -1 : height / 2 + 2, 1) = -phase(pos_1, 1);

    temp = reshape(phase(:, 2 : width / 2), height * (width / 2 - 1), 1);
    temp = temp(pos_2);

    new_phase(:, 2 : width / 2) = reshape(temp, height, width / 2 - 1);
    new_phase(2 : height / 2, width / 2 + 1) = phase(pos_3, width / 2 + 1);
    new_phase(height : -1 : height / 2 + 2, width / 2 + 1) = -phase(pos_3, width / 2 + 1);

    new_image = ifft2(amplitude .* exp (sqrt(-1) * new_phase), 'symmetric');

    new_image = real(new_image);
    new_image(:) = uint8(255 * (new_image(:) - min(new_image(:)))...
        / (max(new_image(:)) - min(new_image(:))));
    
    fore_ind = find(img~=255);
    result = ones(height, width, 'uint8') * 255;
    result(fore_ind) = new_image(fore_ind);
    newfilename = ['480288\p' num2str(i) '.tif'];
    imwrite(result, newfilename);
end
