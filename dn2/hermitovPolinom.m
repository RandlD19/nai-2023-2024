function y = hermitovPolinom(f,df,ddf,a,b,x)
% Metoda naj za podano funkcijo f, 
% njen prvi odvod df in drugi odvod ddf ter točki a in b izračuna vrednosti 
% polinoma stopnje 5, ki interpolira vrednosti in odvoda funkcije 
% v podanih točkah. 
% Izhodni podatek naj bo seznam y, ki predstavlja vrednosti polinoma 
% v točkah iz vhodnega seznama x.
% n = 5;
% H = zeros(n+1, n+2);
% H(:,1) = [a*ones((n+1)/2,1); b*ones((n+1)/2,1)];
% H(:,2) = [f(a)*ones((n+1)/2,1); f(b)*ones((n+1)/2,1)];
% 
% % Priprava točk in vrednosti za Hermitovo interpolacijo
tocke = [a, a, a, b, b, b];
vrednosti = [f(a), f(a), f(a), f(b), f(b), f(b)];
% Inicializacija tabele deljenih diferenc
n = length(tocke);
tabela = zeros(n, n);
tabela(:, 1) = vrednosti';

% Izračun deljenih diferenc
for j = 2:n
    for i = j:n
        if tocke(i) ~= tocke(i-j+1)
            tabela(i, j) = (tabela(i, j-1) - tabela(i-1, j-1)) / (tocke(i)-tocke(i-j+1));
        else
            % Hermitov pogoj za odvode
            if j == 2
                tabela(i, j) = df(tocke(i));
            elseif j == 3
                tabela(i, j) = ddf(tocke(i))/2;
            end
        end
    end
end

koef = diag(tabela)';

bazni = @(x) x.^0;
apr = @(t) 0.*t; % vzamemo funkcijo identično enako 0
for i=1:n
    % na vsakem koraku prištejemo vodilni koef * bazni polinom (npr. 2.45x^2). Tako dobimo pnea po MNK
    apr = @(t) apr(t) + koef(i).*bazni(t);
    bazni = @(x) bazni(x).*(x-tocke(i));
end
y = apr(x);

end

