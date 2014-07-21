function coste = costeBounds(x)

coste = 0;
Zmin = 52.51;
Zmax = 66.49;

PHImax = pi;
PHImin = -pi+10e-2;


if x(1) < PHImin
    coste = coste + 10^6*abs(PHImin-x(1));
end
if x(3) < PHImin
    coste = coste + 10^6*abs(PHImin-x(3));
end
if x(5) < PHImin
    coste = coste + 10^6*abs(PHImin-x(5));    
end
if x(1) > PHImax
    coste = coste + 10^6*abs(PHImax-x(1));    
end
if x(3) > PHImax
    coste = coste + 10^6*abs(PHImax-x(3));    
end
if x(5) > PHImax
    coste = coste + 10^6*abs(PHImax-x(5));    
end
    
if x(2) < Zmin
    coste = coste + 10^6*abs(Zmin-x(2));
end
if x(4) < Zmin
    coste = coste + 10^6*abs(Zmin-x(4));
end
if x(6) < Zmin
    coste = coste + 10^6*abs(Zmin-x(6));    
end
if x(2) > Zmax
    coste = coste + 10^6*abs(Zmax-x(2));    
end
if x(4) > Zmax
    coste = coste + 10^6*abs(Zmax-x(4));    
end
if x(6) > Zmax
    coste = coste + 10^6*abs(Zmax-x(6));    
end    

if coste == 0
    coste = -10e6;
end

end