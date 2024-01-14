clear all;
clc;
a = -1;
b = 4;
f = @(x) exp(-x.^2);
df = @(x) -2.*x.*exp(-x.^2);
ddf = @(x) (4.*(x.^2)-2).*exp(-x.^2);

% Točke za izračun residualov
x_res = linspace(a, b, 1001);
f_values = f(x_res);

% Vrednosti n
n_values = [2, 4, 8, 16, 32, 64, 128, 256];

% Izvajanje interpolacije in izračun napak
for n = n_values
    % Generiranje delilnih točk
    X = linspace(a, b, n+1);

    % Izračun vrednosti zlepka
    y = hermitovZlepek(f, df, ddf, X, x_res); 

    % Izris grafa
    figure;
    plot(x_res, f_values, 'b', x_res, y, 'r--');
    legend('Originalna funkcija', 'Hermitov zlepek');
    title(['Hermitov zlepek z n = ' num2str(n)]);

    % Izračun maksimalne absolutne napake
    max_abs_error = max(abs(f_values - y));
    disp(['Maksimalna absolutna napaka za n = ' num2str(n) ': ' num2str(max_abs_error)]);
end


