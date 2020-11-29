function [erate] = task6_evaluate_Y()
% Task 6: reliability evaluation
epsilons = [0.01 0.015 0.02 0.025 0.05 0.075 0.1 0.15 0.2 0.25 0.3 0.35 0.4 0.45 0.5];
iterations = 1024;

for e = 1:size(epsilons,2)
    fails = 0;
    for i = 1:iterations
        % input: the input of the legit channel [000]...[111]
        % i: the index of the current iteration
        % uprime: the output of the legit channel [000]...[111]
        
        % generate input and pad to three digits
        input = de2bi(mod(i,7));
        input = [zeros(1,3 - size(input,2)) input];
        
        uprime = task6_legit(input,epsilons(e));
        if bi2de(flip(input)) ~= bi2de(flip(uprime))
            fails = fails + 1;
        end        
    end
    erate(e) = fails / iterations;
end
end

