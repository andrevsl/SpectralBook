classdef circuitNW   < matlab.System
    properties 
        componentsType={'Source'};
        componentsName={'Source'};
        value=0;
    end
   properties (SetAccess = private)
         % plotColor={'b','r','b','r','b','r','b','r','b','r',}
         plotLineWidth=2
         origin = [0, 0]
         newOrigin=[0,0]
         circuitid=[1]

   end
   methods
        function obj = circuitNW(varargin)
            % Support name-value pair arguments when constructing object
            setProperties(obj,nargin,varargin{:})
        end
        function obj = Add(obj,newobj)
            % Support name-value pair arguments when constructing object
            % obj.components=[obj.components,newobj];
            obj.newOrigin=[0,0];
            obj.componentsType={obj.componentsType,'Resistor'};
            obj.componentsName=0;
            obj.value=0;
            obj.circuitid=[obj.circuitid,obj.circuitid+1];
        end
        function obj = drawSource(obj,newobj)
            % Support name-value pair arguments when constructing object
            
        end
   end
end

