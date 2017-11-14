% function to see the color of a chosen pixel coord's rgb
function [mat] = showColor(color)

    r = color(1);
    g = color(2);
    b = color(3);

    mat = ones(500,500);
    mat(:,:,1) = r;
    mat(:,:,2) = g;
    mat(:,:,3) = b;
    
    mat = uint8(mat);
    imshow(mat);

end