function coste = tre_coste_regularizado(X)

coste = tre_coste(X);
Dmin = 30;
coste = coste + costeDistancia(X,Dmin);

end