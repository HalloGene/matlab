function u = norm(R1, L1, R2, L2)
  u = sum(abs(R1-R2)) + sum(abs(L1-L2));
end