function [SOLUCIONES,fvals,XINICIO] = buscarPorRejilla(N)
SOLUCIONES = [];
fvals = [];
XINICIO = [];
Zmin = 52.51;
Zmax = 66.49;
% RangoZ = Zmax-Zmin;
PHImax = pi;
PHImin = -pi+10e-2;
% RangoPHI = PHImax-PHImin;

[A,INDx] = generarRejilla(N);
[filasC,~] = size(INDx);
tic
for j=1:filasC
    
lb = [PHImin Zmin PHImin Zmin PHImin Zmin PHImin Zmin PHImin Zmin PHImin Zmin];
ub = [PHImax Zmax PHImax Zmax PHImax Zmax PHImax Zmax PHImax Zmax PHImax Zmax];


x0 = [ ] ;
for i=1:6
    
    x0 = [x0 A(INDx(j,i),:)];
    
end



 [x_sol3,fval] = ... 
 fminsearchbnd(@tre_coste_regularizado,x0,lb,ub);

if(fval < 6)
    XINICIO = [XINICIO ; x0];
    SOLUCIONES = [SOLUCIONES ; x_sol3];
    fvals = [fvals;fval];
    plot(fvals,'b','LineWidth',2)
    drawnow
    toc
end

end

plot(fvals)












end