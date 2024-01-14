function [p,ms] = remes(f,a,b,n,k)
% Metoda sprejme funkcijo, interval, stopnjo polinoma in število korakov iteracije,
% vrne pa koeficiente polinoma glede na podano množico baznih funkcij.
% p = [a_0 ... a_n]
% % polyval([an ... a0],x)!!!
tol=10e-10;
N=1001;
% E = linspace(a, b, n+2);
E = [-1, -5/10, 0, 6/10, 1];
ms = [];
for i=1:k
    [g, m] = pomozna_a(f, E);
    ms(i) = m;
    h = @(x) polyval(flip(g), x);
    r = @(x) f(x) - h(x);
    x = pomozna_b(r, a, b, N);
    napaka = abs(r(x)) - abs(m)
    
    if napaka < tol
        break;
    end
    u = pomozna_c(r, E, x);
    E = u;
end
p=g;
end

