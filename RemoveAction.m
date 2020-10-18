% The RemoveAction function helps to creates an image that
% has the action removed by applying a median filter.
%
% Input:    sourceImageArray - A 1xn 1D cell array containing n
%                              images, where each element is an RGB image
%
% Output:   OutputImage - An RGB image (stored as 3D arrays of uint8 values ranging
%                         from 0 to 255) that was obtained by taking the median RGB
%                         values of the stack of corresponding pixels from
%                         the source images.
%
% Author: Simon Cheng
function [OutputImage] = RemoveAction(sourceImageArray)

imageOne = sourceImageArray{1};
% Read the first image from the cell array

sourceImageSize = size(imageOne);
% Get the size of the first image

imageWidth = sourceImageSize(2);
imageHeight = sourceImageSize(1);
% Store size info into different varibale names.

tempMedianArray = [];
% Create an empty array

OutputImage = zeros(imageHeight,imageWidth,3,'uint8');
% An array filled with zeros with the same dimension of the first image.

for k =1:(imageHeight)
    %loop through rows
    for j = 1:(imageWidth)
        %loops through cols
        for i = 1:length(sourceImageArray)
            %loops the pixel with the same postion from each image.
            tempPixelArray = sourceImageArray{i};
            tempMedianArray(1,i,1) = tempPixelArray(k,j,1);
            tempMedianArray(1,i,2) = tempPixelArray(k,j,2);
            tempMedianArray(1,i,3) = tempPixelArray(k,j,3);
            %stores the RGB info into tempMedianArray
        end
        [tempR1, tempG1, tempB1] = MedianPixel(tempMedianArray);
        %Call the MedianPixel function
        OutputImage(k,j,1) = tempR1;
        OutputImage(k,j,2) = tempG1;
        OutputImage(k,j,3) = tempB1;
        %Fill the RGB info into kth row, jth column of the OutputImage
    end
end
end
