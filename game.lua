self = {}
local list = require ("listofentities")
local this = self

entities = {}--dumb hardcoded entities because we're going to have like 4 types. 
entityCount = 0 -- first 2 entities to be created must be players for a variety ofreasons

function self.main (dt)
    -- main logic loop for the game

if (love.keyboard.isDown("kp1")) then
    this.composeEntity("player1") 
end
if (love.keyboard.isDown("kp2")) then
    this.composeEntity("player2") 
end
    for i = 1, entityCount do
        entities[i]["update"](dt)
    end
    
end

function self.draw()
    level01.draw()
    for i = 1, entityCount do
        entities[i]["draw"]()
    end
end

function self.composeEntity (type)   -- requires a deep copy of Entity for truely new instance, otherwise all entities will be references to one object
    entityCount = entityCount + 1
    --local template = require ("Entities/Entity")
    ---local temp = {}
    --for i, #template do

    --end

    --entities[entityCount] = require ("Entities/Entity")
    entities[entityCount] = this.deepCopy(require ("Entities/Entity"))
    print (require ("Entities/Entity"))
    entities[entityCount]["self"] = entities[entityCount]
    entities[entityCount]["spriteUp"]  = love.graphics.newImage("Assets/Player.png")
    entities[entityCount]["spriteDown"] = love.graphics.newImage("Assets/Player.png") 
    print(entities[entityCount])

    if type == "player1" then
        entities[entityCount]["is_player"] = true
        entities[entityCount]["player"] = 1   
    end
    if type == "player2" then
        entities[entityCount]["is_player"] = true
        entities[entityCount]["player"] = 2   
    end     
end

function self.deepCopy(original)
    local copy = {}
    for k, v in pairs(original) do
        if type(v) == 'table' then
            v = deepCopy(v)
        end
        copy[k] = v
    end
    return copy
end

return self
