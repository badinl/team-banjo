function [x] = rbe(m)
% Implement the random binning encoder s.t. it accepts m \in {0,1}^3
% and produces the corresponding output x \in X'

% if(size(m) ~= [3])
%     error("invalid shape");
% end
% if(~isa(m,'logical'))
%     error("invalid type");
% end
    
% rearranged for faster lookup (hopefully)
Xprime = [
    0 0 0 0 0 0 0,
    0 0 0 1 1 1 1,
    0 0 1 0 0 1 1,
    0 0 1 1 1 0 0,
    0 1 0 0 1 0 1,
    0 1 0 1 0 1 0,
    0 1 1 0 1 1 0,
    0 1 1 1 0 0 1,
    1 0 0 0 1 1 0,
    1 0 0 1 0 0 1,
    1 0 1 0 1 0 1,
    1 0 1 1 0 1 0,
    1 1 0 0 0 1 1,
    1 1 0 1 1 0 0,
    1 1 1 0 0 0 0,
    1 1 1 1 1 1 1 ];

% m becomes an index
i = bi2de(m) + 1;

% uniform chance to use the complement instead
if(randi([0,1], 1, 1) == 0)
    i = size(Xprime,1) - i + 1;
end

% and that should be it
x = Xprime(i,:);
end

