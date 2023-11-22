function y = kantorovicevaAproksimacija(F, a, b, n, x)
% Izračuna vrednosti (reparametriziranega) Kantorovičevega polinoma stopnje
% n za funkcijo f, ki jo predstavlja primitivna funkcija F.
y = zeros([1, length(x)]);
for i=0:n
    t = a + (b-a) * (i/n);
    k = (x-a)/(b-a);
    f_n_i = 1/(b-a)*(n+1)*(integral(F,(a + (b-a) * (i/(n+1))),a + (b-a) * ((i+1)/(n+1))));
    y = y + f_n_i .* bernstein(n, i, k);
end
end

