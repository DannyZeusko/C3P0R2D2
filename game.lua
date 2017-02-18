self = {}
local list = require ("listofentities")
local this = self

entities = {}--dumb hardcoded entities because we're going to have like 4 types. No big deal

function self.main ()
    -- main logic loop for the game
    


    this.composeEntity("player")
end

function self.composeEntity (entityType)    
    for func in pairs(list[entityType]) do
        --print (list[entityType][1])
        local test = list[entityType][1]()
        test["update"]()
    end
end

return self
