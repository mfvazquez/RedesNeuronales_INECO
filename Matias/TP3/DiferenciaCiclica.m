function dif = DiferenciaCiclica(i, pos, N)

    dif1 = i - pos;
    dif2 = pos + N - i;
    dif = min([dif1 dif2]);

end
