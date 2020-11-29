function [y,z] = wiretap_bsc(x,e,d)
% Task 5: Implement the "true" wiretap BSC channel
y = x;
z = x;

for i=1:size(x,2)
    if rand() < e
        y(i) = not(x(i));
    end
    if rand() < d
        z(i) = not(x(i));
    end
end
end
