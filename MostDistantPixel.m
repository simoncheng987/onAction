% The MostDistantPixel function helps to calculate the pixel from a list
% that is most distant from the median RGB values of that list.
%
% Input: pixelList - A 1xnx3 3D array of RGB values representing a
%                           list of pixels
%
% Output: R - The red value of the most distant pixel
%             G - The green value of the most distant pixel
%             B - The blue value of the most distant pixel
%
% Author: Simon Cheng

function [R,G,B] = MostDistantPixel(pixelList)

count = 0;

[Rmedian,Gmedian,Bmedian] = MedianPixel(pixelList);
% Called the MedianPixel function to gather the median R,G,B value
% of the Input array.

medianArray = [];
medianArray(1) = Rmedian;
medianArray(2) = Gmedian;
medianArray(3) = Bmedian;
% Store the median RGB info into the medianArray.

maxDistance = -1;
tempValue = [];
% Initate a minimum value for maxDistance.

tempR = pixelList(1,1,1);
tempG = pixelList(1,1,2);
tempB = pixelList(1,1,3);
tempRGBArray = [tempR, tempG, tempB];
% Gather a default value from the 1st pixel in the input,
% and thus passed them into an 1D array

tempPixelListSize = size(pixelList);
% Gather the dimension of the input array

if tempPixelListSize(2) ==1
    % for the case that there is only 1 pixel in the input array
    R = tempR;
    G = tempG;
    B = tempB;
    
else
    % ohterwise the algorithm below can applied to all the other
    % cases.
    for i =1:tempPixelListSize(2)
        % loop through all the columns.
        
        tempR = pixelList(1,i,1);
        tempR1 = num2str(tempR);
        tempR2 = str2num(tempR1);
        % passed the R value into a variable and convert them into string and
        % then convert back to num. Thus getting rid of the bugs that will created
        % by the unit8 storage.
        
        tempG = pixelList(1,i,2);
        tempG1 = num2str(tempG);
        tempG2 = str2num(tempG1);
        % The same for the G value.
        
        tempB = pixelList(1,i,3);
        tempB1 = num2str(tempB);
        tempB2 = str2num(tempB1);
        % The same for the B value.
        
        tempRGBArray = [tempR2, tempG2, tempB2];
        % Pass the RGB values into tempRGBArray.
        
        tempPixelDistance = PixelDistance(medianArray, tempRGBArray);
        % Called the PixelDistance.
        
        if (tempPixelDistance > maxDistance)
            % if statement, only store the highest result from the PixelDistance
            % call. And the Output R,G,B are the values of the most distant pixel.
            
            maxDistance =  tempPixelDistance;
            R = tempR2;
            G = tempG2;
            B = tempB2;
            
            % Stores the tempoary most distant RGB value into tempDistantPixelArray
            tempDistantPixelArray(1) = tempR2;
            tempDistantPixelArray(2) = tempG2;
            tempDistantPixelArray(3) = tempB2;
            
        elseif (tempPixelDistance == maxDistance)
            % In the case when two pixel ends up with the same distance,
            % Only takes the first one.
            R = tempDistantPixelArray(1);
            G = tempDistantPixelArray(2);
            B = tempDistantPixelArray(3);
            
        end
        
    end
    
end
end