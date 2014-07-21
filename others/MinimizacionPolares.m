% Minimizaci�n en coordenadas polares

% x = [phi1 z1;...
%      phi2 z2;...
%      phi3 z3;...
%      phi4 z4;...
%      phi5 z5;...
%      phi6 z6;...
%      ]

%Condiciones de l�mite para los PHI y Z de los marcadores

Zmin = 52.51;
Zmax = 66.49;
R = 58.75;

% lb = [pi/2 Zmin -pi Zmin -pi Zmin 0 Zmin 0 Zmin 0 Zmin];
% ub = [pi/2 Zmax  0 Zmax  0 Zmax  pi Zmax  pi Zmax  pi Zmax];

lb = [];
up = [];

Puntos_Iniciales_cartesianas = [ 18.095  , 55.691  , 62.736;...
    58.557  , 0       , 52.507;...
    47.373  , -34.419 , 120   ;...
    47.373  , -58.67  , 75.041;...
    -58.557 , 0       , 72.762;...
    -47.373 , 34.419  , 92.736;...
    ];

x0 = params2pol(Puntos_Iniciales_cartesianas);
x0 = x0(:); %% Se pasa como vector


% funci�n de coste: tre_coste. Calcula el error multiplicador al error FLE
% en funci�n de la distribuci�n de puntos en el punto (0,0,0), donde
% estar�a el centro de la gammac�mara

% funci�n de condiciones: confun. Condici�n de distancia m�nima entre
% puntos marcadores

lb = [];
ub = [];
options = optimset('Algorithm','active-set','PlotFcns',@optimplotfval,'TolX',1e-50,'TolCon',1e-6,'MaxFunEvals',10e5,'MaxIter',10e3);

% minimizacion
[x,fval] = ... 
fmincon(@tre_coste,x0,[],[],[],[],lb,ub,@confun,options);

disp('Solucion:')
x = reshape(x,6,2);
solucion = params2cart(x)
figure
mostrar(solucion)
