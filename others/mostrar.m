function mostrar_cilindro(solucion,OriginalMarkers)

% Show the solution markers
scatter3(solucion(:,1),solucion(:,2),solucion(:,3),'o','LineWidth',3);
hold on
% Show the old markers
scatter3(OriginalMarkers(:,1),OriginalMarkers(:,2),OriginalMarkers(:,3),'or','LineWidth',3)
legend('Optimized Markers','Original Markers')

% Define the figure to show under: a Cylinder
N = 100;
Zmin = 52.51;
Zmax = 66.49;
R = 58.75;
[PHI,Z] = meshgrid(linspace(0,2*pi,N),linspace(Zmin,Zmax,N/2));
[X,Y,Z] = pol2cart(PHI,R,Z);
surf(X,Y,Z,0.5*ones(size(Z)),'EdgeAlpha',0.1)
hold off


end