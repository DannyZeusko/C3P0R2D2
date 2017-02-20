self = {}
local list = require ("listofentities")
local this = self


Entity = require ("Entities/Entity")
entities = {}--dumb hardcoded entities because we're going to have like 4 types. 
entityCount = 0 -- first 2 entities to be created must be players for a variety ofreasons

function self.main (dt)
    -- main logic loop for the game

    if (love.keyboard.isDown("kp1")) and entityCount < 1 then
        this.composeEntity2("player1") 
    end
    if (love.keyboard.isDown("kp2")) and entityCount == 1 then
        this.composeEntity2("player2")  
    end

    for i = 1, entityCount do
        Entity["update"](i, dt)
        print ("Updating an entity")
    end
    
end

function self.draw()

    cam:setPosition(Player1["x"] + Player2["x"] / 2, Player1["y"] + Player2["y"] / 2)

    level01.draw()
    for i = 1, entityCount do
        love.graphics.draw (Entity["spriteDown"][i],Entity["x"][i],Entity["y"][i],0,Entity["facing"][1],1,0,0,0,0)
    end
end

function this.composeEntity2 (type) --this spawns one instance of Entity, which now has lists for state
    entityCount = entityCount + 1                                -- this function will set default values for state based on the type parameter
    if type == "player1" then
        Entity.x[entityCount] = 0.0 
        Entity.y[entityCount] = 0.0
        Entity.speedx[entityCount] = 0.0
        Entity.speedy[entityCount] = 0.0
        Entity.speed[entityCount] = 30.0
        Entity.spriteUp[entityCount] = love.graphics.newImage("Assets/rhead.png") --temp values will replace for a more comprehensive solution later
        Entity.spriteDown[entityCount] = love.graphics.newImage("Assets/rhead.png")
        Entity.facing[entityCount] = 1.0
        Entity.is_player[entityCount] = true
        Entity.player[entityCount] = 1
        Entity.is_enemy[entityCount] = false
        Entity.has_ball[entityCount] = false
        Entity.is_ball[entityCount] = false
        Entity.ball_thrown[entityCount] = false
    end
    if type == "player2" then
        Entity.x[entityCount] = 0.0 
        Entity.y[entityCount] = 0.0
        Entity.speedx[entityCount] = 0.0
        Entity.speedy[entityCount] = 0.0
        Entity.speed[entityCount] = 30.0
        Entity.spriteUp[entityCount] = love.graphics.newImage("Assets/rhead.png") --temp values will replace for a more comprehensive solution later
        Entity.spriteDown[entityCount] = love.graphics.newImage("Assets/rhead.png")
        Entity.facing[entityCount] = 1.0
        Entity.is_player[entityCount] = true
        Entity.player[entityCount] = 2
        Entity.is_enemy[entityCount] = false
        Entity.has_ball[entityCount] = false
        Entity.is_ball[entityCount] = false
        Entity.ball_thrown[entityCount] = false
    end


end
function self.composeEntity (type)   -- depreciated
    entityCount = entityCount + 1
    entities[entityCount] = require ("Entities/Entity")
    entities[entityCount]["spriteUp"]  = love.graphics.newImage("Assets/Player.png")
    entities[entityCount]["spriteDown"] = love.graphics.newImage("Assets/Player.png") 

    if type == "player1" then
        entities[entityCount]["is_player"] = true
        entities[entityCount]["player"] = 1   
    end
    if type == "player2" then
        entities[entityCount]["is_player"] = true
        entities[entityCount]["player"] = 2   
    end     
end

return self
