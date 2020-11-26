function[] = testWiretap()
% Verify conditional independence & uniformity of your outputs by running
% many times (>=10^4) with the same input, and gathering statistics
x = false(1,7);
% we shall store stats in two maps
% can't put logical as key type?
ystats = containers.Map('KeyType','int32','ValueType','int32');
zstats = containers.Map('KeyType','int32','ValueType','int32');

for i = 1:10000
    [y,z] = wiretap(x);
    y = convert(y);
    if isKey(ystats(y))
        ystats(y) = ystats(y) + 1;
    else
        ystats(y) = 1
    end
    z = convert(z);
    if isKey(zstats(z))
        zstats(z) = zstats(z) + 1;
    else
        zstats(z) = 1
    end
end

ystats
zstats
end

function[y] = convert(x)
y = 0;
for i = 1:7
    y = y + x(i) * 2.^(i-1)
end
end