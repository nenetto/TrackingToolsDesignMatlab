function coste = tre_coste_regularizado_gammacamara(X)

N = length(X)/2;

X_pol = reshape(X,2,N)'; % reformateo de la matriz de puntos
X_cart = params2cart(X_pol);% paso a cartesianas


coste = tre_coste(X_cart);
Dmin = 30;
coste = coste + costeDistancia(X_cart,Dmin);

end