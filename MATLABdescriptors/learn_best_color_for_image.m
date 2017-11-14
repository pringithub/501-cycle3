% find the color that maximizes the distance in error
% not optimal solution (would be 255*255*255 brute forced
function bestColor = learn_best_color_for_image(img,numRounds)

  bestColor = [0 0 0];
  bestError = Inf;

  'starting'
  
  if (numRounds > 0)
      for r = 0:52:255
        for g = 0:52:255
          for b = 0:52:255

            color = [r g b];
            distance = absoluteDistanceMetric(color,img);

            if distance < bestError
                bestColor = color;
                bestError = distance
            end

          end
        end
      end
  end
  
  'first round complete'
  
  if numRounds > 1
      for r = bestColor(1)-52:13:bestColor(1)+52
        for g = bestColor(2)-52:13:bestColor(2)+52
          for b = bestColor(3)-52:13:bestColor(3)+52

            color = [r g b];
            distance = getDistanceToColor(color,img);

            if distance < bestError
                bestColor = color;
                bestError = distance
            end

          end
        end
      end
  end
  
  'second round complete'
  
  if numRounds > 2
      for r = bestColor(1)-15:3:bestColor(1)+15
        for g = bestColor(2)-15:3:bestColor(2)+15
          for b = bestColor(3)-15:3:bestColor(3)+15

            color = [r g b];
            distance = getDistanceToColor(color,img);

            if distance < bestError
                bestColor = color;
                bestError = distance
            end

          end
        end
      end
  end
  
  %{
  subplot(1,2,1);
  whereAreWeBasedOnColor(bestColor,"slower");
  grid on
  subplot(1,2,2);
  showColor(color);
  %}
end
        

function error = absoluteDistanceMetric(color,img)
    error = getDistanceToColor(color,img);
end
function error = relativeDistanceMetric(color)
    distances = whereAreWeBasedOnColor(color);

    [sorted, sorted_img_idxs] = min(distances);
    distance_first_to_second = sorted(2)-sorted(1);

    error = distance_first_to_second;
end
