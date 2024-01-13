function y = hermitovZlepek(f, df, ddf, X, x)
    % Predpriprava izhodnega vektorja
    y = zeros(size(x));
    
    % Za vsak interval med delilnimi točkami X
    for i = 1:length(X)-1
        % Delilne točke in vrednosti na tem intervalu
        a = X(i);
        b = X(i+1);

        % Izračun koeficientov Hermitovega polinoma na tem intervalu
        % (uporabimo funkcijo za izračun koeficientov, ki smo jo definirali prej)
        iskaniIndeksi = x >= a & x <= b;
        % Extract the values within the range
        iskaneVrednosti = x(iskaniIndeksi);
        y(iskaniIndeksi) = hermitovPolinom(f, df, ddf, a, b, iskaneVrednosti); % Ta funkcija mora biti definirana
    end
end
