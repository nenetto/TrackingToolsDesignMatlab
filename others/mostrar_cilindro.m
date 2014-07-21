function mostrar_cilindro(solucion,OriginalMarkers)

% Show the solution markers
scatter3(solucion(:,1),solucion(:,2),solucion(:,3),'o','LineWidth',3);
hold on
% Show the old markers
scatter3(OriginalMarkers(:,1),OriginalMarkers(:,2),OriginalMarkers(:,3),'or','LineWidth',3)
legend('Optimized Markers','Original Markers')

% Define the figure to show under: a Cylinder

Puntos_Iniciales_cartesianas = [ 18.095  , 55.691  , 62.736;...
    58.557  , 0       , 52.507;...
    47.373  , -34.419 , 120   ;...
    47.373  , -58.67  , 75.041;...
    -58.557 , 0       , 72.762;...
    -47.373 , 34.419  , 92.736;...
    ];
N = 100;
Zmin = min(Puntos_Iniciales_cartesianas(:,3));
Zmax = max(Puntos_Iniciales_cartesianas(:,3));
R = 58.75;
[PHI,Z] = meshgrid(linspace(0,2*pi,N),linspace(Zmin,Zmax,N/2));
[X,Y,Z] = pol2cart(PHI,R,Z);
surf(X,Y,Z,0.5*ones(size(Z)),'EdgeAlpha',0.1)
hold off


end