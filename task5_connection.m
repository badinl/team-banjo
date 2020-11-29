function [y,z] = task5_connection(u,e,d)
% Connects rbe -> wiretap_bsc -> rbd for the purpose of testing out task 5
[y,z] = wiretap_bsc(rbe(u),e,d);
y = rbd(y);
z = rbd(z);
end