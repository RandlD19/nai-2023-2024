clc;
clear all;
% Definiranje funkcij
f = @(x) cos(x).^4;
g = @(x) cos(x).^4 + exp(-x);
% Izvajanje interpolacije in izris za različne vrednosti n
for n = 1:4
    % Interval in število točk za izračun napake
    a = 0;
    b = 2*pi*(2*n)/(2*n+1);
    num_points = 201;
    x_eval = linspace(a, b, num_points);
    % Interpolacija za f
    [y_f, koef_f] = trigonometricnaInterpolacija(f, a, b, n, x_eval);
    % Interpolacija za g
    [y_g, koef_g] = trigonometricnaInterpolacija(g, a, b, n, x_eval);
    
    % Izris funkcij in interpolantov
    figure;
    subplot(2, 1, 1);
    plot(x_eval, f(x_eval), 'b-', x_eval, y_f, 'r--');
    title(['Interpolacija f za n = ' num2str(n)]);
    legend('f(x)', 'Interpolant');
    
    subplot(2, 1, 2);
    plot(x_eval, g(x_eval), 'b-', x_eval, y_g, 'r--');
    title(['Interpolacija g za n = ' num2str(n)]);
    legend('g(x)', 'Interpolant');
    
    % Izračun in izpis maksimalne absolutne napake
    max_error_f = max(abs(f(x_eval) - y_f));
    max_error_g = max(abs(g(x_eval) - y_g));
    disp(['Maksimalna absolutna napaka za f pri n = ' num2str(n) ': ' num2str(max_error_f)]);
    str1 = sprintf('%.15f ', koef_f);
    disp(['Koeficienti f: ', str1]);    
    disp(['Maksimalna absolutna napaka za g pri n = ' num2str(n) ': ' num2str(max_error_g)]);
    str2 = sprintf('%.15f ', koef_g);
    disp(['Koeficienti g: ', str2]);    
end
