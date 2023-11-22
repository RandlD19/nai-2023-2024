function u = pomozna_c(f,tocke,dodatna_tocka)
% sprejme funkcijo, urejen seznam točk, na
% katerem funkcija alternirajoče spreminja predznak, ter še eno dodatno točko;
% vrne pa urejen seznam točk, ki je enake dolžine kot vhodni, a namesto ene izmed
% prvotnih točk vsebuje podano dodatno točko. Izhodni seznam mora ohraniti
% lastnost, da funkcija na njem alternirajoče spreminja predznak.
predznak = f(dodatna_tocka);
i = 1;
u=tocke;
for tocka=tocke
    if dodatna_tocka < tocka
        if f(tocka)*predznak > 0
            u = tocke;
            u(i) = dodatna_tocka;
            break;
        else
            u = tocke;
            u(i-1) = dodatna_tocka;
            break;
        end
    end
    i = i+1;
end
end

