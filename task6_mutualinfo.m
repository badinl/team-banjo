function [i] = task6_mutualinfo(delta)
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