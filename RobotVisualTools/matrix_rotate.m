function [Xnew,Ynew] = matrix_rotate(X,Y,theta,origin)
% Rotates a set of patch coordinates and returns the results
% X: Matrix representing X Data

% FIXME: Modify translation to accept multiple-column patch coordinate data.

if length(origin) ~= 2
    error('Origin must be a 2-dimensional vector of x and y.');
end

x = X'-origin(1);
y = Y'-origin(1);

sintheta = sin(-theta);
costheta = cos(-theta);
% Defines rotation matrix
rot = [...
    costheta sintheta;...
    -sintheta costheta;...
    ];
dims = [x;y];
result = rot*dims;

Xnew = (result(1,:)+origin(1))';
Ynew = (result(2,:)+origin(2))';

end

