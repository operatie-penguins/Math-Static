function X = gen_K(k)
K = rand(k);
for i = 1:k
    sumk = K(i,1);
    for j = 2:k
       sumk = sumk + K(i,j) ;
    end
    if (sumk > 2*K(i,i))
       K(i,i) = K(i,i) + sumk; 
    end
end
X = K;
end