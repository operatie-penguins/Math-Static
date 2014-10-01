function z= rav_rasp(s,l)
A = 1111;
B = 2222;
C = 4444;
a(1)=10;
m=0;
n=1;
p=l/s;
i=0;
j=0;
z=zeros(s,p)
  for k=1:l
      if i==0
         j=j+1;
         i=i+1;
      end
      x(k)=m+(n-m)*a(k)/C;
      a(k+1)=mod((A*a(k)+B),C);
      z(j,i)=x(k);
      i=mod(i+1,p+1);      
  end
  for i = 1:s
  z(i,:)=sort(z(i,:));
  end
end
