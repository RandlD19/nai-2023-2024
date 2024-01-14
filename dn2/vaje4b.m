clc;
clear all;
% Definiranje funkcij
f = @(x) cos(x).^4 + exp(-x);
a = 0;
b = 5;
for n=1:4
    num_points = 201;
    x_eval = linspace(a, b, num_points);
    % Interpolacija za f
    [y_f, koef_f] = trigonometricnaInterpolacija(f, a, b, n, x_eval);
    x_poly = linspace(a, b, 2*n+1);
    koef_poly = polyfit(x_poly,f(x_poly),2*n);
    y_poly = polyval(koef_poly, x_eval);

    % Izris funkcij in interpolantov
    figure;
    subplot(2, 1, 1);
    plot(x_eval, f(x_eval), 'b-', x_eval, y_f, 'r--');
    title(['Interpolacija f za n = ' num2str(n)]);
    legend('f(x)', 'Interpolant');
    
    subplot(2, 1, 2);
    plot(x_eval, f(x_eval), 'b-', x_eval, y_poly, 'r--');
    title(['Interpolacija f za n = ' num2str(n)]);
    legend('f(x)', 'Polyfit');

    % Izračun in izpis maksimalne absolutne napake
    max_error_f = max(abs(f(x_eval) - y_f));
    max_error_poly = max(abs(f(x_eval) - y_poly));
    disp(['Maksimalna absolutna napaka za f pri n = ' num2str(n) ': ' num2str(max_error_f)]);
    % str1 = sprintf('%.15f ', koef_f);
    % disp(['Koeficienti f: ', str1]);    
    disp(['Maksimalna absolutna napaka za Polyfit pri n = ' num2str(n) ': ' num2str(max_error_poly)]);
    % str2 = sprintf('%.15f ', koef_poly);
    % disp(['Koeficienti g: ', str2]);

end