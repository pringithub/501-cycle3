

files = dir('majora_imgs/*.png');
for filename = files'
   img = imread( strcat('majora_imgs/',filename.name) );

   color = learn_best_color_for_image(img);
   
   whereAreWeBasedOnColor(color);
   
end