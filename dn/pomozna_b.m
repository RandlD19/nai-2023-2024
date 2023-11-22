function x = pomozna_b(r,a,b,N)
% Za funkcijo r in interval [a, b] naj metoda razdeli [a, b] z N+1 ekvidistantnimi točkami, ki sestavljajo množico x = {a + k(b − a)/N; k = 0, 1, . . . , N}
% (vzemite na primer N = 1000), in določi tisto absciso x ∈ x, za katero velja
% |r(x)| = ∥r∥∞,x
tocke = linspace(a, b, N+1);
y = abs(r(tocke));
[m, index] = max(y);
x = tocke(index);
end

