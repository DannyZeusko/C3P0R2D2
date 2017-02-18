self = {}
local list = require ("listofentities")
local this = self

entities = {}

function self.main ()
    -- main logic loop for the game
    --print (list["player"][1])


    this.composeEntity("player")
end

function self.composeEntity (entityType)
    for func in pairs(list[entityType]) do
        print (func)
    end
end

return self
