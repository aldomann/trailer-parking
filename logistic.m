function [ f ] = logistic( L, k, x, x_0 )
%LOGISTIC FUNCTION
% logistic( L, k, x, x_0 ) = L./(1 + exp(-k.*(x-x_0)));

f = L./(1 + exp(-k.*(x-x_0)));

end

