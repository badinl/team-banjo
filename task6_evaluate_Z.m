function [mutuals] = task6_evaluate_Z()
% Task 6: secrecy evaluation
deltas = [0.01 0.015 0.02 0.025 0.05 0.075 0.1 0.15 0.2 0.25 0.3 0.35 0.4 0.45 0.5];

for d = 1:size(deltas,2)
    mutuals(d) = task6_mutualinfo(deltas(d));
end
end

