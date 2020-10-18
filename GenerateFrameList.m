% The GenerateFrameList function helps to generate a list of frames we are
% interested in which can be used by other functions.
%
% Input: frameOne - The starting frame number
%          step - the step size
%          frameNum - the number of frames to generate
%
% Output: frame - a 1xn 1D array, where n is the number of frames to
% generate.
%
% Author: Simon Cheng

function [frame] = GenerateFrameList (frameOne, step, frameNum)

% creates a 1-D array filled with '0' with a dimension of 1 x frameNum
frame = zeros(1,frameNum);


frame(1) = frameOne;
% sets the first element in the frame array as the starting frame number.

for i =1:(frameNum)
    
    % a for loop that loops from 1 to frameNum times.
    % That each time the 'i + 1' element in the frame array will
    % have a value that is the sum of the 'i' value and the step value.
    
    frame(i+1) = frame(i) + step;
    
end

% the loop above will generate an extra element by the end of the array,
% thus we 'cut off' the tail by using the code below.
frame = frame(1:(length(frame) -1));



end