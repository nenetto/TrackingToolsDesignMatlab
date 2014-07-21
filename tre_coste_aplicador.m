function coste = tre_coste_aplicador(X)
A = [70.77 -40 226];
B = [70.77 40 226];
C = [70.77 -40 335];

AB = B-A;
AC = C-A;
Npuntos = length(X)/2;

X_cart = zeros(Npuntos,3);
j = 1;
for i=1:Npuntos
   X_cart(i,:) = X(j)*AB + X(j+1)*AC  + A;
   j = j+2;
end

coste = tre_coste(X_cart);

end