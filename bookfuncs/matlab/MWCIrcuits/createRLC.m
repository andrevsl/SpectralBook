function Z=createRLC(freq,type,R,L,C)
    omega=2*pi.*freq;
    if strcmp(type,'Series')
        Z=R+1j.*omega.*L+1./(1j*omega.*C);
    end
    if strcmp(type,'Shunt')
        Zc=1./(1j*omega.*C);
        ZLind=1j*omega.*L;
        Z=addElecComponent(type,Zc,ZLind);
        Z=addElecComponent(type,Z,R);
    end
