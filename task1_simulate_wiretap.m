function[zstats] = task1_simulate_wiretap()
% Verify conditional independence & uniformity of your outputs by running
% many times (>=10^4) with the same input, and gathering statistics
% x = [1 0 0 1 0 0 0] as per 2.3.1
%x = false(1,7)
x = [1, 0, 0, 1, 0, 0, 0];

% maps don't work for some reason - use arrays
% 127 + 1 to avoid addressing 0
ystats = zeros(128,1);
zstats = zeros(128,1);

iterations = 10000;
for i = 1:iterations
    [y,z] = wiretap(x);
    y = bi2de(y) + 1;
    ystats(y,1) = ystats(y,1) + 1;
    z = bi2de(z) + 1;
    zstats(z,1) = zstats(z,1) + 1;
end

% now remove all empty slots (corresponding to all strings with >3 ones)
ystats = ystats(ystats~=0);
zstats = zstats(zstats~=0);

%normalise by iteration count to get pmd
ystats = ystats/iterations;
zstats = zstats/iterations;

end