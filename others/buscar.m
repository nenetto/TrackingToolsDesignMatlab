function [SOLUCIONES,fvals,XINICIO] = buscar(N)
SOLUCIONES = [];
fvals = [];
XINICIO = [];
Zmin = 52.51;
Zmax = 66.49;
RangoZ = Zmax-Zmin;
PHImax = pi;
PHImin = -pi+10e-2;
RangoPHI = PHImax-PHImin;

for j=1:N
lb = [PHImin Zmin PHImin Zmin PHImin Zmin PHImin Zmin PHImin Zmin PHImin Zmin];
ub = [PHImax Zmax PHImax Zmax PHImax Zmax PHImax Zmax PHImax Zmax PHImax Zmax];


x0 = [ ] ;
for i=1:6
    x0 = [x0 (abs(random('Normal',0,1))*RangoPHI+PHImin)  (abs(random('Normal',0,1))*RangoZ + Zmin)];
end



 [x_sol3,fval] = ... 
 fminsearchbnd(@tre_coste_regularizado,x0,lb,ub);

if(fval < 10)
    XINICIO = [XINICIO ; x0];
    SOLUCIONES = [SOLUCIONES ; x_sol3];
    fvals = [fvals;fval]
end

end

plot(fvals)


end