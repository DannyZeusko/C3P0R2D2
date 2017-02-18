self = {}
local this  = self

self.entities = {}


function self.makenew() --this function returns a list which is the actual component
return {x = 0.0, y = 0.0, update = function() print("printed from component logic") end}

end  

function self.update()
    print("there's an object with an example component")
end

return self