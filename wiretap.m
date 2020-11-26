function [y,z] = wiretap(x)
%WIRETAP Implements the binary symmetric wiretap channel
%   the legitimate channel introduces at most 1 binary error per word
%   the eavesdropper channel introduces at most 3 b.e. per word

% generate randomly a number with 1/7 bits at 1
a = rbs(1,7);
% xor this with x to get y
y = xor(x,a);

% generate randomly a number with 3/7 bits at 1
b = rbs(3,7);
% xor this with x to get z
z = xor(x,b);
end

function [s] = rbs(M,N)
% random binary strings with m ones of length n
s = false(1,N);
s(1:M) = true; 
s = s(randperm(numel(s)));
end