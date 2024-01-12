function [y, koef] = trigonometricnaInterpolacija(f, a, b, n, x)
    % Korak 1: Generiranje točk
    tocke = linspace(a, b, 2*n + 1);
    
    % Korak 2: Vrednosti funkcije v točkah
    f_values = f(tocke);

    % Korak 3: Uporaba FFT za izračun koeficientov
    c = fft(f_values)/(2*n + 1);
    a0 = real(c(1));
    ak = 2.*real(c(2:n+1));
    bk = -2.*imag(c(2:n+1));
    koef = [a0, ak, bk];

    % Korak 4: Izračun trigonometričnega polinoma
    y = zeros(size(x));
    for i = 1:length(x)
        phi_x = 2*pi*(2*n)/(2*n+1)*(x(i) - a)/(b - a);
        cos_terms = cos((1:n)' * phi_x);
        sin_terms = sin((1:n)' * phi_x);
        y(i) = a0 + ak * cos_terms + bk * sin_terms;
    end
end


