function coste = costeDistancia(X,dLIM)

dmin = MinDistance(X);

if dmin < dLIM
    coste = 10^6*(dLIM-dmin);
else
    coste = 0;
end
end