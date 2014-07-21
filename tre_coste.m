function coste = tre_coste(X_cart)
%f(X) = sumatorio(k=1:3){ dk(X)/fk(X) } Simplificación de la función de
%coste TRE, ya que solo depende de la distribución de los marcadores, y no
%del FLE determinado por el sistema de posicionamiento.

[m,n]=size(X_cart);

X_cart_centered = mean(X_cart);
for i=1:(m-1)
   X_cart_centered = [X_cart_centered; mean(X_cart)];
end
X_cart_centered = X_cart-X_cart_centered;

[~,~,ejes_principales] = svd(X_cart_centered); %obtención de los ejes principales

ejes_principales = ejes_principales'; % Corrección de Vero.

% Calculo de los dk
dk = zeros(1,3);


[~,b]=size(ejes_principales(1,:));
for k = 1:3
     if (b == 2)
         disp('stop');
     end
    dk(k) = norm(cross(ejes_principales(k,:),mean(X_cart)));
end  

% Calculo de los fk (distancia rms)
fk = zeros(m,n);


for i= 1: m 
    for k = 1:3
    fk(i,k) = norm(cross(ejes_principales(k,:),X_cart_centered(i,:)));
    end  
end

fk = rms(fk);
% Calculo final del TRE
coste =  sum((dk./fk).^2);
end