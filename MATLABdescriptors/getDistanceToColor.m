function distance = getDistanceToColor(color,img)

    % get colors somehow, then create an mxn image of that color
    color_img = ones(size(img,1),size(img,2));
    color_img(:,:,1) = color(1);
    color_img(:,:,2) = color(2);
    color_img(:,:,3) = color(3);
    color_img = uint8(color_img);
   
    % subtract the images, collapse dimensions via sum
    subtracted_img = abs( double(color_img) - double(img) );
    sum_subtracted_img = sum(sum( subtracted_img ));
    metric = [sum_subtracted_img(1); sum_subtracted_img(2); sum_subtracted_img(3)];
    
    % euclidean distance from color to image
    distance = norm( metric );

end