function [g, m] = pomozna_a(f, E)
% funkcija za dan seznam točk E dolžine n+2 poišče polinom
% g ∈ Pn, čigar residual f − g alternirajoče doseže vrednost ±m, m > 0, v točkah
% iz seznama E.
n = length(E);
M = ones([n, n]);
for i=1:n-1
    M(:,i) =  E.^(i-1);
end
M(:, n) = ones(n, 1) .* (mod(1:n, 2) * 2 - 1)';        
b = f(E)';
x = linsolve(M,b);
g = x(1:n-1);
m = x(n);
end

