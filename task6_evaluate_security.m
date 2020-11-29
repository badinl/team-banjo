function [Cs] = task6_evaluate_security()
epsilons = [0.01 0.015 0.02 0.025 0.05 0.075 0.1 0.15 0.2 0.25 0.3 0.35 0.4 0.45 0.5];
deltas = [0.01 0.015 0.02 0.025 0.05 0.075 0.1 0.15 0.2 0.25 0.3 0.35 0.4 0.45 0.5];
%epsilons = flip(epsilons);
%deltas = flip(deltas);

Cs = zeros(size(epsilons,2),size(deltas,2));

for e=1:size(epsilons,2)
    for d=1:size(deltas,2)
        if(epsilons(e) < deltas(d))
            Cs(e,d) = h2(deltas(d)) - h2(epsilons(e));
        else
            Cs(e,d) = 0;
        end
    end
end
end

function [h] = h2(x)
% calculates binary Shannon entropy
h = x*log05(x) + (1-x)*log05(1-x);
end

function [y] = log05(x)
% matlab doesn't have log ≠ 2, e, 10. Thanks Matlab!
% logB(X) = logA(X) / logA(B)
y = log2(x) / log2(0.5);
end