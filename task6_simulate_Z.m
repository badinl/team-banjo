function [stats] = task6_simulate_Z(d)
% similar to task4 but with wiretap channel
stats = zeros(128,8);
z = zeros(1,7);
iterations = 10000;

for i = 1:iterations
    for j = 1:8
        % input: the input of the eavesdropper channel [000]...[111]
        % i: the index of the current iteration (unused here)
        % index: the output of the eavesdropper channel [0]^7...[1]^7
        %       converted to an integer 1...128 (0...127 +1)
        
        % pad input
        input = de2bi(j - 1);
        input = [zeros(1,3 - size(input,2)) input];
        
        [y,z] = wiretap_bsc(rbe(input),0,d);
        
        index = bi2de(flip(z)) + 1;
        stats(index,j) = stats(index,j) + 1;
    end
end

% trick to avoid NaN on log calcolation when joint(c,d) = 0
% shouldn't impact the outcome significatively...
stats = stats + 1;
stats = stats/(iterations*8 + 128*8);
end

