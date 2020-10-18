% The MedianPixel function helps to  calculate the median
% RGB values from a list of pixels.
%
% Input: pixels - A 1xnx3 3D array of RGB values representing
%                       a list of pixels (pixel 1 will be in column 1, pixel 2
%                       in column 2 etc).
%
% Output: R - The median red value, which will be the median of all
%                   the R values from the list of pixels
%             G - The median green value, which will be the median of all
%                   the G values from the list of pixels
%             B - The median blue value, which will be the median of all
%                   the B values from the list of pixels
%
% Author: Simon Cheng

function [R,G,B] = MedianPixel(pixels)

% The median function returns the median of an array.
R = median(pixels(1,:,1));
G = median(pixels(1,:,2));
B = median(pixels(1,:,3));

end