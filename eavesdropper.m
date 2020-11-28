function [z] = eavesdropper(u)
% Eavesdropper channel implementation
% u \in M, z output of the wiretap channel towards Eve
    [y,z] = wiretap(rbe(u));
end

