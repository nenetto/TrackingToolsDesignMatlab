% Minimización paso a paso. 
% 
% Se comienza con 3 puntos únicamente y se minimizan sólo los 3 puntos a lo
% largo del volumen siguiendo las restricciones.
% Las restricciones para cada parámetro variarán un X%
%
% Cuando se llega a la solución, se fija, y se añade un punto más para la
% minimización y así sucesivamente.


% Primero se minimizan 3 puntos, luego 4, luego 5, etc... hasta N

%% Restricciones

BOLA = 0.3; % 30% de variación a lo largo de cada variable.

Puntos_Iniciales_cartesianas = [ 18.095  , 55.691  , 62.736;...
    58.557  , 0       , 52.507;...
    47.373  , -34.419 , 120   ;...
    47.373  , -58.67  , 75.041;...
    -58.557 , 0       , 72.762;...
    -47.373 , 34.419  , 92.736;...
    ];

Zmin = min(Puntos_Iniciales_cartesianas(:,3));
Zmax = max(Puntos_Iniciales_cartesianas(:,3));
RangoZ = Zmax-Zmin;
PHImax = pi;
PHImin = -pi+10e-2;
RangoPHI = PHImax-PHImin;
R = 58.75;



%% Minimización de 3 puntos.

% Función de coste: tre_coste
% Función de constrains: confun. Esta función controla que los puntos estén
% sobre el cilindro (detro de la superficie y cumpliendo la distancia
% mínima entre marcadores)

% phi0 = linspace(PHImin+RangoPHI*(BOLA),PHImax-RangoPHI*(BOLA),3)';
% z0 = linspace(Zmin+RangoZ*(BOLA),Zmax-RangoZ*(BOLA),3)';
%x0 = [phi0, z0];

%x0 = Puntos_Iniciales_cartesianas(1:3,:);
x0 = Puntos_Iniciales_cartesianas;
x0 = params2pol(x0);


x0 = x0(:);

% lb = [];
% ub = [];
% 
% for i=1:(length(x0)/2)
%    lb = [lb phi0(i)*(1+BOLA) z0(i)*(1+BOLA)];
%    up = [ub phi0(i)*(1-BOLA) z0(i)*(1-BOLA)];
% end

lb = [PHImin Zmin PHImin Zmin PHImin Zmin PHImin Zmin PHImin Zmin PHImin Zmin];
ub = [PHImax Zmax PHImax Zmax PHImax Zmax PHImax Zmax PHImax Zmax PHImax Zmax];


% x0 = [ ] ;
% for i=1:6
%     x0 = [x0 (abs(random('Normal',0,1))*RangoPHI+PHImin)  (abs(random('Normal',0,1))*RangoZ + Zmin)];
% end
% 
% x0
% 



options = optimset('Algorithm','active-set','PlotFcns',@optimplotfval,'TolFun',1e-50,'MaxFunEvals',10e5,'MaxIter',10e3);

%options = optimset('PlotFcns',@optimplotfval,'TolFun',1e-50,'MaxFunEvals',10e5,'MaxIter',10e3);

% minimizacion
%  [x_sol3,fval] = ... 
%  fmincon(@tre_coste_regularizado,x0,[],[],[],[],lb,ub,@confun,options);
 [x_sol3,fval] = ... 
 fminsearchbnd(@tre_coste_regularizado,x0,[PHImin Zmin PHImin Zmin PHImin Zmin PHImin Zmin PHImin Zmin PHImin Zmin],[PHImax Zmax PHImax Zmax PHImax Zmax PHImax Zmax PHImax Zmax PHImax Zmax])

%% Mostrar Solución
disp('Solucion:')
x = reshape(x_sol3,2,6)';
solucion = params2cart(x);
x_orig = reshape(x0,2,6)';
xorig = params2cart(x_orig);
figure
mostrar_cilindro(solucion,xorig)




















