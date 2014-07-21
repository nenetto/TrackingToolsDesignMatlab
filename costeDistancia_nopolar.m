function coste = costeDistancia_nopolar(X,dLIM)

dmin = MinDistance_nopolar(X);

if dmin < dLIM
    coste = 10^6*(dLIM-dmin);
else
    coste = 0;
end
end