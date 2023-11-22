function y = odsekomaLinearnaAproksimacija(f, a, b, n, x)
% Izračuna vrednosti zvezne odsekoma linearne funkcije, ki interpolira
% vrednosti funkcije f v točkah a + i*((b-a)/n)

h = (b - a) / n; % Dolžina podintervala
y = zeros(size(x)); % Inicializacija rezultatov

for i = 1:n
    xi = a + (i-1) * h; % Začetna točka podintervala
    yi = f(xi); % Vrednost funkcije v začetni točki podintervala
    xi1 = a + i * h; % Končna točka podintervala
    yi1 = f(xi1); % Vrednost funkcije v končni točki podintervala

    % Odsekoma linearna interpolacija med (xi, yi) in (xi1, yi1)
    y_interpolated = yi + ((yi1 - yi) / h) * (x - xi);

    % Dodajanje rezultatov v seznam y
    indices = x >= xi & x <= xi1; % Indeksi, kjer velja pogoj
    y(indices) = y_interpolated(indices);
end

h = (b - a) / n; % Dolžina podintervala
y = zeros(size(x)); % Inicializacija rezultatov
x0 = a;
x1 = a+h;
H0 = @(x) (x1-x)/(x1-x0);
x_ustrezajo = x >= x0 & x < x1;
y(x_ustrezajo) = H0(x_ustrezajo);
for i=1:n
    Hi = @(x) (x1-x)/(x1-x0);
    t = a + (b-a) * (i/n);
    k = (x-a)/(b-a);
    y = y + f(t) .* bernstein(n, i, k);
end
end

