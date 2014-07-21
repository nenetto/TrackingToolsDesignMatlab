function CART = params2cart(X)

RHO = 58.75; % Radio del cilindro
[X,Y,Z] = pol2cart(X(:,1),X(:,1)*0+RHO,X(:,2));
CART = [X Y Z];

end