function dmin = MinDistance(X_cart)

[m,~] = size(X_cart);

combinations = combnk(1:m,2);

Dvector = zeros(1,length(combinations));

for i = 1:length(combinations)
    
    a = X_cart(combinations(i,1),:);
    b = X_cart(combinations(i,2),:);
    Dvector(i) = norm(a-b);
end

dmin = min(Dvector);
end