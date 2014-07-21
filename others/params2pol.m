function POLAR = params2pol(X)

[m,~] = size(X);
PHI = zeros(m,1);
for i=1:m
    PHI(i) = atan2(X(i,2),X(i,1));
end

Z = X(:,3);

POLAR = [PHI Z];


end