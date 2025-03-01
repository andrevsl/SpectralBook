function ZinNew=addMatching(type,Zin,Z)
    if type=='Series'
        ZinNew=Zin+Z;
    else if type=='Shunt'
        ZinNew=Zin*Z/(Zin+Z);
    end
    end

