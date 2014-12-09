function y = f (A, B, C, q)
  y = mod((A*q+B), C);
endfunction

function f = beginlistravn (n)
#count
 i = 2;
# ap = randi(1000);
 ap = 137528;
 lista = [ap];
 while (i <= n)
  ap = f(10001687, 10001713, 10001777, ap);
  lista = [lista, ap];
  i++;
 end
 f = lista; 	 
endfunction

function f = realrand (lista)
#list of rand
 listx = lista / 10001777;
 f = listx;
endfunction

function f = ravnrasp(a, b, lista)
#from, to, list of rand. R[a,b]
 f = a + (b - a) * lista;
endfunction

function f = binomialz(p, lista, k)
#limit for binary, list of rand or realiz
 l = [];
 i = 1;
 n = length(lista)/k;
 list = binary(p, lista);
 while (i <= k)
     j = (i-1)*n+1;
     s = 0;
     while (j <= i*n)
         s += list(j);
         j++;
     end;
     l = [l, s];
     i++;
 end;
 f = l;
endfunction

function f = binomialzrand(n, p, l)
 list = beginlistravn(n*l);
 f = binomialz(p, list, l);
endfunction

function f = binomializreal(n, p, l)
 list = realrand(beginlistravn(n*l));
 f = binomialz(p, list, l);
endfunction

function f = binary(p, list)
#count, limit, list rand or list real
 i = 1;
 l = [];
 while (i <= length(list))
    if (list(i) < p)
        l = [l, 1];
    else
        l = [l, 0];
    end
    i++;
 end
 f = l;
endfunction

function f = binaryrand(n, p)
 f = binary(n, p, beginlistravn(n));
endfunction

function f = binaryreal(n, p)
 f = binary(n, p, realrand(beginlistravn(n)));
endfunction

function f = normone(m, D, r, n, lista)
#m, D^2, count, count for R[0,1]. N(m,D^2)
 i = 1;
 listy = []; 		#N(0,1)
 listz = [];		#N(m,D^2)
 while (i <= r)
    sum = 0;
    j = (i-1)*n+1;
    while (j <= i*n)
       sum += lista(j);
       j++;
    end
    listy(i) = ((1/n) * sum - 1/2) / sqrt(1/(12*n));
    i++;
 end
 listz = m + sqrt(D)*listy;
 f = listz;
endfunction

function f = normonerand(m, D, r, n)
 l = ravnrasp(0, 1, beginlistravn(r*n));
 f = normone(m, D, r, n, l);
endfunction

function f = normonereal(m, D, r, n)
 l = realrand(beginlistravn(r*n));
 f = normone(m, D, r, n, l);
endfunction

function f = Exponential(l, size)
#koef, count
 listx = realrand(beginlistravn(size, 0, 1));
 i = 1;
 listy = [];
 while (i <= size)
    listy = [listy, (-1) * (log(1 - listx(i)) / l)];
    i++;
 end
 f = listy;
endfunction

function f = getelem (list, beginl, endl)
 l = []; 
 for i=beginl:endl
  l = [l, list(i)];
 end
 f = l;
endfunction

####2 labs

function f = matrixreal (k, n)
 i = 1;
 list = [];
 listrand = realrand(beginlistravn(n*k*10));
 while (i <= k)
  #list = [list; ravnrasp(-1, 2, getelem(listrand, (i-1)*n+1, i*n))];
  #list = normonereal(1, 2, 10, getelem(listrand, (i-1)*n+1, i*n));
  #list = Exponential(4, getelem(listrand, (i-1)*n+1, i*n));
  #list = binomializreal(8, 0.3, getelem(listrand, (i-1)*n+1, i*n));
  i++;
 end
 f = list;
endfunction

#MatrixReal = matrixreal(3, 10)

  listRavn = ravnrasp(-1, 2, realrand(beginlistravn(10)));
  listNorm = normonereal(1, 2, 10, 10)
  listExpo = Exponential(4, 10)
  listBinom = binomializreal(8, 0.3, 10)

VarRyadRavn = sort(ravnrasp(-1, 2, realrand(beginlistravn(10))))
VarRyadNorm = sort(normonereal(1, 2, 10, 10))
VarRyadExpo = sort(Exponential(4, 10))
VarRyadBinom = sort(binomializreal(8, 0.3, 10))

function f = empirrasp(x, list)
 i = 1;
 sum = 0;
 while (i <= length(list))
  if (list(i) < x)
   sum++;
  end
  i++;
 end
 f = sum / i;
endfunction

function f = empirraspmore(list)
 i = 1;
 listy = [];
 listx = sort(list);
 while (i <= length(list))
  listy = [listy, empirrasp(listx(i), list)];
  i++;
 end;
 plot(listx, listy)
endfunction

####2
#l = ravnrasp(-1, 2, realrand(beginlistravn(300)));
#l = normonereal(1, 2, 300, 300);
l = Exponential(4, 300);
#l = binomializreal(300, 0.3, 8);
for i=1:3
 empirraspmore(getelem(l,(((i-1)*100) + 1), i*100));
 hold on;
end
print('empirbinom3.png','-dpng');
#pause(5);

expo = 1

###3
lr = ravnrasp(-1, 2, realrand(beginlistravn(10)));
ln = normonereal(1, 2, 10, 100);
le = Exponential(4, 10);
lxr = -1:0.3:2;
lxn = 1:0.26:3.6;
lxe = -4:0.22:-1.65;

hold off;
#plot(getelem(lxr, 1, 10), lr, 'r')
hold on;
#plot(getelem(lxn, 1, 10), ln, 'b')
#plot(getelem(lxe, 1, 10), le, 'g')
grid on;
#print('rasp10.png','-dpng');
#pause(3);

#l10 = ravnrasp(-1, 2, realrand(beginlistravn(10)));
#l100 = ravnrasp(-1, 2, realrand(beginlistravn(100)));
#l1000 = ravnrasp(-1, 2, realrand(beginlistravn(1000)));

#l10 = normonereal(1, 2, 10, 10);
#l100 = normonereal(1, 2, 100, 100);
#l1000 = normonereal(1, 2, 1000, 100);

#l10 = Exponential(4, 10);
#l100 = Exponential(4, 100);
#l1000 = Exponential(4, 1000);

#l10 = binomializreal(8, 0.3, 10);
#l100 = binomializreal(8, 0.3, 100);
#l1000 = binomializreal(8, 0.3, 1000);
hold off;
# empirraspmore(l10);
 hold on;
#empirraspmore(l100);
#empirraspmore(l1000);
#print('empir_rasp_exp.png','-dpng');

empir = 1

###4
function f = frequency(listy, l)
 listx = [];
 listy = [listy, 1000000000];
 for i=1:(length(listy)-1)
  s = 0;
  for j=1:length(l)
   if (l(j) >= listy(i) && l(j) < listy(i+1))
    s++;
   end
  end
  listx = [listx, s];
 end
 f = listx/length(l);
endfunction

function f = gistreal(listx, l)
 #l = ravnrasp(-1, 2, realrand(beginlistravn(length(listx))));
 #l = normonereal(1, 2, length(listx), 10);
 #l = Exponential(4,length(listx));
 #l = binomializreal(10, 30, length(listx));
 listy = frequency(listx, l);
 hold off;
 bar(listx, listy)
 print('dist_exp.png', '-dpng');
# pause(3);
endfunction

l = Exponential(4,100);
lx = min(l):((max(l)-min(l))/100):max(l);
length(lx)
length(l)
#lx = -1:0.03:2;
#lx = 1:0.025:3.6;
#lx = -4:0.023:-1.65;
gistreal(lx, l)

function f = samplemoment1(list)
 f = sum(list) / length(list);
endfunction

function f = samplemoment(list, k)
 scm = 0;
 for i=1:(length(list))
  scm = scm + (list(i))**k;
 end
 f = scm / length(list);
endfunction

function f = samplecentralmoment(list, k)
 scm = 0;
 sm = samplemoment1(list);
 for i=1:(length(list))
  scm = scm + (list(i) - sm)**k;
 end
 f = scm / length(list);
endfunction

function f = isprdisp(list)
 scm = 0;
 sm = samplemoment1(list);
 for i=1:(length(list))
  scm = scm + (list(i) - sm)**2;
 end
 f = scm / (length(list) - 1);
endfunction

function y = dvfactor(N)
if mod(N,2) != 0
  y = prod( 1:2:N );
else
  y = prod( 2:2:N );
end
endfunction

IspravlDispersiaRavn = isprdisp(ravnrasp(-1, 2, realrand(beginlistravn(100))))
DispersiaRavn = ((2 - (-1))**2) / 12
IspravlDispersiaNorm = isprdisp(normonereal(1, 2, 10, 100))
DispersiaNorm = 2
IspravlDispersiaExp = isprdisp(Exponential(4, 100))
DispersiaExp = 4**(-2)

Moment2Ravn = samplemoment(ravnrasp(-1, 2, realrand(beginlistravn(100))), 2)
Moment2RavnT = (2**2 + 2*(-1) + 1) / 3
Moment2Norm  = samplemoment(normonereal(1, 2, 10, 100), 2)
Moment2NormT = 2**2 * dvfactor(2-1)
Moment2Expo = samplemoment(Exponential(4, 100), 2)
Moment2ExpoT = 2 / 4**2

Moment1Ravn = samplemoment1(ravnrasp(-1, 2, realrand(beginlistravn(100))), 2)
Moment1RavnT = (2 + (-1)) / 2
Moment1Norm = samplemoment1(normonereal(1, 2, 10, 100), 2)
Moment1NormT = 0
Moment1Expo = samplemoment1(Exponential(4, 100), 2)
Moment1ExpoT = 1 / 4

CentralMoment3Ravn = samplecentralmoment(ravnrasp(-1, 2, realrand(beginlistravn(100))), 3)
CentralMoment3Norm = centralmomentnorm = samplecentralmoment(normonereal(1, 2, 10, 100), 3)
CentralMoment3Expo = samplecentralmoment(Exponential(4, 100), 3)
