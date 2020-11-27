function [m] = rbd(y)
% legitimate decoder implementation
Xprime = [
    0 0 0 0 0 0 0,
    0 0 0 1 1 1 1,
    0 0 1 0 0 1 1,
    0 0 1 1 1 0 0,
    0 1 0 0 1 0 1,
    0 1 0 1 0 1 0,
    0 1 1 0 1 1 0,
    0 1 1 1 0 0 1,
    1 0 0 0 1 1 0,
    1 0 0 1 0 0 1,
    1 0 1 0 1 0 1,
    1 0 1 1 0 1 0,
    1 1 0 0 0 1 1,
    1 1 0 1 1 0 0,
    1 1 1 0 0 0 0,
    1 1 1 1 1 1 1 ];

% minimum hamming distance with Xprime
% d: current minimum
d = size(y,2);
% j: candidate index
j = 0;
for i = 1:size(Xprime,1)
    thisd = sum(xor(y,Xprime(i,:)));
    if thisd < d
        d = thisd;
        j = i;
    end
end

xcap = Xprime(j,:);

% look at the first bit of ˆx and identify the transmitted message as
% either the bits 2-4 in ˆx, or their complement
if xcap(1) == 1
    j = size(Xprime,1) - j + 1;
    xcap = Xprime(j,:);
end

m = xcap(2:4);

end