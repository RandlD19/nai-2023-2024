function y = odsekomaLinearnaAproksimacija(f, a, b, n, x)
% Izračuna vrednosti zvezne odsekoma linearne funkcije, ki interpolira
% vrednosti funkcije f v točkah a + i*((b-a)/n)
% 
% h = (b - a) / n; % Dolžina podintervala
% y = zeros(size(x)); % Inicializacija rezultatov
% 
% for i = 1:n
%     xi = a + (i-1) * h; % Začetna točka podintervala
%     yi = f(xi); % Vrednost funkcije v začetni točki podintervala
%     xi1 = a + i * h; % Končna točka podintervala
%     yi1 = f(xi1); % Vrednost funkcije v končni točki podintervala
% 
%     % Odsekoma linearna interpolacija med (xi, yi) in (xi1, yi1)
%     y_interpolated = yi + ((yi1 - yi) / h) * (x - xi);
% 
%     % Dodajanje rezultatov v seznam y
%     indices = x >= xi & x <= xi1; % Indeksi, kjer velja pogoj
%     y(indices) = y_interpolated(indices);
% 
%     % % y
% end

% h = (b - a) / n; % Dolžina podintervala
y = zeros(size(x)); % Inicializacija rezultatov
delilne_tocke = linspace(a, b, n+1);
for i=1:n+1
    y = y + f(delilne_tocke(i)).*H(x,i, delilne_tocke, n);
end
end

