function [c,ceq] = confun(X)

Dmin2 = 30^2; % 3cm entre marcadores m�nimo
% R2 = 58.75^2;

%Paso de par�metros a cartesianas
N = length(X)/2;
X_pol = reshape(X,N,2);
X_cart = params2cart(X_pol);
x = X_cart(:);
Zmin = 52.51;
Zmax = 66.49;



% Nonlinear inequality constraints
c = [...
%         Zmin-x(3);...
%         Zmin-x(6);...
%         Zmin-x(9);...
%         Zmin-x(12);...
%         Zmin-x(15);...
%         Zmin-x(18);...
%         x(3)-Zmax;...
%         x(6)-Zmax;...
%         x(9)-Zmax;...
%         x(12)-Zmax;...
%         x(15)-Zmax;...
%         x(18)-Zmax;...     
    ];

% Nonlinear equality constraints
ceq = [...
%         Zmin-x(3);...
%         Zmin-x(6);...
%         Zmin-x(9);...
%         Zmin-x(12);...
%         Zmin-x(15);...
%         Zmin-x(18);...
% %         x(3)-Zmax;...
% %         x(6)-Zmax;...
% %         x(9)-Zmax;...
% %         x(12)-Zmax;...
% %         x(15)-Zmax;...
% %         x(18)-Zmax;...
    

];
% ceq = [...
%         x(1)*x(1) + x(2)*x(2) + R2;...
%         x(4)*x(4) + x(5)*x(5) + R2;...
%         x(7)*x(7) + x(8)*x(8) + R2;...
%         x(10)*x(10) + x(11)*x(11) + R2;...
%         x(13)*x(13) + x(14)*x(14) + R2;...
%         x(16)*x(16) + x(17)*x(17) + R2;...
%         ];

end