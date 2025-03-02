function ZinNew=addMatching(type,Zin,Zadd)
    if type=='Series'
        ZinNew=Zin+Zadd;
    else if type=='Shunt'
        ZinNew=Zin*Zadd/(Zin+Zadd);
    end
    end

