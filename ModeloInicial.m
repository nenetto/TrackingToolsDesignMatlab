%% Posición de los marcadores en la gammacámara

%  	Marcador 1	Marcador 2	Marcador 3	Marcador 4	Marcador 5	Marcador 6
% X	18,095	58,557	47,373	47,373	-58,557	-47,373
% Y	55,691	0	    -34,419	-58,67	0	     34,419
% Z	62,736	52,507	120	     75,041	72,762	92,736

% Estas posiciones son las originales. Su diseño fue mediante la traza de
% una espiral a lo largo de la sección del cilindro donde se colocaban los
% marcadores

N = 6;
OriginalMarkers =[ 18.095  , 55.691  , 62.736;...
    58.557  , 0       , 52.507;...
    47.373  , -34.419 , 120   ;...
    47.373  , -58.67  , 75.041;...
    -58.557 , 0       , 72.762;...
    -47.373 , 34.419  , 92.736;...
    ];

%% Dimensiones de la gammacámara

% Cilindro de diámetro 100 mm
% Longitud: 193 mm

H = 300;

% % Definir los vértices de la cara superior
% rho = 50*ones(1,H);
% theta = linspace(-pi,pi,H);
% z = zeros(1,H);
% [x,y,z] = pol2cart(theta,rho,z);
% SupFace = patch(x,y,z,'r');
% 
% % Definir los vértices de la cara inferior
% rho = 50*ones(1,H);
% theta = linspace(-pi,pi,H);
% z = 193*ones(1,H);
% [x,y,z] = pol2cart(theta,rho,z);
% InfFace = patch(x,y,z,'r');
% 
% 


RHO = 50; 
[THETA,Z] = meshgrid(linspace(-pi,pi,H),linspace(0,193));
[X,Y,Z] = pol2cart(THETA,RHO,Z);

surf(X,Y,Z)

















