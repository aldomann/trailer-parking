function [ x ] = curve4( t, height )
% This function simulates an S shaped curve

    % height = 0.4;
    steep = 2;

    n = length(t);

    x_1 = logistic(height, steep, linspace(-6,6,floor(n/4)), 0);
    % logistic( L, k, x, x_0 ) = L./(1 + exp(-k.*(x-x_0)));
    x_2 = flip(x_1);
    x_3 = [ x_1 x_2 ];
    x_4 = -x_3;

    x = [ x_3 0 x_4 ];

end