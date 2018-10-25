function x = randomwalk(n,p)
  x = 0;
  if n == 0
    return
  end
  for i = 1:n
    x = x + sign(p-rand);
  end
end


