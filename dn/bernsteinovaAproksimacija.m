function y = bernsteinovaAproksimacija(f, a, b, n, x)
% Izračuna vrednosti (reparametriziranega) Bernsteinovega polinoma stopnje
% n za funkcija f
y = zeros([1, length(x)]);
for i=0:n
    t = a + (b-a) * (i/n);
    k = (x-a)/(b-a);
    y = y + f(t) .* bernstein(n, i, k);
end
end