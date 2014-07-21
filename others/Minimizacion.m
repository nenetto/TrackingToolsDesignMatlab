% Minimización y búsqueda de la posición

%Condiciones de límite para los PHI y Z de los marcadores

Zmin = 52.51;
Zmax = 66.49;
R = 58.75;

lb = [-R -R Zmin -R -R Zmin -R -R Zmin -R -R Zmin -R -R Zmin -R -R Zmin];
ub = [ R  R Zmax  R  R Zmax  R  R Zmax  R  R Zmax  R  R Zmax  R  R Zmax];

Puntos_Iniciales = [18.095  , 55.691  , 62.736;...
                    58.557  , 0       , 52.507;...
                    47.373  , -34.419 , 120   ;...
                    47.373  , -58.67  , 75.041;...
                    -58.557 , 0       , 72.762;...
                    -47.373 , 34.419  , 92.736;...
                    ];


%%
%x0 = params2pol(Puntos_Iniciales);
x0 = Puntos_Iniciales(:);
options = optimset('Algorithm','active-set','PlotFcns',@optimplotfval,'TolX',1e-50,'TolCon',1e-6,'MaxFunEvals',10e5,'MaxIter',10e3);
%options = optimset('Algorithm','active-set','PlotFcns',@mostrar,'TolX',1e-50,'TolCon',1e-6,'MaxFunEvals',10e5,'MaxIter',10e3);


[x,fval] = ... 
fmincon(@tre_coste_regularizado,x0,[],[],[],[],lb,ub,@confun,options);


disp('Solucion:')
solucion = reshape(x,6,3)
figure
mostrar(solucion)




