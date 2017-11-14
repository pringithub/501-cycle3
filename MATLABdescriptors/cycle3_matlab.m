
% get colors if you haven't already
%{
files = dir('majora_imgs/*.png');
color = [];
for filename = files'
   img = imread( strcat('majora_imgs/',filename.name) );

   color = [color learn_best_color_for_image(img)];
   
   whereAreWeBasedOnColor(color);
   
end
%}



% test video against images
filename = 'majora_test.mov';
video = VideoReader(filename);


num_images = video.Duration * video.FrameRate;

subdivisions = 10;
iter = 1;
for i = 1:(num_images/subdivisions):num_images
    img = read(video,i);
    strcat('read image',i)
    
    color = learn_best_color_for_image(img,3);
    [distances,closest_file] = whereAreWeBasedOnColor(color,'faster');
    
    plot_rows = 2;
    plot_cols = subdivisions/plot_rows;
    figure(1)
    subplot(plot_rows,plot_cols,iter);imshow(img);title(closest_file.name);

    iter = iter+1;
    
end

%{
imshow(img);


malformed = img(uint8(points(1,1)),uint8(points(1,2)),:);
color     = [malformed(:,:,1) malformed(:,:,2) malformed(:,:,3)];

showColor(color);
%}