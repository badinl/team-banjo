function [pud,pzc] = marginals(matrix)
% compute the marginal distributions
% input matrix is task4_simulate_Z or task6_simulate_Z
% matrix contains joint distributions and is already normalised!

% p_u(d): marginal distribution of the input (sum columnwise)
% p_c(z): marginal distribution of the output (sum rowwise)

pud = sum(matrix,1);
pzc = sum(matrix,2);
end

