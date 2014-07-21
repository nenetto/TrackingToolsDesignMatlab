function [A, INDx] = generarRejilla(N)

n = round(2^(N/2));
Zmin = 52.51;
Zmax = 66.49;
PHImax = pi;
PHImin = -pi+10e-2;

% Los N puntos se reparten en una rejilla de N/2    x    N/2



[PHI,Z] = meshgrid(linspace(PHImin,PHImax,n),linspace(Zmin,Zmax,n));

PHI = PHI(:);
Z = Z(:);

A = [PHI,Z];

INDx = combnk(1:length(A),6); % 6 puntos


end