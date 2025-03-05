function ZinNew=addElecComponent(type,Zin,Zadd)

    if strcmp(type,'Series')
        ZinNew=Zin+Zadd;
    end
    if strcmp(type,'Shunt')
        ZinNew=Zin.*Zadd./(Zin+Zadd);
    end
end

