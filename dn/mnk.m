function y = mnk(f,F,g)
% Funkcija poleg f kot vhodni podatek sprejme še množico baznih funkcij
% {f0, f1, . . . , fn}, n ∈ N0, in funkcijo, ki danima dvema funkcijama 
% priredi skalarni produkt. 
% Vrne seznam koeficientov αj, j = 0, 1, . . . , n, ki določajo element Pn
% j=0 αjfj
% najboljše aproksimacije za f po metodi najmanjših kvadratov 
% glede na podani skalarni produkt

n = length(F);
G = zeros([n,n]);
d = zeros([n,1]);
% Sestavimo matriko G = (<fi_j, fi_i>)_{i,j=1}^n
for i=1:n
    for j=1:n
        G(i,j)= g(F{i},F{j});
    end
end
% Sestavimo vektor d = (<f, fi_i>)_{i=1}^n
for k=1:n
    d(k) = g(f,F{k});
end
% Rešimo sistem
y = linsolve(G,d);
G;
obcutljivost = norm(inv(G))*norm(G);
end

