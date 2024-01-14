function y = H(x,i,delilne_tocke,n)
% Izračuna vrednosti zvezne odsekoma linearne funkcije, ki interpolira
y = zeros(size(x));
if i==1
    x0 = delilne_tocke(1);
    x1 = delilne_tocke(2);
    indeksi = x >= x0 & x < x1;
    y(indeksi) = (x1 - x(indeksi))/(x1 - x0);
else if (1 < i) && (i < n+1)
    x0 = delilne_tocke(i-1);
    x1 = delilne_tocke(i);
    x2 = delilne_tocke(i+1);
    indeksi1 = x >= x0 & x < x1;
    indeksi2 = x >= x1 & x < x2;
    y(indeksi1) = (x(indeksi1) - x0)/(x1 - x0);
    y(indeksi2) = (x2 - x(indeksi2))/(x2 - x1);
else
    x0 = delilne_tocke(n);
    x1 = delilne_tocke(n+1);
    indeksi = x >= x0 & x <= x1;
    y(indeksi) = (x(indeksi) - x0)/(x1 - x0);
end
end

