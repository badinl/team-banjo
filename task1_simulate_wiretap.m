function[ystats,zstats] = task1_simulate_wiretap()
% Verify conditional independence & uniformity of your outputs by running
% many times (>=10^4) with the same input, and gathering statistics
% for simplicity, x = zeros (false is more efficient)
x = false(1,7);

% maps don't work
ystats = zeros(65,1);
zstats = zeros(113,1);

for i = 1:10000
    [y,z] = wiretap(x);
    y = bi2de(y) + 1;
    ystats(y,1) = ystats(y,1) + 1;
    z = bi2de(z) + 1;
    zstats(z,1) = zstats(z,1) + 1;
end

ystats = ystats(ystats~=0);
ystats = ystats/10000;
zstats = zstats(zstats~=0);
zstats = zstats/10000;

end