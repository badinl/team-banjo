function [stats] = task4_simulate_Z()
% runs 10k times each possible input of the eavesdroppper channel to
% gather empirical distribution of z
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
        
        z = eavesdropper(input);
        
        index = bi2de(flip(z)) + 1;
        stats(index,j) = stats(index,j) + 1;
    end
end

stats = stats/80000;
end

function [z] = eavesdropper(u)
% Eavesdropper channel implementation
% u \in M, z output of the wiretap channel towards Eve
    [y,z] = wiretap(rbe(u));
end

