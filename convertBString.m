function[y] = convertBString(x)
  % converts binary string to number
  y = 0;
  x = flip(x);
  for i = 1:size(x,2)
      y = y + (x(i) * 2.^(i-1));
  end
end
  