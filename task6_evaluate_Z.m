function [mutuals] = task6_evaluate_Z()
% Task 6: secrecy evaluation
deltas = [0.01 0.015 0.02 0.025 0.05 0.075 0.1 0.15 0.2 0.25 0.3 0.35 0.4 0.45 0.5];

for d = 1:size(deltas,2)
    mutuals(d) = mutualinfo(deltas(d));
end
end

function [i] = mutualinfo(delta)
% calculate mutual information (for task 6)
"Calculating mutual info for " + delta
joint = task6_simulate_Z(delta);
[marginal_u, marginal_z] = marginals(joint);
i = 0;
for d = 1:size(marginal_u)
    for c = 1:size(marginal_z)
        i = i + (joint(c,d) * log2(joint(c,d)/(marginal_u(d)*marginal_z(c))));
    end
end
end

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

