self = {}
local this = self
local Entity = require ("Entities/Entity")

entityCount = 0 -- first 2 entities to be created must be players for a variety ofreasons

function self.main (dt)
    -- main logic loop for the game

if (love.keyboard.isDown("kp1")) then
    this.composeEntity2("player1") 
end
if (love.keyboard.isDown("kp2")) then
    this.composeEntity2("player2") 
end
    for i = 1, entityCount do
        entities[i]["update"](dt)
    end
    
end

function self.draw()
    level01.draw()
    for i = 1, entityCount do
        Entity[i]["draw"](i)
    end
end

function self.composeEntity2 (type) --this spawns one instance of Entity, which now has lists for state
    entityCount = entityCount + 1                                -- this function will set default values for state based on the type parameter
    if type == "player1" then
        Entity.x[entityCount] = 0.0 
        Entity.y[entityCount] = 0.0
        Entity.speedx[entityCount] = 0.0
        Entity.speedy[entityCount] = 0.0
        Entity.speed[entityCount] = 30.0
        Entity.spriteUp[entityCount] = love.graphics.newImage("Assets/Player.png") --temp values will replace for a more comprehensive solution later
        Entity.spriteDown[entityCount] = love.graphics.newImage("Assets/Player.png")
        Entity.facing[entityCount] = 1.0
        Entity.is_player[entityCount] = true
        Entity.player[entityCount] = 1
        Entity.is_enemy[entityCount] = false
        Entity.has_ball[entityCount] = false
        Entity.is_ball[entityCount] = false
        Entity.bal_thrown[entityCount] = false
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
            v = this.deepCopy(v)
        end
        copy[k] = v
    end
    return copy
end

return self
