% The ActionShot function helps to create an action shot image by
% finding the pixels from a stack of images
% that are most distant from the median RGB values.
%
% Input:    sourceImageArray - A 1xn 1D cell array containing n
%                              images, where each element is an RGB image
%
% Output:   ActionImage - An action shot in the form of an RGB image
%
% Author:   Simon Cheng

function [ActionImage] = ActionShot(sourceImageArray)

imageOne = sourceImageArray{1};
% Read the first image from the cell array

sourceImageSize = size(imageOne);
% Get the size of the first image

imageWidth = sourceImageSize(2);
imageHeight = sourceImageSize(1);
% Store size info into different varibale names.

tempDistantArray = [];
% Create an empty array

ActionImage = zeros(imageHeight,imageWidth,3,'uint8');
% An array filled with zeros with the same dimension of the first image.

for k =1:(imageHeight)
    %loop through rows
    for j = 1:(imageWidth)
        %loops through cols
        for i = 1:length(sourceImageArray)
            %loops the pixel with the same postion from each image.
            tempPixelArray = sourceImageArray{i};
            tempDistantArray(1,i,1) = tempPixelArray(k,j,1);
            tempDistantArray(1,i,2) = tempPixelArray(k,j,2);
            tempDistantArray(1,i,3) = tempPixelArray(k,j,3);
            %stores the RGB info into tempDistantArray
        end
        
        [tempR2, tempG2, tempB2] = MostDistantPixel(tempDistantArray);
        %Call the MostDistantPixel function
        ActionImage(k,j,1) = tempR2;
        ActionImage(k,j,2) = tempG2;
        ActionImage(k,j,3) = tempB2;
        %Fill the RGB info into kth row, jth column of the OutputImage
    end
end
end
