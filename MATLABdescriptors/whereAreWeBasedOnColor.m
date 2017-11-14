function [distances,closest] = whereAreWeBasedOnColor(color,method)

    distances = [];
    files = dir('majora_imgs/*.png');

    if strcmp(method,"slower")
        % method using comparisons
        for filename = files'
           img = imread( strcat('majora_imgs/',filename.name) );
           distances = [distances getDistanceToColor(color,img)];

        end
    end
    
    if strcmp(method,"faster")
        % alternative method getting distances from color to color
        beach_color          = [146 140 133];
        desert_color         = [65 46 49];
        fairyfountain_color  = [101 130 123]; % not good (mixes up with beach
        fairyfountain2_color = [179 221 211];
        forest_color         = [55 55 20];
        ocarina_pose_color   = [68 49 33]; % not great - 3rd best
        snow_color           = [127 130 175];
        underwater_color     = [71 175 166];
        underwater_night_color = [13 42 91];
        colors = [beach_color;desert_color;fairyfountain_color;fairyfountain2_color;
            forest_color;ocarina_pose_color;snow_color;underwater_color;underwater_night_color];

        for i = 1:size(colors,1)
           error = abs( color - colors(i,:) );
           distances = [distances norm(error)]; 
        end
    end
    

%    bar(distances);
%    grid on

    [y,idx] = min(distances);
    closest = files(idx);
    
    strcat('You are at /',closest.name)
    
end

