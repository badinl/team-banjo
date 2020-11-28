function [stats] = task4_simulate_Z()
% runs 10k times each possible input of the eavesdroppper channel to
% gather empirical distribution of z
stats = zeros(128,8);
z = zeros(8,7);

for i = 1:10000 
    for j = 1:8
        % input: the input of the eavesdropper channel [000]...[111]
        % i: the index of the current iteration (unused here)
        % index: the output of the eavesdropper channel [0]^7...[1]^7
        %       converted to an integer 1...128 (0...127 +1)
        input = de2bi(j - 1);
        z(j,:) = eavesdropper(input);
        index = bi2de(z(j,:)) + 1;
        stats(index,j) = stats(index,j) + 1;
    end
end

stats = stats/80000
end

