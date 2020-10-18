% The GenerateImageList function helps to Fetch a list of the names of
% all the images with a particular file extension that are
% contained in a specified directory
%
% Input: path - A string containing the name
%                    of the directory the images are contained in
%
%           type - A string containing the file extension of the images to fetch
%
%
% Output: imageList - A 1xn 1D cell array containing n strings where each element
%                               is the filename of an image from the specified directory that
%                               has a particular file extension
%
% Author: Simon Cheng

function [imageList] = GenerateImageList(path,type)

% The strcat function helps to combine the strings together
% and thus a legal directory name will be generate
tempImageList = strcat(path,'/*.',type);

% The dir function helps to define a few file types in the specific
% file location
files = dir(tempImageList);

% the '.name' in the code below helps to extract the all the file names
% and thus stored each file name into the 'imageList' cell array.
imageList = {files.name};

end