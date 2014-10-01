function x = ras(l,k)
%random  matrix Ê
%K = rand(k);
%L = chol(K);
%randim m
m = rand(1,k);
K = gen_K(k);

L = chol(K);
L = L';
%Y from formula 1.12 by 1.9
YY = lab_1_1(100);
for i = 1:l
	Y(i) = 0;
	for j = 1:l
        Y(i) = Y(i) + YY((i - 1) * l + j);
    end
    Y(i) = ((1 / l) * Y(i) - 0.5) / (1 / ( 12 * l)) ^ 0.5;
end


%formula 1.15
for i = 1:l
   for j = 1:k
      x(i,j) = m(j) + L(j)*Y(i);
   end
end


end