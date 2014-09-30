function X = binary(p)
X = uniformly(0,1);
for i = 1:100
    if X(i) >= p
        X(i) = 1;
    else
        X(i) = 0;
    end
end
end