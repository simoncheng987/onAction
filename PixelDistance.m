% The PixelDistance function helps to calculate
% the square of the distance between two points in colour space.
%
% Input: Point1 - An array containing three elements
%                        representing a point in 3D colour space
%
%          Point2 - An array containing three elements
%                        representing a second point in 3D colour space
%
% Output: squaredDistance - the square of the distance
%              between the two points in 3D colour space.
%
% Author: Simon Cheng

function [squaredDistance] = PixelDistance(Point1, Point2)

pt1Size = size(Point1);
pt2Size = size(Point2);
% Gather the size of Point1 and Point2

Point1 = double(Point1);
Point2 = double(Point2);
% Covert Point1 and Point2 into double,
% to get rid of bugs while doing array computation.

if (pt1Size(1) == 1)
    % The first case if one of the input is a 1D array
    DistanceArray = Point1(1,:) - Point2(1,:);
    % Array calculation stored into DistanceArray
    
    squaredDistanceArray = (DistanceArray .^2);
    % Squared Result into squaredDistanceArray
    
    squaredDistance = sum(squaredDistanceArray);
    % Sum up all the elements in the squaredDistanceArray
    % Thus returning a single ouput.
    
elseif (pt1Size(1) ~= 1)
    % The second case if one of the input is not a 1D array
    % i.e. one of the input array has more than 1 row
    
    DistanceArray = Point1 - Point2;
    % Array calculation stored into DistanceArray
    
    squaredDistanceArray = (DistanceArray .^2);
    % Squared Result into squaredDistanceArray
    
    squaredDistance = sum(squaredDistanceArray);
    % Sum up all the elements in the squaredDistanceArray
    % Thus returning a single ouput.
    
end

end