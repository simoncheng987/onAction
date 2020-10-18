% The ReadImages function helps to read in a specified list of images
% given the filenames and the directory the files are located in.
%
% Input: path - A string containing the name of the
%                    directory the images are contained in
%
%           filenames - A 1xn 1D cell array containing n strings
%                             where each element is a filename of
%                             an image to read
%
% Output: imageList - A 1xn 1D cell array containing n images,
%                               where each element is an RGB image (recall
%                               RGB images stored as 3D arrays of uint8 values
%                               ranging from 0 to 255).  The first image will correspond
%                               to the first filename from the list of filenames
%
% Author: Simon Cheng


function [colorInfo] = ReadImages(path, filenames)

for i = 1:length(filenames)
    % a for loop, loops from 1 till the length of the filenames
    
    TempFile = filenames{i};
    % TempFile is the 'i'th element in the filenames cell array.
    
    TempPath{i} = strcat(path,'\',TempFile);
    % The strcat function helps to combine the strings together
    % and thus a legal directory name will be generate
    
    % Then this directory name will be passed into the ith
    % element in the TempPath cell array.
    
    TempData = TempPath{i};
    % TempData is the ith element in the TempPath cell array.
    
    imageData = imread(TempData);
    % Use imread function to gather the RGB info of TempData.
    
    colorInfo{i} = imageData;
    % The gathered RGB got stored into the ith place in the colorInfo cell
    % array.
end
end