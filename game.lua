self = {}
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
    if (love.keyboard.isDown("kp3")) then
        this.composeEntity2("player2")  
    end

    for i = 1, entityCount do
        Entity["update"](i, dt)
        print ("Updating an entity")
    end
    
end

function self.draw()

    cam:setPosition(Player1["x"] + Player2["x"] / 2, Player1["y"] + Player2["y"] / 2)

    cam:draw(function(l,t,w,h)
        level01.draw()
        for i = 1, entityCount do
            love.graphics.setColor( Entity["colour"][i]['r'], Entity["colour"][i]['g'], Entity["colour"][i]['b'], Entity["colour"][i]['a'] )
            love.graphics.draw (Entity["headDown"][i],Entity["x"][i],Entity["y"][i],0,Entity["facing"][1],1,0,0,0,0)
        end
    end)
end

function this.composeEntity2 (type) --this spawns one instance of Entity, which now has lists for state
    entityCount = entityCount + 1                                -- this function will set default values for state based on the type parameter
    if type == "player1" then
        Entity.x[entityCount] = 0.0 
        Entity.y[entityCount] = 0.0
        Entity.speedx[entityCount] = 0.0
        Entity.speedy[entityCount] = 0.0
        Entity.speed[entityCount] = 60.0
        Entity.headUp[entityCount] = love.graphics.newImage("Assets/rhead.png") --temp values will replace for a more comprehensive solution later
        Entity.headDown[entityCount] = love.graphics.newImage("Assets/rhead.png")
        Entity.bodyUp[entityCount] = love.graphics.newImage("Assets/rbody.png") 
        Entity.bodyDown[entityCount] = love.graphics.newImage("Assets/rbody.png")
        Entity.rarm[entityCount] = love.graphics.newImage("Assets/rarm.png") 
        Entity.rhand[entityCount] = love.graphics.newImage("Assets/rhand.png") 
        Entity.bottom[entityCount] = love.graphics.newImage("Assets/rarm.png") 
        Entity.offset[entityCount] = {head = {x = 0, y = 25}, body = {x = 0, y = 0}, rarm = {x = 25, y = 0}, larm = {x = -25, y = 0}, rhand = {x = 25, y = -20}, lhand = {x = -25, y = -20}, bottom = {x = -25, y = 0}}
        Entity.facing[entityCount] = 1.0
        Entity.colour[entityCount] = {r = 255, g = 255, b = 255, a = 255}
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
        Entity.speed[entityCount] = 60.0
        Entity.headUp[entityCount] = love.graphics.newImage("Assets/rhead.png")
        Entity.headDown[entityCount] = love.graphics.newImage("Assets/rhead.png")
        Entity.bodyUp[entityCount] = love.graphics.newImage("Assets/rbody.png") 
        Entity.bodyDown[entityCount] = love.graphics.newImage("Assets/rbody.png")
        Entity.rarm[entityCount] = love.graphics.newImage("Assets/rarm.png") 
        Entity.rhand[entityCount] = love.graphics.newImage("Assets/rhand.png") 
        Entity.bottom[entityCount] = love.graphics.newImage("Assets/rarm.png") 
        Entity.offset[entityCount] = {head = {x = 0, y = 25}, body = {x = 0, y = 0}, rarm = {x = 25, y = 0}, larm = {x = -25, y = 0}, rhand = {x = 25, y = -20}, lhand = {x = -25, y = -20}, bottom = {x = -25, y = 0}}
        Entity.facing[entityCount] = 1.0
        Entity.colour[entityCount] = {r = 255, g = 255, b = 255, a = 255}
        Entity.is_player[entityCount] = true
        Entity.player[entityCount] = 2
        Entity.is_enemy[entityCount] = false
        Entity.has_ball[entityCount] = false
        Entity.is_ball[entityCount] = false
        Entity.ball_thrown[entityCount] = false
    end
    if type == "enemy" then
        Entity.x[entityCount] = 0.0 
        Entity.y[entityCount] = 0.0
        Entity.speedx[entityCount] = 0.0
        Entity.speedy[entityCount] = 0.0
        Entity.speed[entityCount] = 60.0
        Entity.headUp[entityCount] = love.graphics.newImage("Assets/rhead.png")
        Entity.headDown[entityCount] = love.graphics.newImage("Assets/rhead.png")
        Entity.bodyUp[entityCount] = love.graphics.newImage("Assets/rbody.png") 
        Entity.bodyDown[entityCount] = love.graphics.newImage("Assets/rbody.png")
        Entity.rarm[entityCount] = love.graphics.newImage("Assets/rarm.png") 
        Entity.rhand[entityCount] = love.graphics.newImage("Assets/rhand.png") 
        Entity.bottom[entityCount] = love.graphics.newImage("Assets/rarm.png") 
        Entity.offset[entityCount] = {head = {x = 0, y = 25}, body = {x = 0, y = 0}, rarm = {x = 25, y = 0}, larm = {x = -25, y = 0}, rhand = {x = 25, y = -20}, lhand = {x = -25, y = -20}, bottom = {x = -25, y = 0}} 
        Entity.facing[entityCount] = 1.0
        Entity.colour[entityCount] = {r = 255, g = 255, b = 255, a = 255}
        Entity.is_player[entityCount] = false
        Entity.player[entityCount] = nil
        Entity.is_enemy[entityCount] = true
        Entity.has_ball[entityCount] = false
        Entity.is_ball[entityCount] = false
        Entity.ball_thrown[entityCount] = false
    end
    if type == "ball" then
        Entity.x[entityCount] = 0.0 
        Entity.y[entityCount] = 0.0
        Entity.speedx[entityCount] = 0.0
        Entity.speedy[entityCount] = 0.0
        Entity.speed[entityCount] = 60.0
        Entity.headUp[entityCount] = love.graphics.newImage("Assets/rhead.png") --only needs one sprite
        Entity.facing[entityCount] = 1.0
        Entity.colour[entityCount] = {r = 255, g = 255, b = 255, a = 255}
        Entity.is_player[entityCount] = false
        Entity.player[entityCount] = nil
        Entity.is_enemy[entityCount] = false
        Entity.has_ball[entityCount] = false
        Entity.is_ball[entityCount] = true
        Entity.ball_thrown[entityCount] = false
    end


end

return self
