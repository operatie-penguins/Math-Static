function z = pol(n)
k = 4;
l = 10;
p = [0.14,0.17,0.34, 0.35];
c = rand(1,k);
num(1) = 1;
for i = 1:l*n
    num(i+1) = mod(10010071*num(i)+10010081,10010087);
end
for i = 1:l*n
        num(i) = num(i)/10010087;
end
y = zeros(1,l*n);
for i = 1:l*n%по формуле 1.21
       if ((0 <= num(i)) && (num(i) < p(1)))
           y(i) = c(1);
       end
       if (p(1) <= num(i) && num(i) < ( p(1) + p(2)))
           y(i) = c(2);
       end
       if ((p(1) + p(2)) <= num(i) && num(i) < ( p(1) + p(2) + p(3)))
           y(i) = c(3);
       end
       if(( p(1) + p(2) + p(3)) <= num(i)&& num(i) <= ( p(1) + p(2) + p(3) + p(4)))
           y(i) = c(4);
       end
end
for i = 1:l
    for j = 1:k
       z(i,j) = 0;
       for kk = ((j - 1)*n +1):i*n
          if (y(kk) == c(j))
              z(i,j) =  z(i,j) + 1;
          end
       end
    end
end
end