function [ x ] = curve3( t, height)
% This function simulates a short sharp curve

    % height = 0.65;
    steep = 2;

    n = length(t);

    x_1 = logistic(height, steep, linspace(-6,6,floor(n/4)), 0);
    % logistic( L, k, x, x_0 ) = L./(1 + exp(-k.*(x-x_0)));
    x_2 = flip(x_1);

    x = [ x_1 height x_2 zeros(1,floor(n/2)) ];

end