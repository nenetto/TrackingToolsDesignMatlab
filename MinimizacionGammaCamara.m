%% Inicialización del valor inicial para la minimización

Npuntos =  6;
Puntos_Iniciales_cartesianas = [ 18.095  , 55.691  , 62.736;...
    58.557  , 0       , 52.507;...
    47.373  , -34.419 , 120   ;...
    47.373  , -34.747  , 75.041;...
    -58.557 , 0       , 72.762;...
    -47.373 , 34.419  , 92.736;...
    ];

% Definición de las restricciones

Zmin = min(Puntos_Iniciales_cartesianas(:,3));
Zmax = max(Puntos_Iniciales_cartesianas(:,3));
RangoZ = Zmax-Zmin;
PHImax = pi;
PHImin = -pi+10e-2;
RangoPHI = PHImax-PHImin;
R = 58.75;


%% Minimización y búsqueda
[phi,rho,z] = cart2pol(Puntos_Iniciales_cartesianas(:,1),Puntos_Iniciales_cartesianas(:,2),Puntos_Iniciales_cartesianas(:,3));

x0 = zeros(1,Npuntos*2);
j = 1;
for i=1:Npuntos
   x0(j) =  phi(i);
   x0(j+1) =  z(i);
   j = j+2;
end


lb = [PHImin Zmin PHImin Zmin PHImin Zmin PHImin Zmin PHImin Zmin PHImin Zmin];
ub = [PHImax Zmax PHImax Zmax PHImax Zmax PHImax Zmax PHImax Zmax PHImax Zmax];
options = optimset('Algorithm','active-set','PlotFcns',@optimplotfval,'TolFun',1e-50,'MaxFunEvals',10e5,'MaxIter',10e3);

[x_sol,fval] = ... 
 fminsearchbnd(@tre_coste_regularizado_gammacamara,x0,[PHImin Zmin PHImin Zmin PHImin Zmin PHImin Zmin PHImin Zmin PHImin Zmin],[PHImax Zmax PHImax Zmax PHImax Zmax PHImax Zmax PHImax Zmax PHImax Zmax]);

[x_sol2,fval2] = ... 
 fminsearchbnd(@tre_coste_gammacamara,x0,[PHImin Zmin PHImin Zmin PHImin Zmin PHImin Zmin PHImin Zmin PHImin Zmin],[PHImax Zmax PHImax Zmax PHImax Zmax PHImax Zmax PHImax Zmax PHImax Zmax]);


%% Mostrar Solución
figure
disp('Solucion:')
[x,y,z] = pol2cart(x_sol(1:2:end),R*ones(1,Npuntos),x_sol(2:2:end));
scatter3(x,y,z,'o','LineWidth',3);

% [x2,y2,z2] = pol2cart(x_sol2(1:2:end),R*ones(1,Npuntos),x_sol2(2:2:end));
% scatter3(x2,y2,z2,'ok','LineWidth',3);
hold on;
scatter3(Puntos_Iniciales_cartesianas(:,1),Puntos_Iniciales_cartesianas(:,2),Puntos_Iniciales_cartesianas(:,3),'or','LineWidth',3)
legend('Optimized Markers','Original Markers')
scatter3(0,0,0,'ok','LineWidth',3);

N = 50;
% Define the figure to show under: a Cylinder
[PHI,Z] = meshgrid(linspace(0,2*pi,N),linspace(Zmin,Zmax,N/2));
[X,Y,Z] = pol2cart(PHI,R,Z);
surf(X,Y,Z,0.5*ones(size(Z)),'EdgeAlpha',0.1,'FaceAlpha',0.5)
axis equal
hold off

solucionGammacamara = [x',y',z'];

save solucionGammacamara


